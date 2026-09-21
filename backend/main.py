import os
import ast
import math
import threading
import time
import webbrowser
import uvicorn
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import List, Optional
from supabase import create_client, Client
from embeddings import generar_embedding

# ==========================================
# CONFIGURACIÓN DE SUPABASE
# ==========================================
load_dotenv()

# IMPORTANTE: Configura estas dos variables en tu archivo .env
SUPABASE_URL = os.environ.get("SUPABASE_URL", "TU_SUPABASE_URL_AQUI")
SUPABASE_KEY = os.environ.get("SUPABASE_KEY", "TU_SUPABASE_KEY_AQUI")

# Inicializar cliente de Supabase (solo si hay credenciales válidas)
supabase: Client = None
if SUPABASE_URL != "TU_SUPABASE_URL_AQUI" and SUPABASE_KEY != "TU_SUPABASE_KEY_AQUI":
    try:
        supabase = create_client(SUPABASE_URL, SUPABASE_KEY)
    except Exception as e:
        print(f"Error al conectar con Supabase: {e}")

# ==========================================
# CONFIGURACIÓN DE FASTAPI
# ==========================================
app = FastAPI(title="Comparador de Coches Fácil")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Permitir peticiones desde cualquier origen (ej. frontend en Vite)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

GEMINI_API_KEY = os.environ.get("GEMINI_API_KEY")

class ChatMessage(BaseModel):
    role: str
    content: str

class ChatRequest(BaseModel):
    message: str
    history: List[ChatMessage] = Field(default_factory=list)

# Servir carpeta templates estáticamente (si tuvieras más archivos)
# app.mount("/static", StaticFiles(directory="static"), name="static")

# La ruta raíz ya no sirve el HTML, ahora lo hace el frontend en React.
@app.get("/")
async def serve_index():
    return {"mensaje": "API de Comparador de Coches funcionando. El frontend corre en el puerto 5173."}

@app.get("/api/marcas")
async def get_marcas():
    """Devuelve la lista de marcas disponibles para el filtro."""
    if not supabase:
        return []
    
    response = supabase.table("marcas").select("id_marca, nombre").execute()
    return response.data

@app.get("/api/coches")
async def get_coches(
    marca: Optional[List[int]] = Query(default=None),
    combustible: Optional[List[str]] = Query(default=None),
    carroceria: Optional[str] = None,
    precio_min: Optional[float] = None,
    precio_max: Optional[float] = None,
    maletero_min: Optional[int] = None,
    potencia_min: Optional[int] = None,
    consumo_max: Optional[float] = None,
    largo_max: Optional[int] = None,
    autonomia_min: Optional[int] = None,
    busqueda: Optional[str] = None
):
    """Devuelve los coches aplicando los filtros proporcionados."""
    if not supabase:
        return []
    
    # Construimos la consulta base haciendo join con marcas y fuentes_modelo
    query = supabase.table("modelos").select("*, marcas(*), fuentes_modelo(*)")
    
    # Aplicamos los filtros condicionalmente
    if marca:
        # Lista de ids de marca seleccionados
        query = query.in_("id_marca", marca)
        
    if combustible:
        # 'combustible' es ahora una lista de strings
        query = query.in_("combustible", combustible)
        
    if autonomia_min is not None:
        query = query.gte("autonomia_km", autonomia_min)
        
    if carroceria:
        query = query.eq("carroceria", carroceria)

    if precio_min is not None:
        query = query.gte("precio_base", precio_min)
        
    if precio_max is not None:
        query = query.lte("precio_base", precio_max)
        
    if maletero_min is not None:
        query = query.gte("maletero_litros", maletero_min)

    if potencia_min is not None:
        query = query.gte("cv", potencia_min)
        
    if consumo_max is not None:
        query = query.lte("consumo", consumo_max)
        
    if largo_max is not None:
        query = query.lte("largo", largo_max)
        
    if busqueda:
        # Buscamos en el nombre del modelo
        query = query.ilike("nombre", f"%{busqueda}%")
        
    # Ordenamos por precio de menor a mayor
    query = query.order("precio_base", desc=False)
    
    response = query.execute()
    return response.data

def _vector_as_list(value):
    if isinstance(value, str):
        try:
            value = ast.literal_eval(value)
        except (ValueError, SyntaxError):
            return []
    return value if isinstance(value, list) else []

def _cosine_similarity(first, second):
    if len(first) != len(second) or not first:
        return 0
    dot_product = sum(a * b for a, b in zip(first, second))
    first_norm = math.sqrt(sum(value * value for value in first))
    second_norm = math.sqrt(sum(value * value for value in second))
    return dot_product / (first_norm * second_norm) if first_norm and second_norm else 0

def _get_relevant_cars(message, limit=6):
    question_embedding = generar_embedding(message)
    embeddings = supabase.table("modelos_embeddings").select("id_modelo, embedding").execute().data
    ranked_ids = sorted(
        (
            (
                _cosine_similarity(question_embedding, _vector_as_list(row.get("embedding"))),
                row.get("id_modelo"),
            )
            for row in embeddings
        ),
        reverse=True,
    )[:limit]
    ids = [model_id for _, model_id in ranked_ids if model_id is not None]
    if not ids:
        return []

    cars = supabase.table("modelos").select("*, marcas(nombre)").in_("id_modelo", ids).execute().data
    cars_by_id = {car["id_modelo"]: car for car in cars}
    return [cars_by_id[model_id] for model_id in ids if model_id in cars_by_id]

def _car_context(cars):
    return "\n".join(
        f"- {car.get('marcas', {}).get('nombre', 'Marca desconocida')} {car.get('nombre', '')} "
        f"({car.get('anio', 'sin año')}): {car.get('combustible', 'sin combustible')}, "
        f"{car.get('cv', '?')} CV, {car.get('consumo', '?')} consumo, "
        f"{car.get('autonomia_km', '?')} km de autonomía, "
        f"{car.get('maletero_litros', '?')} L de maletero, "
        f"{car.get('precio_base', '?')} euros."
        for car in cars
    )

@app.post("/api/chat")
async def chat(request: ChatRequest):
    if not request.message.strip():
        raise HTTPException(status_code=400, detail="Escribe una pregunta para empezar.")
    if not supabase:
        raise HTTPException(status_code=503, detail="La base de datos de Supabase no está configurada.")

    try:
        # Obtiene los coches más parecidos vectorialmente usando SentenceTransformers + Cosine Similarity
        relevant_cars = _get_relevant_cars(request.message, limit=3)
        
        if not relevant_cars:
            return {
                "answer": "No hemos encontrado ningún coche en el catálogo que coincida con tus criterios de búsqueda.",
                "sources": []
            }

        # Genera una respuesta formateada en texto claro directamente con Python
        lista_coches_texto = "\n".join([
            f"• {car.get('marcas', {}).get('nombre', '')} {car.get('nombre', '')}: "
            f"{car.get('cv', '?')} CV, {car.get('combustible', 'N/D')}, "
            f"Consumo: {car.get('consumo', '?')} L/100km, "
            f"Maletero: {car.get('maletero_litros', '?')} L - {car.get('precio_base', '?')} €"
            for car in relevant_cars
        ])

        answer = (
            f"Según nuestro análisis de similitud vectorial, los coches que mejor se adaptan "
            f"a tu búsqueda (\"{request.message}\") son:\n\n{lista_coches_texto}"
        )

        sources = [
            {
                "id_modelo": car["id_modelo"],
                "nombre": f"{car.get('marcas', {}).get('nombre', '')} {car.get('nombre', '')}".strip(),
            }
            for car in relevant_cars
        ]

        # Retorna la respuesta con la estructura exacta que espera tu Frontend
        return {
            "answer": answer,
            "sources": sources,
            "cars": relevant_cars
        }

    except Exception as error:
        print(f"Error en la búsqueda vectorial: {error}")
        raise HTTPException(status_code=500, detail="Error al procesar la búsqueda vectorial.") from error

# ==========================================
# PUNTO DE ENTRADA
# ==========================================
if __name__ == "__main__":
    print("Iniciando la aplicación Comparador de Coches (Backend API)...")
    
    if SUPABASE_URL == "TU_SUPABASE_URL_AQUI" or SUPABASE_KEY == "TU_SUPABASE_KEY_AQUI":
        print("="*60)
        print("⚠️ ADVERTENCIA: No has configurado las credenciales de Supabase.")
        print("Abre o crea el archivo .env y configura SUPABASE_URL y SUPABASE_KEY.")
        print("La aplicación se abrirá, pero no devolverá ningún coche.")
        print("="*60)
        
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
