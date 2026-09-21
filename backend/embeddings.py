import os
from dotenv import load_dotenv
from supabase import create_client, Client
from sentence_transformers import SentenceTransformer

load_dotenv()

# Cargar el modelo una sola vez en memoria
print("Cargando modelo local de Embeddings (SentenceTransformers)...")
model = SentenceTransformer('all-MiniLM-L6-v2')

def generar_embedding(texto: str) -> list:
    """Genera el vector embedding (384 dimensiones) para un texto dado."""
    return model.encode(texto).tolist()

def generar_y_guardar_embeddings_local():
    supabase: Client = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_KEY"))
    res = supabase.from_("modelos").select("*, marcas(nombre)").execute()
    coches = res.data

    if not coches:
        print("No se encontraron coches.")
        return

    print(f"Generando embeddings en local para {len(coches)} coches...\n")

    for i, coche in enumerate(coches, start=1):
        marca = coche['marcas']['nombre'] if coche.get('marcas') else ''
        
        texto_coche = (
            f"Marca: {marca}, Modelo: {coche['nombre']}, Carrocería: {coche['carroceria']}, "
            f"Combustible: {coche['combustible']}, Potencia: {coche['cv']} CV, "
            f"Consumo: {coche['consumo']} L/100km, Precio: {coche['precio_base']} euros, "
            f"Maletero: {coche['maletero_litros']} litros."
        )

        try:
            vector = generar_embedding(texto_coche)
            datos_embedding = {
                "id_modelo": coche['id_modelo'],
                "embedding": vector
            }
            supabase.from_("modelos_embeddings").upsert(
                datos_embedding,
                on_conflict="id_modelo"
            ).execute()
            print(f"[{i}/{len(coches)}] ✓ Vector guardado: {marca} {coche['nombre']}")
        except Exception as e:
            print(f"[{i}/{len(coches)}] ✗ Error en coche ID {coche['id_modelo']}: {e}")

if __name__ == "__main__":
    generar_y_guardar_embeddings_local()