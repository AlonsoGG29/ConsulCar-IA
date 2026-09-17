import os
import threading
import time
import webbrowser
import uvicorn
from dotenv import load_dotenv
from fastapi import FastAPI, Query
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
from supabase import create_client, Client

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

# Servir carpeta templates estáticamente (si tuvieras más archivos)
# app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/", response_class=HTMLResponse)
async def serve_index():
    """Sirve la Single Page Application."""
    # Leemos el archivo index.html
    base_dir = os.path.dirname(os.path.abspath(__file__))
    index_path = os.path.join(base_dir, "templates", "index.html")
    with open(index_path, "r", encoding="utf-8") as f:
        html_content = f.read()
    return HTMLResponse(content=html_content)

@app.get("/api/marcas")
async def get_marcas():
    """Devuelve la lista de marcas disponibles para el filtro."""
    if not supabase:
        return []
    
    response = supabase.table("marcas").select("id_marca, nombre").execute()
    return response.data

@app.get("/api/coches")
async def get_coches(
    marca: Optional[int] = None,
    combustible: Optional[str] = None,
    carroceria: Optional[str] = None,
    precio_max: Optional[float] = None,
    maletero_min: Optional[int] = None,
    potencia_min: Optional[int] = None,
    consumo_max: Optional[float] = None,
    largo_max: Optional[int] = None,
    busqueda: Optional[str] = None
):
    """Devuelve los coches aplicando los filtros proporcionados."""
    if not supabase:
        return []
    
    # Construimos la consulta base haciendo join con marcas y fuentes_modelo
    query = supabase.table("modelos").select("*, marcas(*), fuentes_modelo(*)")
    
    # Aplicamos los filtros condicionalmente
    if marca is not None:
        query = query.eq("id_marca", marca)
        
    if combustible:
        # En la BD tenemos valores como "Gasolina", "Diésel", "HEV", "PHEV", "Eléctrico", etc.
        # Usamos ilike para búsquedas más flexibles si es necesario, o eq si es exacto
        query = query.ilike("combustible", f"%{combustible}%")
        
    if carroceria:
        query = query.eq("carroceria", carroceria)
        
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
