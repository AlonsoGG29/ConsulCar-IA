# Comparador de Coches

Una aplicación web moderna para buscar y comparar coches en base a múltiples criterios (potencia, consumo, dimensiones, maletero, etc.).

El proyecto está dividido en dos partes principales:
- **Backend:** Desarrollado en Python con **FastAPI** y conectado a una base de datos en **Supabase**.
- **Frontend:** Desarrollado en **React** (utilizando Vite) con un diseño moderno, responsivo y centrado en la usabilidad.

---

## Requisitos Previos

- Tener instalado [Python 3.8+](https://www.python.org/downloads/).
- Tener instalado [Node.js y npm](https://nodejs.org/).
- Una base de datos en [Supabase](https://supabase.com/) configurada con el esquema de datos del proyecto (puedes usar el script `coches.sql` incluido).

---

## 1. Configuración del Backend (API de Python)

1. **Instalar dependencias:**
   Abre una terminal en la carpeta principal del proyecto y ejecuta:
   ```bash
   pip install -r requirements.txt
   ```

2. **Configurar credenciales de Base de Datos:**
   Abre el archivo llamado `.env` en la raíz del proyecto (o créalo si no existe) y añade tus credenciales de Supabase:
   ```env
   SUPABASE_URL=tu_url_aqui
   SUPABASE_KEY=tu_key_aqui
   ```

3. **Ejecutar el servidor:**
   En la misma terminal, inicia la API de FastAPI ejecutando:
   ```bash
   python main.py
   ```
   *El backend de datos estará disponible en `http://localhost:8000` y su documentación interactiva en `http://localhost:8000/docs`.*

---

## 2. Configuración del Frontend (React)

1. **Instalar dependencias de Node:**
   Abre **una segunda terminal**, entra en la carpeta `frontend` e instala los paquetes necesarios:
   ```bash
   cd frontend
   npm install
   ```

2. **Ejecutar la interfaz web:**
   Inicia el servidor de desarrollo de Vite:
   ```bash
   npm run dev
   ```
   *La web estará disponible en `http://localhost:5173`. Ábrelo en tu navegador web.*

---

## Uso de la aplicación

Una vez tengas ambos servidores corriendo simultáneamente:
1. Dirígete a `http://localhost:5173` en tu navegador.
2. Verás el catálogo de coches cargado en un orden dinámico (aleatorio).
3. Utiliza la barra lateral para ajustar los filtros interactivos en tiempo real:
   - Búsqueda por texto (modelo).
   - Controles deslizantes (sliders) para: Potencia (CV), Consumo, Largo y Maletero.
   - Selector de tipo de combustible.
