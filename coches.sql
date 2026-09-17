-- Creación de la base de datos (opcional, ejecutar si no existe)
CREATE DATABASE comparador_coches;

-- 1. Tabla Marcas
CREATE TABLE marcas (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    nombre_grupo VARCHAR(100),               -- Ej: Grupo VAG, Stellantis
    pais_origen VARCHAR(50),
    garantia_anios INTEGER,
    fiab_actual NUMERIC(4, 1),
    fiab_antigua NUMERIC(4, 1)
);

-- 2. Tabla Modelos
CREATE TABLE modelos (
    id_modelo SERIAL PRIMARY KEY,
    id_marca INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    -- Tipo y comercialización
    anio INTEGER,
    precio_base NUMERIC(12, 2) NOT NULL,
    carroceria VARCHAR(50) CHECK (carroceria IN ('SUV', 'Compacto', 'Familiar', 'Berlina', 'Sedán', 'Hatchback', 'Monovolumen', 'Coupé', 'Crossover', 'Camper', 'Roadster', 'Pick-up', 'Ranchera')),
    -- Motor y rendimiento
    combustible VARCHAR(50),
    cv INTEGER,
    consumo NUMERIC(4, 1), -- l/100km (gasolina/diésel/hibrido), kWh/100km (eléctrico), kg/100km (hidrógeno/glp)
    autonomia_km INTEGER,   -- Total (depósito + batería)
    autonomia_electrica_km INTEGER DEFAULT NULL, -- Solo PHEV y eléctricos
    -- Dimensiones y maletero
    largo INTEGER,
    ancho INTEGER,
    alto INTEGER,
    maletero_litros INTEGER,
    
    -- Relación con Marcas
    CONSTRAINT fk_marca 
        FOREIGN KEY (id_marca) 
        REFERENCES marcas(id_marca) 
        ON DELETE CASCADE
);

-- 3. Tabla Fuentes
CREATE TABLE fuentes_modelo (
    id_fuente SERIAL PRIMARY KEY,
    id_modelo INTEGER NOT NULL UNIQUE,      -- UNIQUE para relación 1 a 1 (un set de enlaces por modelo)
    url_imagen TEXT,                        -- Enlace online de imagen del coche
    url_oficial TEXT,                       -- Enlace del modelo en la página oficial del concesionario
    url_km77 TEXT,                          -- Enlace del modelo en km77.com
    
    CONSTRAINT fk_modelo_fuente
        FOREIGN KEY (id_modelo) 
        REFERENCES modelos(id_modelo) 
        ON DELETE CASCADE
);


---
--- EJEMPLOS DE INSERCIÓN de datos para pruebas
---

-- -- 1. Inserción en la tabla Marcas (Toyota)
-- INSERT INTO Marcas (nombre, nombre_grupo, pais_origen, garantia_anios, fiab_actual, fiab_antigua)
-- VALUES ('Toyota', 'Toyota Motor Corporation', 'Japón', 15, 9.1, 8.8),
--         ('Honda', 'Honda Motor Co.', 'Japón', 5, 8.9, 8.5);

-- -- 2. Inserción en la tabla Modelos (Toyota RAV4 Híbrido, referenciando la marca id_marca = 1)
-- INSERT INTO Modelos (
--     id_marca, nombre, anio, precio_base, carroceria, 
--     combustible, cv, consumo, autonomia_km, autonomia_electrica_km, 
--     largo, ancho, alto, maletero_litros
-- ) VALUES (
--     1, 'RAV4 220H Electric Hybrid', 2024, 40500.00, 'SUV',
--     'Híbrido HEV', 218, 5.7, 950, 2,
--     4600, 1855, 1685, 580
-- );

-- -- 3. Inserción en Fuentes_Modelo (Asociado al id_modelo = 1)
-- INSERT INTO Fuentes_Modelo (id_modelo, url_imagen, url_oficial, url_km77)
-- VALUES (
--     1, 
--     'https://ejemplo.com/imagenes/toyota-rav4-2024.jpg',
--     'https://www.toyota.es/coches/rav4',
--     'https://www.km77.com/coches/toyota/rav4/2019/estandar/informacion',
-- );