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

## 🚀 Guía de Uso de la Aplicación

Una vez tengas ambos servidores (Frontend y Backend) corriendo simultáneamente, dirígete a `http://localhost:5173` en tu navegador para empezar a usar la aplicación.

### 🎯 ¿Qué puedes hacer con el Comparador?

El Consultor de Coches está diseñado para ayudarte a encontrar tu coche ideal filtrando directamente por tus **necesidades reales** en lugar de solo por marca o modelo. 

Aquí tienes un resumen de sus funcionalidades principales:

#### 1. Búsqueda Directa
> **🔍 Búsqueda por modelo**
> Si tienes en mente un coche específico, utiliza la barra de búsqueda superior en el panel izquierdo. Escribe el nombre del modelo (ej. *Ibiza*, *Tucson*, *Corolla*) y el catálogo se actualizará instantáneamente.

#### 2. Filtros Dinámicos e Interactivos
Puedes combinar múltiples filtros a la vez. El catálogo a la derecha se actualizará **en tiempo real** conforme vayas moviendo los deslizadores:

- **⚡ Potencia Mínima (CV):** Ajusta si buscas un coche estándar para ciudad (ej. > 80 CV) o un vehículo con gran aceleración y deportividad (ej. > 200 CV).
- **⛽ Consumo Máximo (L/100km):** Limita el consumo de combustible para asegurar que el coche sea eficiente y económico en el día a día.
- **🔋 Tipo de Combustible:** Filtra entre opciones como *Gasolina*, *Diésel*, *Eléctrico*, *Híbrido (HEV, PHEV, MHEV)* dependiendo de si cuentas con cargador en casa o sueles hacer viajes muy largos.
- **📏 Largo Máximo (mm):** ¿Tienes una plaza de garaje pequeña? Utiliza este filtro para asegurarte de que el coche cabe en tu plaza de aparcamiento (ej. < 4300 mm para coches compactos).
- **🧳 Maletero Mínimo (L):** Ideal para familias o si viajas a menudo. Filtra coches que tengan un gran volumen de carga (ej. > 450 L).

#### 3. Catálogo y Visualización de Datos
Cada tarjeta de coche te ofrece la información clave de un solo vistazo:
* **Fotografía del vehículo** (siempre que la fuente esté disponible).
* **Precio base** orientativo en euros.
* **Características principales:** Potencia, Combustible, Consumo medio y tamaño del maletero.
* **Dimensiones exactas:** Largo, ancho y alto en milímetros, clave para garajes.

> [!TIP]
> **Consejo pro:** Prueba a buscar el coche "perfecto" para un viaje combinando *Maletero > 500L*, *Consumo < 6 L/100km* y *Combustible: Diésel o HEV*. ¡La interfaz te mostrará solo los mejores candidatos!
