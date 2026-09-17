# Guía para crear el archivo .exe (Ejecutable único)

Para que tu padre pueda usar la aplicación simplemente haciendo doble clic, vamos a empaquetar todo el proyecto usando **PyInstaller**. 

Esto crea un único archivo `.exe` que contiene Python, la aplicación y todas sus dependencias.

> [!WARNING]
> **Antes de empezar:**
> Asegúrate de haber editado el archivo `main.py` y haber reemplazado `TU_SUPABASE_URL_AQUI` y `TU_SUPABASE_KEY_AQUI` por las credenciales reales de tu base de datos de Supabase.

## Paso 1: Instalar PyInstaller

Abre una terminal (PowerShell o CMD) en la carpeta donde tienes el proyecto (`d:\CLASE\TAJAMAR\Coches`) e instala PyInstaller junto con las demás dependencias:

```bash
pip install -r requirements.txt
pip install pyinstaller
```

## Paso 2: Crear el ejecutable

En la misma terminal, ejecuta el siguiente comando:

```bash
pyinstaller --name "ComparadorCoches" --onefile --noconsole --add-data "templates;templates" main.py
```

### Explicación de los parámetros:
- `--name "ComparadorCoches"`: Le da nombre al archivo `.exe` final.
- `--onefile`: Empaqueta todo en un único archivo (más limpio para compartir).
- `--noconsole`: Evita que se abra una horrible ventana negra de MS-DOS por detrás. La aplicación se ejecutará silenciosamente en segundo plano (abriendo el navegador de forma automática).
- `--add-data "templates;templates"`: Le dice a PyInstaller que debe incluir la carpeta `templates` (donde está tu `index.html`) dentro del `.exe`. *(Nota: en Windows se usa el separador `;`, en Mac/Linux sería `:`)*.

## Paso 3: Encontrar y probar el `.exe`

Una vez que el comando termine (tardará un minuto o dos):

1. Verás que se han creado un par de carpetas nuevas: `build` y `dist`.
2. Entra en la carpeta **`dist`**.
3. ¡Ahí está tu **`ComparadorCoches.exe`**!
4. Haz doble clic en él. Tardará unos segundos en descomprimirse en segundo plano la primera vez, y luego abrirá automáticamente tu navegador web con la aplicación funcionando.

## Paso 4: Entregar

Ya puedes coger el archivo `ComparadorCoches.exe` (puedes sacarlo de la carpeta `dist`) y ponérselo en el Escritorio a tu padre o enviárselo. Solo necesita ese archivo, nada más. ¡A disfrutar comparando coches!
