-- ESTRUCTURA DE LA BASE DE DATOS:
-- CREATE TABLE Marcas (
--     id_marca SERIAL PRIMARY KEY,
--     nombre VARCHAR(100) NOT NULL UNIQUE,
--     nombre_grupo VARCHAR(100),               -- Ej: Grupo Volkswagen, Stellantis
--     pais_origen VARCHAR(50),
--     garantia_anios INTEGER,
--     fiab_actual NUMERIC(4, 2),
--     fiab_antigua NUMERIC(4, 2)
-- );






--- INSERCIÓN DE DATOS
INSERT INTO marcas (nombre, nombre_grupo, pais_origen, garantia_anios, fiab_actual, fiab_antigua) VALUES
-- Japonesas
('Toyota', 'Toyota Motor Corp', 'Japón', 15, 9.1, 9.4),
('Lexus', 'Toyota Motor Corp', 'Japón', 10, 9.3, 9.5),
('Honda', 'Honda Motor', 'Japón', 5, 8.9, 9.4),
('Mazda', 'Mazda Motor Corp', 'Japón', 6, 8.9, 9.2),
('Suzuki', 'Suzuki Motor Corp', 'Japón', 5, 9.1, 9.3),
('Subaru', 'Subaru Corp', 'Japón', 3, 9.1, 9.4),

-- Coreanas (Hyundai Motor Group)
('Hyundai', 'Hyundai Motor Group', 'Corea del Sur', 5, 8.7, 9.2),
('Kia', 'Hyundai Motor Group', 'Corea del Sur', 7, 8.9, 9.3),

-- Grupo VAG (Alemania/Rep. Checa)
('Volkswagen', 'VAG', 'Alemania', 3, 8.2, 9.1),
('Skoda', 'VAG', 'República Checa', 3, 8.2, 9.2),
('Seat', 'VAG', 'España', 3, 8.4, 8.9),
('Cupra', 'VAG', 'España', 3, 8.4, 9.0),
('Audi', 'VAG', 'Alemania', 3, 8.4, 9.4),

-- Stellantis (Multinacional)
('Peugeot', 'Stellantis', 'Francia', 3, 8.0, 9.0),
('Citroën', 'Stellantis', 'Francia', 3, 8.0, 9.0),
('Opel', 'Stellantis', 'Alemania', 3, 7.6, 8.9),
('Fiat', 'Stellantis', 'Italia', 3, 8.4, 8.9),
('Jeep', 'Stellantis', 'EE.UU.', 3, 8.4, 9.2),

-- Alianza Renault & Otros Europeos
('Renault', 'Renault-Nissan-Mitsubishi', 'Francia', 3, 8.2, 9.0),
('Dacia', 'Renault-Nissan-Mitsubishi', 'Rumanía', 3, 8.4, 9.1),
('Mitsubishi', 'Renault-Nissan-Mitsubishi', 'Japón', 5, 8.9, 9.3),
('Nissan', 'Renault-Nissan-Mitsubishi', 'Japón', 3, 8.7, 9.0),
('Ford', 'Ford Motor Co', 'EE.UU.', 3, 8.0, 9.1),
('Volvo', 'Geely', 'Suecia', 3, 8.2, 9.0),

-- Nuevos Jugadores / Eléctricos
('MG', 'SAIC Motor', 'China', 7, 7.8, 0.0), --Nota: Los valores 0.0 en fiab_antigua porque estas marcas no tenían datos suficientes hace 5 años
('Tesla', 'Tesla Inc', 'EE.UU.', 4, 8.9, 0.0),
('BYD', 'BYD Co. Ltd', 'China', 6, 8.9, 0.0),
('Omoda', 'Chery Automobile', 'China', 7, 8.2, 0.0),
('Ebro', 'Ebro-EV Motors', 'España', 7, 8.0, 0.0),
('Polestar', 'Geely', 'Suecia', 3, 8.2, 0.0),
('Jaecoo', 'Chery Automobile', 'China', 7, 8.2, 0.0);

-- TOTAL: 30 MARCAS INSERTADAS

-- MODELOS (Datos oficiales de cada marca, venta oficial en España)

-- Toyota
INSERT INTO modelos (
    id_marca, nombre, anio, precio_base, carroceria, 
    combustible, cv, consumo, autonomia_km, autonomia_electrica_km, 
    largo, ancho, alto, maletero_litros
) VALUES
(1, 'Corolla', 2024, 25950.00, 'Hatchback', 'HEV', 140, 4.4, 970, NULL, 4370, 1790, 1460, 361),
(1, 'Aygo X Cross', 2026, 20900.00, 'SUV', 'HEV', 116, 3.9, 789, NULL, 3776, 1740, 1525, 231), 
(1, 'Rav4', 2021, 43500.00, 'SUV', 'PHEV', 304, 1.4, 1100, 75, 4600, 1855, 1685, 520),
(1, 'Hilux', 2025, 35938.16, 'Pick-up', 'Diesel', 204, 10.1, 790, NULL, 5325, 1815, 1855, NULL),
(1, 'Yaris', 2020, 21500.00, 'Hatchback', 'HEV', 116, 4.0, 900, NULL, 3940, 1745, 1500, 286),
(1, 'Yaris Cross', 2025, 27500.00, 'SUV', 'HEV', 130, 4.6, 800, NULL, 4172, 1765, 1595, 397),
(1, 'C-HR', 2024, 32750.00, 'SUV', 'PHEV', 223, 2.5, 950, 66, 4362, 1832, 1564, 310),
(1, 'C-HR+', 2026, 35375.00, 'SUV', 'Eléctrico', 224, 13.4, 607, 607, 4530, 1870, 1595, 416),
(1, 'Mirai', 2024, 74200.08, 'Sedán', 'Hidrógeno', 134, 0.81, 650, NULL, 4975, 1885, 1470, 321),
(1, 'GR Supra', 2023, 78000.00, 'Coupé', 'Gasolina', 340, 8.0, 642, NULL, 4379, 1854, 1299, 290),
--10

-- Lexus
(2, 'LBX', 2026, 33900.00, 'SUV', 'HEV', 136, 4.6, 750, NULL, 4190, 1825, 1545, 332),
(2, 'UX', 2024, 40250.00, 'SUV', 'HEV', 199, 5.0, 800, NULL, 4495, 1840, 1540, 320),
(2, 'RZ', 2022, 52000.00, 'SUV', 'Eléctrico', 165, 17.0, 559, 559, 4805, 1895, 1635, 586),
(2, 'NX', 2024, 63300.00, 'SUV', 'PHEV', 309, 1.0, 800, 76, 4953, 1931, 1771, 545),
(2, 'RX', 2022, 83900.00, 'SUV', 'PHEV', 309, 1.1, 850, 65, 4890, 1920, 1695, 461),
(2, 'ES', 2024, 53100.00, 'Sedán', 'HEV', 218, 5.2, 950, NULL, 4975, 1865, 1445, 454),
(2, 'ES', 2026, 61500.00, 'Sedán', 'Eléctrico', 224, 14.6, 530, 530, 5140, 1920, 1560, 517),
(2, 'LM', 2027, 131000.00, 'Monovolumen', 'HEV', 250, 7.2, 800, NULL, 5125, 1890, 1940, 752),
--18

-- Honda
(3, 'Civic', 2024, 26500.00, 'Hatchback', 'HEV', 184, 4.7, 851, NULL, 4551, 1802, 1408, 410),
(3, 'Jazz', 2020, 24600.00, 'Hatchback', 'HEV', 122, 4.5, 888, NULL, 4040, 1690, 1530, 304),
(3, 'CR-V', 2023, 48460.00, 'SUV', 'PHEV', 184, 0.8, 950, 81, 4703, 1866, 1674, 617),
(3, 'HR-V', 2025, 30800.00, 'SUV', 'HEV', 131, 5.4, 740, NULL, 4340, 1790, 1582, 319),
(3, 'ZR-V', 2023, 38700.00, 'SUV', 'HEV', 184, 5.8, 1160, NULL, 4568, 1840, 1613, 380),
--23

-- Mazda
(4, 'CX-5', 2024, 35200.00, 'SUV', 'HEV', 187, 7.0, 805, NULL, 4550, 1840, 1680, 506),
(4, 'CX-6e', 2024, 46200.00, 'SUV', 'Eléctrico', 258, 18.9, 484, 484, 4850, 1935, 1620, 468),
(4, 'CX-30', 2023, 31870.00, 'SUV', 'HEV', 140, 5.7, 895, NULL, 4395, 1795, 1540, 430),
(4, '6e', 2024, 43725.00, 'Sedán', 'Eléctrico', 258, 17.0, 479, 479, 4920, 1890, 1490, 466),
(4, 'CX-60', 2024, 53903.00, 'SUV', 'Diésel', 200, 5.0, 1150, NULL, 4745, 1890, 1680, 570),
(4, 'CX-60e', 2025, 57299.00, 'SUV', 'PHEV', 327, 1.7, 650, 63, 4745, 1890, 1680, 570),
(4, '2', 2022, 26850.00, 'Hatchback', 'HEV', 116, 4.2, 908, NULL, 3940, 1745, 1500, 286),
--

-- Suzuki
(5, 'Swift', 2024, 19305.00, 'Hatchback', 'HEV', 83, 4.4, 840, NULL, 3860, 1735, 1495, 265),
(5, 'Vitara', 2023, 25327.00, 'SUV', 'HEV', 116, 5.3, 887, NULL, 4185, 1775, 1600, 375),
(5, 'eVitara', 2021, 28730.00, 'SUV', 'Eléctrico', 144, 14.9, 344, 344, 4275, 1800, 1635, 310),
(5, 'S-Cross', 2025, 27222.00, 'SUV', 'HEV', 129, 5.3, 875, NULL, 4305, 1785, 1580, 430),
(5, 'Across', 2020, 55535.00, 'SUV', 'PHEV', 185, 1.3, 850, 75, 4600, 1855, 1690, 490),
(5, 'Swace', 2021, 26005.00, 'Ranchera', 'HEV', 140, 4.5, 1090, NULL, 4655, 1790, 1460, 596),
--36

-- Subaru
(6, 'Forester', 2024, 37400.00, 'SUV', 'HEV', 194, 7.5, 640, NULL, 4670, 1830, 1730, 508),
(6, 'Outback', 2023, 38400.00, 'Crossover', 'Gasolina', 169, 8.6, 733, NULL, 4870, 1875, 1675, 522),
(6, 'Outback', 2023, 39650.00, 'Crossover', 'GLP', 170, 8.6, 1050, NULL, 4870, 1875, 1675, 522),
(6, 'Crosstrek', 2025, 32000.00, 'SUV', 'HEV', 152, 7.7, 623, NULL, 4495, 1800, 1600, 315),
(6, 'Solterra', 2023, 40000.00, 'SUV', 'Eléctrico', 218, 16.1, 465, 465, 4690, 1860, 1650, 452),
--41

-- Hyundai
(7, 'Kona', 2024, 23590.00, 'SUV', 'Gasolina', 115, 5.7, 825, NULL, 4355, 1825, 1575, 466),
(7, 'Kona Híbrido', 2023, 28040.00, 'SUV', 'HEV', 141, 4.5, 750, NULL, 4355, 1825, 1575, 466),
(7, 'Kona Eléctrico', 2021, 25790.00, 'SUV', 'Eléctrico', 135, 15.0, 305, 305, 4205, 1800, 1565, 332),
(7, 'Nexo', 2024, 71000.00, 'SUV', 'Hidrógeno', 120, 0.8, 660, NULL, 4670, 1860, 1640, 461),
(7, 'Staria', 2025, 49390.00, 'Monovolumen', 'HEV', 225, 7.6, 855, NULL, 5253, 1997, 1990, 831),
(7, 'Tucson', 2023, 32975.00, 'SUV', 'HEV', 215, 6.1, 900, NULL, 4510, 1865, 1650, 616),
(7, 'Tucson', 2023, 33315.00, 'SUV', 'PHEV', 265, 1.4, 750, 71, 4510, 1865, 1650, 558),
(7, 'Inster', 2024, 16630.00, 'SUV', 'Eléctrico', 97, 14.0, 327, 327, 3825, 1610, 1575, 238),
(7, 'i10', 2023, 14940.00, 'Hatchback', 'Gasolina', 67, 4.2, 700, NULL, 3675, 1680, 1483, 252),
(7, 'i20', 2023, 16620.00, 'Hatchback', 'Gasolina', 90, 5.1, 755, NULL, 4065, 1775, 1450, 352),
(7, 'i30', 2023, 23350.00, 'Hatchback', 'Gasolina', 115, 5.3, 790, NULL, 4340, 1795, 1455, 395),
(7, 'Santa Fe', 2024, 49110.00, 'SUV', 'PHEV', 250, 1.7, 800, 54, 4830, 1900, 1770, 621),
(7, 'Ioniq 5', 2025, 48070.00, 'Crossover', 'Eléctrico', 228, 16.0, 570, 570, 4655, 1890, 1605, 520),
(7, 'Ioniq 9', 2026, 81600.00, 'SUV', 'Eléctrico', 318, 20.6, 606, 606, 5060, 1980, 1790, 908),
--55

-- Kia
(8, 'Picanto', 2024, 16939.00, 'Hatchback', 'Gasolina', 68, 5.3, 673, NULL, 3595, 1595, 1485, 255),
(8, 'Stonic', 2026, 24000.00, 'SUV', 'Gasolina', 100, 5.7, 780, NULL, 4165, 1760, 1520, 352),
(8, 'EV3', 2024, 25790.00, 'SUV', 'Eléctrico', 170, 14.9, 436, 436, 4300, 1850, 1560, 460),
(8, 'Ceed', 2024, 20560.00, 'Hatchback', 'Gasolina', 100, 5.2, 950, NULL, 4310, 1800, 1447, 395),
(8, 'Xceed', 2023, 19220.00, 'SUV', 'Gasolina', 115, 6.1, 833, NULL, 4395, 1826, 1483, 426),
(8, 'K4', 2026, 26250.00, 'Sedán', 'Gasolina', 115, 5.8, 775, NULL, 4440, 1850, 1435, 438),
(8, 'Niro HEV', 2022, 23880.00, 'SUV', 'HEV', 138, 4.5, 933, NULL, 4420, 1825, 1570, 451),
(8, 'Niro PHEV', 2023, 39390.00, 'SUV', 'PHEV', 180, 2.4, 650, 65, 4420, 1825, 1570, 348),
(8, 'Sportage', 2026, 29270.00, 'SUV', 'Gasolina', 150, 6.2, 871, NULL, 4540, 1865, 1645, 526),
(8, 'Sportage HEV', 2026, 29780.00, 'SUV', 'HEV', 230, 5.6, 897, NULL, 4540, 1865, 1645, 587),
(8, 'Sportage PHEV', 2026, 44230.00, 'SUV', 'PHEV', 265, 1.6, 700, 62, 4540, 1865, 1645, 540),
(8, 'Sorento', 2025, 49280.00, 'SUV', 'Diésel', 194, 6.3, 1050, NULL, 4815, 1900, 1700, 604),
(8, 'Sorento HEV', 2025, 49040.00, 'SUV', 'HEV', 230, 6.6, 1000, NULL, 4815, 1900, 1700, 608),
(8, 'Sorento PHEV', 2025, 56640.00, 'SUV', 'PHEV', 265, 1.6, 750, 56, 4815, 1900, 1700, 604),
--69

-- Volkswagen
(9, 'Golf GTI', 2024, 39900.00, 'Hatchback', 'Gasolina', 265, 7.6, 592, NULL, 4282, 1789, 1483, 374),
(9, 'Golf', 2024, 27200.00, 'Hatchback', 'Gasolina', 115, 5.5, 818, NULL, 4282, 1789, 1483, 381),
(9, 'Polo', 2024, 16900.00, 'Hatchback', 'Gasolina', 90, 5.4, 769, NULL, 4074, 1751, 1451, 351),
(9, 'Taigo', 2025, 19900.00, 'SUV', 'Gasolina', 95, 5.3, 755, NULL, 4266, 1757, 1518, 440),
(9, 'T-Cross', 2023, 20300.00, 'SUV', 'Gasolina', 95, 5.9, 700, NULL, 4127, 1760, 1573, 385),
(9, 'Touran', 2024, 42400.00, 'Monovolumen', 'Gasolina', 150, 6.4, 780, NULL, 4527, 1829, 1659, 743),
(9, 'ID.3 Neo', 2026, 25000.00, 'Hatchback', 'Eléctrico', 170, 15.8, 425, 425, 4265, 1809, 1561, 385),
(9, 'ID.4', 2023, 33200.00, 'SUV', 'Eléctrico', 148, 15.6, 360, 360, 4584, 1852, 1634, 543),
(9, 'ID.7', 2025, 36200.00, 'Sedán', 'Eléctrico', 286, 13.6, 709, 709, 4961, 1862, 1536, 532),
(9, 'T-Roc', 2026, 29600.00, 'SUV', 'HEV', 150, 5.5, 900, NULL, 4372, 1828, 1573, 475),
(9, 'Tiguan', 2025, 34300.00, 'SUV', 'PHEV', 204, 0.4, 700, 125, 4539, 1842, 1658, 490),
(9, 'Tayron', 2024, 46600.00, 'SUV', 'PHEV', 204, 0.5, 900, 124, 4792, 1853, 1668, 705),
--81

-- Skoda
(10, 'Enyaq', 2025, 31600.00, 'SUV', 'Eléctrico', 179, 16.0, 431, 431, 4649, 1879, 1622, 585),
(10, 'Elroq', 2024, 28600.00, 'SUV', 'Eléctrico', 170, 15.8, 428, 428, 4488, 1884, 1654, 470),
(10, 'Kodiaq iV', 2024, 36575.00, 'Crossover', 'PHEV', 204, 1.8, 900, 123, 4758, 1864, 1656, 745),
(10, 'Superb iV', 2024, 41275.00, 'Sedán', 'PHEV', 270, 1.5, 750, 137, 4912, 1849, 1477, 486),
(10, 'Superb Combi iV', 2024, 41125.00, 'Hatchback', 'PHEV', 204, 1.5, 750, 119, 4902, 1849, 1482, 510),
(10, 'Kamiq', 2024, 19500.00, 'SUV', 'Gasolina', 95, 5.7, 877, NULL, 4241, 1793, 1553, 400),
(10, 'Karoq', 2024, 25450.00, 'SUV', 'Gasolina', 116, 6.2, 806, NULL, 4390, 1841, 1603, 521),
(10, 'Fabia', 2025, 15400.00, 'Hatchback', 'Gasolina', 95, 5.0, 880, NULL, 4264, 1780, 1489, 380),
(10, 'Scala', 2024, 18500.00, 'Hatchback', 'Gasolina', 95, 5.1, 950, NULL, 4362, 1793, 1471, 467),
(10, 'Octavia', 2024, 29350.00, 'Sedán', 'Gasolina', 110, 5.1, 980, NULL, 4698, 1829, 1470, 600),
(10, 'Peaq', 2027, 42900.00, 'SUV', 'Eléctrico', 204, 15.2, 638, 638, 4874, 1867, 1664, 935),
--92

-- Seat
(11, 'Leon', 2024, 29100.00, 'Hatchback', 'HEV', 115, 5.2, 769, NULL, 4368, 1799, 1456, 380),
(11, 'Leon', 2024, 34800.00, 'Hatchback', 'PHEV', 204, 1.4, 900, 133, 4368, 1799, 1456, 270),
(11, 'Leon Sportstourer', 2024, 42000.00, 'Hatchback', 'PHEV', 204, 1.2, 900, 132, 4642, 1799, 1451, 470),
(11, 'Arona', 2026, 24100.00, 'SUV', 'Gasolina', 115, 5.6, 714, NULL, 4160, 1780, 1540, 400),
(11, 'Ateca', 2025, 31700.00, 'SUV', 'Gasolina', 150, 6.6, 833, NULL, 4381, 1841, 1615, 510),
(11, 'Ibiza', 2026, 21390.00, 'Hatchback', 'Gasolina', 115, 5.3, 755, NULL, 4091, 1780, 1445, 355),
--98

-- Audi
(12, 'A3', 2020, 34940.00, 'Sedán', 'Gasolina', 110, 5.9, 847, NULL, 4504, 1816, 1417, 425),
(12, 'A5', 2025, 48900.00, 'Sedán', 'Gasolina', 150, 6.8, 794, NULL, 4829, 1860, 1444, 445),
(12, 'A6', 2025, 62920.00, 'Sedán', 'Diésel', 204, 7.0, 900, NULL, 4999, 1875, 1452, 452),
(12, 'A6 e-tron', 2024, 70790.00, 'Hatchback', 'Eléctrico', 326, 17.6, 540, 540, 4928, 1923, 1487, 502),
(12, 'Q2', 2024, 38000.00, 'SUV', 'Gasolina', 116, 5.5, 909, NULL, 4208, 1794, 1508, 405),
(12, 'Q3 e-hybrid', 2025, 46620.00, 'SUV', 'PHEV', 272, 2.1, 850, 119, 4531, 1859, 1588, 375),
(12, 'Q4 e-tron', 2026, 49970.00, 'SUV', 'Eléctrico', 204, 18.0, 409, 409, 4588, 1865, 1632, 520),
(12, 'Q5 e-hybrid', 2025, 63000.00, 'SUV', 'PHEV', 299, 3.2, 750, 100, 4717, 1900, 1647, 438),
(12, 'Q6 e-tron', 2023, 66370.00, 'SUV', 'Eléctrico', 245, 18.0, 526, 526, 4771, 1939, 1648, 526),
(12, 'Q8', 2024, 101930.00, 'SUV', 'Gasolina', 340, 10.1, 800, NULL, 4992, 1995, 1697, 605),
--108

-- Peugeot
(13, '208', 2024, 20200.00, 'Hatchback', 'HEV', 110, 4.5, 978, NULL, 4055, 1745, 1430, 352),
(13, 'E-208', 2025, 33050.00, 'Hatchback', 'Eléctrico', 156, 14.4, 433, 433, 4055, 1745, 1430, 309),
(13, '2008', 2026, 23600.00, 'SUV', 'Gasolina', 101, 5.7, 772, NULL, 4304, 1770, 1550, 434),
(13, '2008', 2025, 25000.00, 'SUV', 'HEV', 145, 4.9, 898, NULL, 4304, 1770, 1550, 434),
(13, 'E-2008', 2023, 32650.00, 'SUV', 'Eléctrico', 136, 17.3, 336, 336, 4304, 1770, 1550, 434),
(13, '308', 2025, 33000.00, 'Hatchback', 'PHEV', 196, 2.2, 700, 60, 4367, 1852, 1454, 314),
(13, '308 SW', 2026, 35400.00, 'Ranchera', 'PHEV', 196, 2.2, 700, 60, 4636, 1852, 1454, 467),
(13, '3008', 2026, 40200.00, 'SUV', 'PHEV', 226, 2.4, 700, 87, 4542, 1895, 1641, 520),
(13, 'E-3008', 2024, 42530.00, 'SUV', 'Eléctrico', 213, 16.8, 527, 527, 4542, 1895, 1641, 520),
(13, '408', 2026, 44750.00, 'Crossover', 'PHEV', 241, 2.6, 700, 60, 4687, 1848, 1478, 471),
(13, 'E-408', 2024, 42160.00, 'Crossover', 'Eléctrico', 213, 14.8, 453, 453, 4687, 1848, 1478, 471),
(13, '5008', 2025, 41180.00, 'Crossover', 'PHEV', 226, 2.8, 700, 82, 4790, 1890, 1660, 650),
(13, 'Rifter', 2024, 26600.00, 'Monovolumen', 'Diésel', 102, 5.3, 1000, NULL, 4405, 1848, 1818, 597),
(13, 'E-Rifter', 2024, 31940.00, 'Monovolumen', 'Eléctrico', 136, 18.3, 275, 275, 4403, 1848, 1820, 775),
(13, 'Traveller', 2024, 39960.00, 'Monovolumen', 'Diésel', 177, 7.2, 972, NULL, 4981, 1920, 1890, 603),
(13, 'E-Traveller', 2024, 43700.00, 'Monovolumen', 'Eléctrico', 136, 24.0, 330, 330, 4981, 1920, 1890, 603),
--124

-- Citroën (REVISAR)
(14, 'C3 Aircross', 2024, 23740.00, 'SUV', 'HEV', 110, 5.3, 830, NULL, 4395, 1795, 1660, 460),
(14, 'C4', 2025, 28940.00, 'SUV', 'Eléctrico', 136, 15.3, 357, 357, 4360, 1800, 1525, 380),
(14, 'C4', 2025, 22300.00, 'SUV', 'Gasolina', 101, 4.7, 1000, NULL, 4360, 1800, 1525, 380),
(14, 'C4 X', 2025, 23340.00, 'SUV', 'HEV', 145, 4.7, 1100, NULL, 4600, 1800, 1525, 510),
(14, 'C4 X', 2025, 30390.00, 'SUV', 'Eléctrico', 156, 14.5, 345, 345, 4600, 1800, 1525, 510),
(14, 'C5 Aircross', 2026, 28790.00, 'SUV', 'HEV', 145, 5.4, 1019, NULL, 4652, 1902, 1660, 565),
(14, 'C5 Aircross', 2026, 39590.00, 'SUV', 'PHEV', 226, 2.5, 700, 96, 4652, 1902, 1660, 565),
(14, 'C5 Aircross', 2026, 42590.00, 'SUV', 'Eléctrico', 213, 17.2, 520, 520, 4652, 1902, 1660, 565),
(14, 'Berlingo', 2021, 33200.00, 'Monovolumen', 'Eléctrico', 136, 19.5, 343, 343, 4403, 1848, 1820, 775),
(14, 'SpaceTourer', 2024, 45000.00, 'Monovolumen', 'Eléctrico', 136, 24.0, 224, 224, 4981, 1890, 1920, 603),
(14, 'Holidays', 2024, 35000.00, 'Camper', 'Diésel', 145, 8.1, 900, NULL, 4981, 1920, 2720, 0),
--135

-- Opel
(15, 'Corsa', 2024, 17450.00, 'Hatchback', 'Gasolina', 101, 5.1, 863, NULL, 4060, 1765, 1433, 309),
(15, 'Corsa', 2024, 27400.00, 'Hatchback', 'Eléctrico', 136, 15.8, 354, 354, 4060, 1765, 1433, 267),
(15, 'Mokka', 2025, 21850.00, 'SUV', 'Gasolina', 136, 5.6, 786, NULL, 4150, 1787, 1535, 350),
(15, 'Mokka', 2025, 33850.00, 'SUV', 'Eléctrico', 156, 15.5, 403, 403, 4150, 1787, 1535, 310),
(15, 'Astra', 2026, 26100.00, 'Crossover', 'Diésel', 131, 4.8, 917, NULL, 4374, 1860, 1465, 422),
(15, 'Astra', 2026, 32900.00, 'Crossover', 'Eléctrico', 156, 14.8, 454, 454, 4374, 1860, 1465, 352),
(15, 'Astra', 2026, 35000.00, 'Crossover', 'PHEV', 196, 2.2, 700, 83, 4374, 1860, 1465, 352),
(15, 'Frontera', 2025, 28400.00, 'Crossover', 'Eléctrico', 113, 18.3, 307, 307, 4385, 1795, 1655, 460),
(15, 'Frontera', 2025, 23300.00, 'Crossover', 'HEV', 110, 5.2, 846, NULL, 4385, 1795, 1655, 460),
(15, 'Grandland', 2025, 40250.00, 'Crossover', 'Eléctrico', 136, 17.0, 523, 523, 4650, 1905, 1661, 550),
(15, 'Grandland', 2025, 40250.00, 'Crossover', 'PHEV', 136, 2.4, 700, 87, 4650, 1905, 1661, 550),
(15, 'Zafira', 2021, 40500.00, 'Monovolumen', 'Diésel', 180, 6.9, 1014, NULL, 4981, 1920, 1895, 603),
--147

-- Fiat
(16, 'Grande Panda', 2025, 17100.00, 'Hatchback', 'Gasolina', 101, 5.7, 579, NULL, 3999, 1760, 1570, 412),
(16, 'Grande Panda', 2025, 19000.00, 'Hatchback', 'HEV', 110, 5.1, 647, NULL, 3999, 1760, 1570, 412),
(16, 'Grande Panda', 2026, 22550.00, 'Hatchback', 'Eléctrico', 113, 16.8, 320, 320, 3999, 1760, 1570, 361),
(16, '600', 2026, 23950.00, 'SUV', 'Gasolina', 101, 5.7, 649, NULL, 4171, 1781, 1523, 385),
(16, '600', 2025, 22350.00, 'SUV', 'HEV', 101, 4.8, 771, NULL, 4171, 1781, 1523, 385),
(16, '600e', 2024, 33200.00, 'SUV', 'Eléctrico', 156, 15.5, 409, 409, 4171, 1781, 1523, 360),
(16, 'Tipo', 2024, 18100.00, 'Sedán', 'Diésel', 130, 4.6, 1064, NULL, 4532, 1792, 1497, 520),
--154

-- Jeep
(17, 'Avenger 85th', 2023, 25010.00, 'SUV', 'Gasolina', 101, 5.5, 800, NULL, 4084, 1776, 1528, 380),
(17, 'Avenger', 2024, 32910.00, 'SUV', 'Eléctrico', 156, 15.4, 400, 400, 4084, 1776, 1528, 355),
(17, 'Avenger', 2026, 30100.00, 'SUV', 'HEV', 110, 5.0, 880, NULL, 4084, 1776, 1528, 380),
(17, 'Compass', 2025, 42800.00, 'SUV', 'Eléctrico', 213, 17.5, 500, 500, 4550, 1900, 1670, 550),
(17, 'Compass', 2025, 33600.00, 'SUV', 'HEV', 130, 5.6, 857, NULL, 4550, 1900, 1670, 550),
(17, 'Compass', 2026, 39400.00, 'SUV', 'PHEV', 225, 2.8, 983, 90, 4550, 1900, 1670, 550),
--160

-- Renault
(18, '5', 2024, 23050.00, 'Hatchback', 'Eléctrico', 150, 15.0, 400, 400, 3922, 1774, 1498, 277),
(18, 'Clio', 2024, 16290.00, 'Hatchback', 'Gasolina', 90, 5.2, 808, NULL, 4053, 1798, 1440, 391),
(18, 'Clio', 2026, 17180.00, 'Hatchback', 'GLP', 100, 4.0, 1450, NULL, 4116, 1768, 1451, 391),
(18, '4', 2025, 27950.00, 'SUV', 'Eléctrico', 150, 15.1, 409, 409, 4140, 1800, 1570, 420),
(18, 'Captur', 2025, 26600.00, 'SUV', 'HEV', 160, 4.6, 1000, NULL, 4239, 1797, 1575, 326),
(18, 'Captur', 2024, 22680.00, 'SUV', 'GLP', 101, 4.3, 1400, NULL, 4239, 1797, 1575, 422),
(18, 'Captur', 2024, 22200.00, 'SUV', 'Gasolina', 115, 5.7, 877, NULL, 4239, 1797, 1575, 422),
(18, 'Megane', 2024, 34570.00, 'Hatchback', 'Eléctrico', 220, 16.1, 468, 468, 4200, 1780, 1505, 440),
(18, 'Symbioz', 2026, 25935.00, 'SUV', 'GLP', 120, 4.1, 1390, NULL, 4413, 1797, 1575, 460),
(18, 'Scenic', 2023, 41100.00, 'SUV', 'Eléctrico', 170, 16.3, 420, 420, 4470, 1864, 1571, 545),
(18, 'Arkana', 2023, 31300.00, 'SUV', 'HEV', 145, 4.7, 1064, NULL, 4568, 1821, 1571, 480),
(18, 'Rafale', 2021, 45920.00, 'SUV', 'PHEV', 300, 1.7, 1000, 105, 4710, 1860, 1610, 627),
--172

--Dacia
(19, 'Spring', 2024, 16240.00, 'Crossover', 'Eléctrico', 45, 13.9, 225, 225, 3701, 1583, 1516, 308),
(19, 'Sandero', 2026, 14500.00, 'Hatchback', 'Gasolina', 101, 5.3, 940, NULL, 4088, 1848, 1499, 328),
(19, 'Stepway', 2026, 21290.00, 'Crossover', 'HEV', 155, 4.4, 1000, NULL, 4099, 1848, 1535, 328),
(19, 'Stepway', 2025, 15900.00, 'Crossover', 'GLP', 122, 4.0, 1200, NULL, 4099, 1848, 1535, 328),
(19, 'Jogger Eco-G', 2022, 17400.00, 'Crossover', 'GLP', 122, 4.2, 1200, NULL, 4547, 1784, 1632, 607),
(19, 'Jogger TCe', 2026, 18940.00, 'Crossover', 'Gasolina', 110, 5.9, 850, NULL, 4547, 1784, 1632, 708),
(19, 'Duster', 2024, 26200.00, 'SUV', 'HEV', 140, 5.0, 980, NULL, 4343, 1813, 1661, 472),
(19, 'Bigster', 2025, 29390.00, 'SUV', 'HEV', 156, 4.6, 1000, NULL, 4570, 1813, 1710, 667),
(19, 'Bigster Eco-G', 2025, 24990.00, 'SUV', 'GLP', 140, 3.9, 1450, NULL, 4570, 1813, 1710, 667),
--181

-- Mitsubishi
(20, 'ASX', 2024, 24050.00, 'SUV', 'Gasolina', 115, 5.7, 750, NULL, 4227, 1797, 1567, 484),
(20, 'ASX', 2025, 31300.00, 'SUV', 'HEV', 140, 5.9, 800, NULL, 4227, 1797, 1567, 326),
(20, 'Eclipse Cross', 2025, 43050.00, 'SUV', 'PHEV', 188, 2.0, 650, 45, 4545, 1805, 1685, 359),
(20, 'Colt', 2023, 18350.00, 'Hatchback', 'Gasolina', 91, 5.1, 820, NULL, 4053, 1798, 1439, 391),
(20, 'Colt', 2024, 19150.00, 'Hatchback', 'GLP', 101, 3.9, 1000, NULL, 4053, 1798, 1439, 391),
(20, 'Outlander PHEV', 2025, 35500.00, 'SUV', 'PHEV', 306, 2.7, 800, 86, 4710, 1862, 1750, 495),
(20, 'Grandis', 2025, 32800.00, 'SUV', 'HEV', 159, 4.3, 900, NULL, 4413, 1797, 1575, 434),
--188

-- Nissan
(21, 'Micra', 2025, 32750.00, 'Crossover', 'Eléctrico', 150, 14.7, 419, 419, 3974, 1830, 1499, 277),
(21, 'Qashqai', 2024, 28450.00, 'SUV', 'HEV', 140, 6.3, 879, NULL, 4425, 1848, 1625, 504),
(21, 'Juke', 2024, 25425.00, 'SUV', 'Gasolina', 114, 5.8, 790, NULL, 4210, 1800, 1593, 422),
(21, 'Juke', 2024, 31750.00, 'SUV', 'HEV', 145, 5.1, 920, NULL, 4210, 1800, 1595, 354),
(21, 'X-Trail', 2023, 33050.00, 'SUV', 'HEV', 204, 5.8, 964, NULL, 4680, 1840, 1710, 575),
(21, 'Ariya', 2024, 47700.00, 'SUV', 'Eléctrico', 218, 17.6, 404, 404, 4595, 1850, 1660, 468),
(21, 'Leaf', 2023, 37770.00, 'Hatchback', 'Eléctrico', 150, 18.5, 385, 385, 4490, 1788, 1540, 420),
--195

-- Ford
(22, 'Puma Gen-E', 2026, 29958.00, 'SUV', 'Eléctrico', 168, 13.1, 376, 376, 4214, 1805, 1555, 523),
(22, 'Puma', 2024, 23805.00, 'SUV', 'MHEV', 125, 5.4, 750, NULL, 4186, 1805, 1550, 456),
(22, 'Explorer', 2025, 44015.00, 'SUV', 'Eléctrico', 286, 14.5, 602, 602, 4468, 1871, 1630, 470),
(22, 'Capri', 2025, 39808.00, 'SUV', 'Eléctrico', 190, 14.8, 464, 464, 4632, 1872, 1626, 572),
(22, 'Kuga', 2024, 29010.00, 'SUV', 'Gasolina', 150, 6.4, 700, NULL, 4604, 1882, 1675, 412),
(22, 'Kuga', 2024, 33550.00, 'SUV', 'PHEV', 243, 2.8, 774, 68, 4604, 1882, 1675, 395),
(22, 'Tourneo Courier', 2023, 25340.00, 'Monovolumen', 'Gasolina', 125, 6.7, 670, NULL, 4343, 1800, 1817, 570),
(22, 'E-Tourneo', 2023, 48867.00, 'Monovolumen', 'Eléctrico', 218, 24.9, 307, 307, 5050, 2032, 1983, 514),
(22, 'Tourneo Connect', 2024, 37800.00, 'Monovolumen', 'PHEV', 150, 0.5, 800, 119, 4500, 1855, 1833, 1000),
(22, 'Mustang Mach-E', 2023, 53610.00, 'SUV', 'Eléctrico', 269, 17.2, 440, 440, 4713, 1881, 1597, 402),
--205

-- Volvo
(23, 'XC90', 2025, 82200.00, 'SUV', 'MHEV', 250, 8.4, 850, NULL, 4953, 1931, 1771, 680),
(23, 'XC60', 2025, 56850.00, 'SUV', 'MHEV', 250, 7.5, 845, NULL, 4708, 1902, 1655, 483),
(23, 'XC40', 2022, 36700.00, 'SUV', 'MHEV', 163, 6.6, 830, NULL, 4440, 1873, 1652, 443),
(23, 'XC90', 2025, 91150.00, 'SUV', 'PHEV', 406, 3.3, 860, 70, 4953, 1931, 1771, 680),
(23, 'XC60', 2025, 66450.00, 'SUV', 'PHEV', 335, 2.7, 850, 79, 4708, 1902, 1655, 483),
(23, 'V60', 2027, 62250.00, 'Ranchera', 'PHEV', 335, 2.1, 800, 98, 4778, 1850, 1427, 519),
(23, 'EX60', 2026, 64900.00, 'SUV', 'Eléctrico', 374, 14.9, 611, 611, 4803, 1908, 1635, 523),
(23, 'EX30', 2023, 35800.00, 'SUV', 'Eléctrico', 272, 17.2, 337, 337, 4233, 1838, 1550, 318),
(23, 'EC40', 2024, 50450.00, 'Crossover', 'Eléctrico', 238, 16.7, 486, 486, 4440, 1873, 1591, 404),
(23, 'ES90', 2025, 71250.00, 'Sedán', 'Eléctrico', 333, 15.6, 664, 664, 5000, 1942, 1549, 442),
--215

-- MG
(24, 'ZS', 2025, 14990.00, 'SUV', 'Gasolina', 116, 6.5, 730, NULL, 4430, 1818, 1635, 443),
(24, 'ZS Hybrid+', 2024, 19840.00, 'SUV', 'HEV', 194, 5.0, 800, NULL, 4430, 1818, 1635, 443),
(24, 'HS', 2025, 21740.00, 'SUV', 'Gasolina', 170, 7.4, 743, NULL, 4655, 1890, 1664, 630),
(24, 'HS Hybrid+', 2025, 24540.00, 'SUV', 'PHEV', 272, 0.6, 1000, 90, 4670, 1890, 1663, 441),
(24, '3', 2025, 13990.00, 'Hatchback', 'Gasolina', 115, 6.1, 735, NULL, 4113, 1797, 1502, 293),
(24, 'S9', 2025, 32990.00, 'SUV', 'PHEV', 299, 2.4, 900, 100, 4983, 1967, 1778, 1026),
(24, '4 EV', 2023, 27065.00, 'Hatchback', 'Eléctrico', 204, 16.0, 452, 452, 4287, 1836, 1516, 388),
(24, 'S5 EV', 2025, 22090.00, 'SUV', 'Eléctrico', 167, 16.6, 491, 491, 4476, 1849, 1621, 453),
(24, 'S6 EV', 2026, 43600.00, 'SUV', 'Eléctrico', 240, 16.6, 530, 530, 4708, 1912, 1672, 674),
--224

-- Tesla
(25, 'Model S', 2026, 90000.00, 'Sedán', 'Eléctrico', 670, 18.0, 744, 744, 5021, 1977, 1463, 709),
(25, 'Model 3', 2024, 34020.00, 'Sedán', 'Eléctrico', 283, 15.0, 534, 534, 4720, 1849, 1443, 425),
(25, 'Model X', 2024, 99990.00, 'SUV', 'Eléctrico', 670, 18.5, 579, 579, 5036, 1999, 1684, 958),
(25, 'Model Y', 2025, 39990.00, 'SUV', 'Eléctrico', 346, 16.0, 586, 586, 4751, 1921, 1624, 820),
--228

-- BYD
(26, 'Dolphin', 2025, 29400.00, 'Hatchback', 'Eléctrico', 204, 15.9, 427, 427, 4290, 1770, 1570, 364),
(26, 'Dolphin Surf', 2025, 18780.00, 'Hatchback', 'Eléctrico', 88, 15.5, 220, 220, 3990, 1720, 1590, 308),
(26, 'Seal', 2026, 41900.00, 'Sedán', 'Eléctrico', 313, 16.6, 570, 570, 4800, 1875, 1460, 400),
(26, 'Seal U DM-i', 2024, 39990.00, 'SUV', 'PHEV', 324, 1.2, 1125, 70, 4775, 1890, 1670, 425),
(26, 'Sealion 7', 2026, 47990.00, 'SUV', 'Eléctrico', 308, 19.9, 482, 482, 4830, 1925, 1620, 520),
(26, 'Tang', 2024, 72000.00, 'SUV', 'Eléctrico', 517, 24.0, 530, 530, 4970, 1955, 1745, 235),
(26, 'Atto 2', 2025, 29990.00, 'Crossover', 'Eléctrico', 177, 16.0, 312, 312, 4310, 1830, 1675, 400),
(26, 'Atto 3 Evo', 2025, 42990.00, 'SUV', 'Eléctrico', 313, 15.6, 510, 510, 4455, 1875, 1615, 590),
--236

-- Omoda
(27, 'Omoda 5', 2024, 26200.00, 'SUV', 'Gasolina', 145, 7.0, 650, NULL, 4447, 1824, 1588, 372),
(27, 'Omoda 5', 2024, 29400.00, 'SUV', 'HEV', 224, 5.3, 960, NULL, 4447, 1824, 1588, 372),
(27, 'Omoda 5', 2024, 37900.00, 'SUV', 'Eléctrico', 211, 15.9, 430, 430, 4447, 1824, 1588, 372),
(27, 'Omoda 7 HSH', 2026, 40900.00, 'SUV', 'PHEV', 279, 2.3, 1200, 92, 4660, 1875, 1670, 401),
(27, 'Omoda 9', 2025, 50900.00, 'SUV', 'PHEV', 245, 1.7, 1100, 145, 4775, 1920, 1671, 471),
--241

-- Ebro
(28, 's400', 2025, 28900.00, 'SUV', 'HEV', 211, 5.3, 950, NULL, 4320, 1831, 1646, 430),
(28, 's700', 2026, 31490.00, 'SUV', 'HEV', 224, 5.7, 1000, NULL, 4553, 1862, 1696, 369),
(28, 's700', 2025, 35840.00, 'SUV', 'PHEV', 279, 0.8, 1200, 90, 4553, 1862, 1696, 369),
(28, 's700', 2024, 27600.00, 'SUV', 'Gasolina', 147, 7.0, 800, NULL, 4553, 1862, 1696, 369),
(28, 's800', 2025, 46990.00, 'SUV', 'PHEV', 279, 0.7, 1100, 90, 4725, 1860, 1705, 889),
(28, 's800', 2024, 32609.00, 'SUV', 'Gasolina', 147, 7.8, 731, NULL, 4725, 1860, 1705, 889),
(28, 's900', 2025, 49770.00, 'SUV', 'PHEV', 426, 1.7, 1050, 140, 4810, 1925, 1741, 448),
--248

-- Polestar
(29, 'Polestar 2', 2024, 41900.00, 'Sedán', 'Eléctrico', 272, 14.8, 554, 554, 4606, 1859, 1479, 407),
(29, 'Polestar 3', 2025, 81900.00, 'SUV', 'Eléctrico', 333, 19.0, 603, 603, 4900, 1968, 1622, 547),
(29, 'Polestar 4', 2024, 65900.00, 'Sedán', 'Eléctrico', 272, 17.8, 620, 620, 4840, 1703, 1534, 526),
(29, 'Polestar 5', 2025, 145300.00, 'SUV', 'Eléctrico', 884, 20.9, 565, 565, 5087, 2015, 1419, 365),
--252

-- Jaecoo
(30, 'Jaecoo 5', 2024, 27500.00, 'SUV', 'Gasolina', 145, 7.0, 650, NULL, 4380, 1860, 1650, 384),
(30, 'Jaecoo 5', 2024, 29400.00, 'SUV', 'HEV', 224, 5.3, 960, NULL, 4380, 1860, 1650, 314),
(30, 'Jaecoo 5', 2024, 36500.00, 'SUV', 'Eléctrico', 211, 16.5, 602, 602, 4380, 1860, 1650, 384),
(30, 'Jaecoo 7', 2025, 40900.00, 'SUV', 'PHEV', 279, 2.4, 1200, 90, 4500, 1865, 1670, 340),
(30, 'Jaecoo 8', 2026, 55750.00, 'SUV', 'PHEV', 428, 2.1, 1000, 134, 4820, 1930, 1710, 488);
--257


-- INSERCIÓN TABLA FUENTES
-- Inserción de datos en la tabla Fuentes_Modelo (IDs 1 a 257)
-- Los enlaces de km77 dirigen directamente a la ficha técnica (/datos)

INSERT INTO fuentes_modelo (id_modelo, url_imagen, url_oficial, url_km77) VALUES
-- Toyota (1 - 10) — CORREGIDO
(1, 'https://www.km77.com/media/fotos/toyota_corolla_2023_8290_1.jpg', 'https://www.toyota.es/coches/corolla', 'https://www.km77.com/coches/toyota/corolla/datos'),
(2, 'https://www.km77.com/media/fotos/toyota_aygo_x_2026_aygo_x_9424_1.jpg', 'https://www.toyota.es/coches/aygo-x-cross', 'https://www.km77.com/coches/toyota/aygo-x/datos'),
(3, 'https://www.km77.com/media/fotos/toyota_rav4_2026_9605_1.jpg', 'https://www.toyota.es/coches/rav4', 'https://www.km77.com/coches/toyota/rav4/datos'),
(4, 'https://www.km77.com/media/fotos/toyota_hilux_2026_9549_1.jpg', 'https://www.toyota.es/empresas/coches/hilux', 'https://www.km77.com/coches/toyota/hilux/datos'),
(5, 'https://www.km77.com/media/fotos/toyota_yaris_2024_gr_yaris_8807_1.jpg', 'https://www.toyota.es/coches/yaris', 'https://www.km77.com/coches/toyota/yaris/datos'),
(6, 'https://www.km77.com/media/fotos/toyota_yaris_cross_2026_yaris_cross_9688_1.jpg', 'https://www.toyota.es/coches/coming-soon/new-yaris-cross', 'https://www.km77.com/coches/toyota/yaris-cross/datos'),
(7, 'https://www.km77.com/media/fotos/toyota_c_hr_2024_chr_8634_1.jpg', 'https://www.toyota.es/coches/toyota-c-hr', 'https://www.km77.com/coches/toyota/c-hr/datos'),
(8, 'https://www.km77.com/media/fotos/toyota_c_hr_2024_chr_8634_1.jpg', 'https://www.toyota.es/coches/toyota-c-hr', 'https://www.km77.com/coches/toyota/c-hr/datos'),
(9, 'https://www.km77.com/media/fotos/toyota_mirai_2021_7854_1.jpg', 'https://www.toyota.es/coches/mirai', 'https://www.km77.com/coches/toyota/mirai/datos'),
(10, 'https://www.km77.com/media/fotos/toyota_supra_2019_coupe_7025_1.jpg', 'https://www.toyota.es/coches-segunda-mano/supra', 'https://www.km77.com/coches/toyota/supra/datos'),

-- Lexus (11 - 18) — CORREGIDO
(11, 'https://www.km77.com/media/fotos/lexus_lbx_2024_8599_1.jpg', 'https://www.lexusauto.es/modelos/lbx', 'https://www.km77.com/coches/lexus/lbx/datos'),
(12, 'https://www.km77.com/media/fotos/lexus_ux_2023_8986_1.jpg', 'https://www.lexusauto.es/modelos/ux', 'https://www.km77.com/coches/lexus/ux/datos'),
(13, 'https://www.km77.com/media/fotos/lexus_rz_2026_9350_1.jpg', 'https://www.lexusauto.es/modelos/rz', 'https://www.km77.com/coches/lexus/rz/datos'),
(14, 'https://www.km77.com/media/fotos/lexus_nx_2022_8024_2.jpg', 'https://www.lexusauto.es/modelos/nx', 'https://www.km77.com/coches/lexus/nx/datos'),
(15, 'https://www.km77.com/media/fotos/lexus_rx_2023_8283_1.jpg', 'https://www.lexusauto.es/modelos/rx', 'https://www.km77.com/coches/lexus/rx/datos'),
(16, 'https://www.km77.com/media/fotos/lexus_es_2026_9388_1.jpg', 'https://www.lexusauto.es/modelos/es', 'https://www.km77.com/coches/lexus/es/datos'),
(17, 'https://www.km77.com/media/fotos/lexus_es_2026_9389_1.jpg', 'https://www.lexusauto.es/modelos/es', 'https://www.km77.com/coches/lexus/es/datos'),
(18, 'https://www.km77.com/media/fotos/lexus_lm_2024_8550_1.jpg', 'https://www.lexusauto.es/modelos/lm', 'https://www.km77.com/coches/lexus/lm/datos'),

-- Honda (19 - 23) — CORREGIDO
(19, 'https://www.km77.com/media/fotos/honda_civic_2026_9193_2.jpg', 'https://www.honda.es/cars/new/civic-hybrid/overview.html', 'https://www.km77.com/coches/honda/civic/datos'),
(20, 'https://www.km77.com/media/fotos/honda_jazz_2023_8447_2.jpg', 'https://www.honda.es/cars/new/jazz-hybrid/overview.html', 'https://www.km77.com/coches/honda/jazz/datos'),
(21, 'https://www.km77.com/media/fotos/honda_cr_v_2024_crv_8277_2.jpg', 'https://www.honda.es/cars/new/cr-v-hybrid-suv/overview.html', 'https://www.km77.com/coches/honda/cr-v/datos'),
(22, 'https://www.km77.com/media/fotos/honda_hr_v_2025_hrv_9175_1.jpg', 'https://www.honda.es/cars/new/hr-v-hybrid/overview.html', 'https://www.km77.com/coches/honda/hr-v/datos'),
(23, 'https://www.km77.com/media/fotos/honda_zr_v_2023_zrv_8257_4.jpg', 'https://www.honda.es/cars/new/zr-v-hybrid-suv/overview.html', 'https://www.km77.com/coches/honda/zr-v/datos'),

-- Mazda (24 - 30) — CORREGIDO
(24, 'https://www.km77.com/media/fotos/mazda_cx_5_2026_cx5_9451_1.jpg', 'https://www.mazda.es/gama/mazda-cx-5/', 'https://www.km77.com/coches/mazda/cx-5/datos'),
(25, 'https://www.km77.com/media/fotos/mazda_cx_6e_2026_cx6e_9391_1.jpg', 'https://www.mazda.es/gama/mazda-cx-6e/', 'https://www.km77.com/coches/mazda/cx-6e/datos'),
(26, 'https://www.km77.com/media/fotos/mazda_cx_30_2020_cx30_7098_1.jpg', 'https://www.mazda.es/gama/mazda-cx-30/', 'https://www.km77.com/coches/mazda/cx-30/datos'),
(27, 'https://www.km77.com/media/fotos/mazda_6e_2025_9296_1.jpg', 'https://www.mazda.es/gama/mazda-6e/', 'https://www.km77.com/coches/mazda/6e/datos'),
(28, 'https://www.km77.com/media/fotos/mazda_cx_60_2022_cx60_8342_1.jpg', 'https://www.mazda.es/gama/mazda-cx-60/', 'https://www.km77.com/coches/mazda/cx-60/datos'),
(29, 'https://www.km77.com/media/fotos/mazda_cx_60_2022_cx60_8342_1.jpg', 'https://www.mazda.es/gama/mazda-cx-60/', 'https://www.km77.com/coches/mazda/cx-60/datos'),
(30, 'https://www.km77.com/media/fotos/mazda_mazda2_2024_mazda2_hybrid_8803_1.jpg', 'https://www.mazda.es/gama/mazda2-hybrid/', 'https://www.km77.com/coches/mazda/mazda2/datos'),

-- Suzuki (31 - 36) — CORREGIDO
(31, 'https://www.km77.com/media/fotos/suzuki_swift_2024_8785_1.jpg', 'https://auto.suzuki.es/modelos/hibrido/suzuki-swift', 'https://www.km77.com/coches/suzuki/swift/datos'),
(32, 'https://www.km77.com/media/fotos/suzuki_vitara_2024_8944_1.jpg', 'https://auto.suzuki.es/modelos/hibrido/vitara', 'https://www.km77.com/coches/suzuki/vitara/datos'),
(33, 'https://www.km77.com/media/fotos/suzuki_vitara_2025_e_vitara_9254_1.jpg', 'https://auto.suzuki.es/modelos/electrico/evitara', 'https://www.km77.com/coches/suzuki/e-vitara/datos'),
(34, 'https://www.km77.com/media/fotos/suzuki_s_cross_2022_scross_8153_1.jpg', 'https://auto.suzuki.es/modelos/hibrido/suzuki-s-cross', 'https://www.km77.com/coches/suzuki/s-cross/datos'),
(35, 'https://www.km77.com/media/fotos/suzuki_across_2026_9630_1.jpg', 'https://auto.suzuki.es/modelos/hibrido-enchufable/across', 'https://www.km77.com/coches/suzuki/across/datos'),
(36, 'https://www.km77.com/media/fotos/suzuki_swace_2023_8499_1.jpg', 'https://auto.suzuki.es/modelos/hibrido/swace', 'https://www.km77.com/coches/suzuki/swace/datos'),

-- Subaru (37 - 41) — CORREGIDO
(37, 'https://www.km77.com/media/fotos/subaru_forester_2025_9202_4.jpg', 'https://www.subaru.es/vehiculos/forester', 'https://www.km77.com/coches/subaru/forester/datos'),
(38, 'https://www.km77.com/media/fotos/subaru_outback_2021_7949_1.jpg', 'https://www.subaru.es/vehiculos/outback', 'https://www.km77.com/coches/subaru/outback/datos'),
(39, 'https://www.km77.com/media/fotos/subaru_outback_2021_7949_1.jpg', 'https://www.subaru.es/vehiculos/outback', 'https://www.km77.com/coches/subaru/outback/datos'),
(40, 'https://www.km77.com/media/fotos/subaru_crosstrek_2024_8814_1.jpg', 'https://www.subaru.es/vehiculos/crosstrek', 'https://www.km77.com/coches/subaru/crosstrek/datos'),
(41, 'https://www.km77.com/media/fotos/subaru_solterra_2026_9474_2.jpg', 'https://www.subaru.es/vehiculos/solterra', 'https://www.km77.com/coches/subaru/solterra/datos'),

-- Hyundai (42 - 55) — CORREGIDO
(42, 'https://www.km77.com/media/fotos/hyundai_kona_2023_8437_2.jpg', 'https://www.hyundai.com/es/es/modelos/kona.html', 'https://www.km77.com/coches/hyundai/kona/datos'),
(43, 'https://www.km77.com/media/fotos/hyundai_kona_2023_8588_1.jpg', 'https://www.hyundai.com/es/es/modelos/kona.html', 'https://www.km77.com/coches/hyundai/kona/datos'),
(44, 'https://www.km77.com/media/fotos/hyundai_kona_2023_8513_1.jpg', 'https://www.hyundai.com/es/es/modelos/kona-electrico.html', 'https://www.km77.com/coches/hyundai/kona/datos'),
(45, 'https://www.km77.com/media/fotos/hyundai_nexo_2026_9556_1.jpg', 'https://www.hyundai.com/es/es/modelos/nexo.html', 'https://www.km77.com/coches/hyundai/nexo/datos'),
(46, 'https://www.km77.com/media/fotos/hyundai_staria_2022_7937_1.jpg', 'https://www.hyundai.com/es/es/modelos/staria.html', 'https://www.km77.com/coches/hyundai/staria/datos'),
(47, 'https://www.km77.com/media/fotos/hyundai_tucson_2024_9043_1.jpg', 'https://www.hyundai.com/es/es/modelos/tucson.html', 'https://www.km77.com/coches/hyundai/tucson/datos'),
(48, 'https://www.km77.com/media/fotos/hyundai_tucson_2024_9043_1.jpg', 'https://www.hyundai.com/es/es/modelos/tucson.html', 'https://www.km77.com/coches/hyundai/tucson/datos'),
(49, 'https://www.km77.com/media/fotos/hyundai_inster_2025_9305_1.jpg', 'https://www.hyundai.com/es/es/modelos/inster.html', 'https://www.km77.com/coches/hyundai/inster/datos'),
(50, 'https://www.km77.com/media/fotos/hyundai_i10_2023_8509_1.jpg', 'https://www.hyundai.com/es/es/modelos/i10.html', 'https://www.km77.com/coches/hyundai/i10/datos'),
(51, 'https://www.km77.com/media/fotos/hyundai_i20_2023_8582_1.jpg', 'https://www.hyundai.com/es/es/modelos/i20.html', 'https://www.km77.com/coches/hyundai/i20/datos'),
(52, 'https://www.km77.com/media/fotos/hyundai_i30_2020_5_puertas_7494_1.jpg', 'https://www.hyundai.com/es/es/modelos/i30.html', 'https://www.km77.com/coches/hyundai/i30/datos'),
(53, 'https://www.km77.com/media/fotos/hyundai_santa_fe_2024_santa_fe_8670_1.jpg', 'https://www.hyundai.com/es/es/modelos/santa-fe.html', 'https://www.km77.com/coches/hyundai/santa-fe/datos'),
(54, 'https://www.km77.com/media/fotos/hyundai_ioniq_5_2024_ioniq_5_8904_1.jpg', 'https://www.hyundai.com/es/es/modelos/ioniq5.html', 'https://www.km77.com/coches/hyundai/ioniq-5/datos'),
(55, 'https://www.km77.com/media/fotos/hyundai_ioniq_9_2025_ioniq_9_9266_1.jpg', 'https://www.hyundai.com/es/es/modelos/ioniq9.html', 'https://www.km77.com/coches/hyundai/ioniq-9/datos'),

-- Kia (56 - 69) — CORREGIDO
(56, 'https://www.km77.com/media/fotos/kia_picanto_2024_8653_1.jpg', 'https://www.kia.com/es/modelos/picanto/descubrelo/', 'https://www.km77.com/coches/kia/picanto/datos'),
(57, 'https://www.km77.com/media/fotos/kia_stonic_2026_9500_4.jpg', 'https://www.kia.com/es/modelos/stonic/descubrelo/', 'https://www.km77.com/coches/kia/stonic/datos'),
(58, 'https://www.km77.com/media/fotos/kia_ev3_2025_8993_1.jpg', 'https://www.kia.com/es/modelos/ev3/descubrelo/', 'https://www.km77.com/coches/kia/ev3/datos'),
(59, 'https://www.km77.com/media/fotos/kia_cee_d_2022_5_puertas_8050_1.jpg', 'https://www.kia.com/es/modelos/ceed/descubrelo/', 'https://www.km77.com/coches/kia/cee-d/datos'),
(60, 'https://www.km77.com/media/fotos/kia_xceed_2026_9708_1.jpg', 'https://www.kia.com/es/modelos/xceed/descubrelo/', 'https://www.km77.com/coches/kia/xceed/datos'),
(61, 'https://www.km77.com/media/fotos/kia_k4_2026_9515_1.jpg', 'https://www.kia.com/es/modelos/k4/descubrelo/', 'https://www.km77.com/coches/kia/k4/datos'),
(62, 'https://www.km77.com/media/fotos/kia_niro_2026_9608_1.jpg', 'https://www.kia.com/es/modelos/niro/descubrelo/', 'https://www.km77.com/coches/kia/niro/datos'),
(63, 'https://www.km77.com/media/fotos/kia_niro_2026_9608_1.jpg', 'https://www.kia.com/es/modelos/niro/descubrelo/', 'https://www.km77.com/coches/kia/niro/datos'),
(64, 'https://www.km77.com/media/fotos/kia_sportage_2026_9426_1.jpg', 'https://www.kia.com/es/modelos/sportage/descubrelo/', 'https://www.km77.com/coches/kia/sportage/datos'),
(65, 'https://www.km77.com/media/fotos/kia_sportage_2026_9426_1.jpg', 'https://www.kia.com/es/modelos/sportage/descubrelo/', 'https://www.km77.com/coches/kia/sportage/datos'),
(66, 'https://www.km77.com/media/fotos/kia_sportage_2026_9585_1.jpg', 'https://www.kia.com/es/modelos/sportage/descubrelo/', 'https://www.km77.com/coches/kia/sportage/datos'),
(67, 'https://www.km77.com/media/fotos/kia_sorento_2024_8783_1.jpg', 'https://www.kia.com/es/modelos/sorento/descubrelo/', 'https://www.km77.com/coches/kia/sorento/datos'),
(68, 'https://www.km77.com/media/fotos/kia_sorento_2024_8783_1.jpg', 'https://www.kia.com/es/modelos/sorento/descubrelo/', 'https://www.km77.com/coches/kia/sorento/datos'),
(69, 'https://www.km77.com/media/fotos/kia_sorento_2024_8783_1.jpg', 'https://www.kia.com/es/modelos/sorento/descubrelo/', 'https://www.km77.com/coches/kia/sorento/datos'),

-- Volkswagen (70 - 81) — CORREGIDO
(70, 'https://www.km77.com/media/fotos/volkswagen_golf_2024_gti_9447_2.jpg', 'https://www.volkswagen.es/es/modelos/golf-gti.html', 'https://www.km77.com/coches/volkswagen/golf/datos'),
(71, 'https://www.km77.com/media/fotos/volkswagen_golf_2024_5_puertas_8802_4.jpg', 'https://www.volkswagen.es/es/modelos/golf.html', 'https://www.km77.com/coches/volkswagen/golf/datos'),
(72, 'https://www.km77.com/media/fotos/volkswagen_polo_2021_7984_1.jpg', 'https://www.volkswagen.es/es/modelos/polo.html', 'https://www.km77.com/coches/volkswagen/polo/datos'),
(73, 'https://www.km77.com/media/fotos/volkswagen_taigo_2022_7955_1.jpg', 'https://www.volkswagen.es/es/modelos/taigo.html', 'https://www.km77.com/coches/volkswagen/taigo/datos'),
(74, 'https://www.km77.com/media/fotos/volkswagen_t_cross_2024_tcross_8658_1.jpg', 'https://www.volkswagen.es/es/modelos/t-cross.html', 'https://www.km77.com/coches/volkswagen/t-cross/datos'),
(75, 'https://www.km77.com/media/fotos/volkswagen_touran_2016_5585_1.jpg', 'https://www.volkswagen.es/es/modelos/touran.html', 'https://www.km77.com/coches/volkswagen/touran/datos'),
(76, 'https://www.km77.com/media/fotos/volkswagen_id3_neo_2027_id3_neo_9654_1.jpg', 'https://www.volkswagen.es/es/modelos/id3.html', 'https://www.km77.com/coches/volkswagen/id3-neo/datos'),
(77, 'https://www.km77.com/media/fotos/volkswagen_id4_2021_7532_1.jpg', 'https://www.volkswagen.es/es/modelos/id4.html', 'https://www.km77.com/coches/volkswagen/id4/datos'),
(78, 'https://www.km77.com/media/fotos/volkswagen_id7_2024_8443_1.jpg', 'https://www.volkswagen.es/es/modelos/id7.html', 'https://www.km77.com/coches/volkswagen/id7/datos'),
(79, 'https://www.km77.com/media/fotos/volkswagen_t_roc_2026_troc_9492_1.jpg', 'https://www.volkswagen.es/es/modelos/t-roc.html', 'https://www.km77.com/coches/volkswagen/t-roc/datos'),
(80, 'https://www.km77.com/media/fotos/volkswagen_tiguan_2024_8622_4.jpg', 'https://www.volkswagen.es/es/modelos/tiguan.html', 'https://www.km77.com/coches/volkswagen/tiguan/datos'),
(81, 'https://www.km77.com/media/fotos/volkswagen_tayron_2025_9217_1.jpg', 'https://www.volkswagen.es/es/modelos/tayron.html', 'https://www.km77.com/coches/volkswagen/tayron/datos'),

-- Skoda (82 - 92) — CORREGIDO
(82, 'https://www.km77.com/media/fotos/skoda_enyaq_2025_9663_1.jpg', 'https://www.skoda.es/modelos/enyaq/enyaq', 'https://www.km77.com/coches/skoda/enyaq/datos'),
(83, 'https://www.km77.com/media/fotos/skoda_elroq_2025_9660_1.jpg', 'https://www.skoda.es/modelos/elroq/elroq', 'https://www.km77.com/coches/skoda/elroq/datos'),
(84, 'https://www.km77.com/media/fotos/skoda_kodiaq_2024_8638_1.jpg', 'https://www.skoda.es/modelos/kodiaq/kodiaq', 'https://www.km77.com/coches/skoda/kodiaq/datos'),
(85, 'https://www.km77.com/media/fotos/skoda_superb_2024_8676_1.jpg', 'https://www.skoda.es/modelos/superb/superb', 'https://www.km77.com/coches/skoda/superb/datos'),
(86, 'https://www.km77.com/media/fotos/skoda_superb_2024_8677_1.jpg', 'https://www.skoda.es/modelos/superb-combi/superb-combi', 'https://www.km77.com/coches/skoda/superb/2024/combi/datos'),
(87, 'https://www.km77.com/media/fotos/skoda_kamiq_2024_8674_1.jpg', 'https://www.skoda.es/modelos/kamiq/kamiq', 'https://www.km77.com/coches/skoda/kamiq/datos'),
(88, 'https://www.km77.com/media/fotos/skoda_karoq_2022_8155_1.jpg', 'https://www.skoda.es/modelos/karoq/karoq', 'https://www.km77.com/coches/skoda/karoq/datos'),
(89, 'https://www.km77.com/media/fotos/skoda_fabia_2021_5_puertas_7923_1.jpg', 'https://www.skoda.es/modelos/fabia/fabia', 'https://www.km77.com/coches/skoda/fabia/datos'),
(90, 'https://www.km77.com/media/fotos/skoda_scala_2024_8673_1.jpg', 'https://www.skoda.es/modelos/scala/scala', 'https://www.km77.com/coches/skoda/scala/2024/estandar/datos'),
(91, 'https://www.km77.com/media/fotos/skoda_octavia_2024_8858_2.jpg', 'https://www.skoda.es/modelos/octavia/octavia', 'https://www.km77.com/coches/skoda/octavia/datos'),
(92, 'https://www.km77.com/media/fotos/skoda_peaq_2027_9601_1.jpg', 'https://www.skoda.es/modelos/peaq/peaq', 'https://www.km77.com/coches/skoda/peaq/datos'),

-- Seat (93 - 98) — CORREGIDO
(93, 'https://www.km77.com/media/fotos/seat_leon_2020_5_puertas_7570_2.jpg', 'https://www.seat.es/coches/leon-5-puertas', 'https://www.km77.com/coches/seat/leon/datos'),
(94, 'https://www.km77.com/media/fotos/seat_leon_2020_ehybrid_7575_1.jpg', 'https://www.seat.es/coches/leon-5-puertas', 'https://www.km77.com/coches/seat/leon/datos'),
(95, 'https://www.km77.com/media/fotos/seat_leon_2020_sportstourer_7471_1.jpg', 'https://www.seat.es/coches/leon-sportstourer', 'https://www.km77.com/coches/seat/leon/datos'),
(96, 'https://www.km77.com/media/fotos/seat_arona_2026_9543_1.jpg', 'https://www.seat.es/coches/arona', 'https://www.km77.com/coches/seat/arona/datos'),
(97, 'https://www.km77.com/media/fotos/seat_ateca_2020_7625_1.jpg', 'https://www.seat.es/coches/suv-ateca', 'https://www.km77.com/coches/seat/ateca/datos'),
(98, 'https://www.km77.com/media/fotos/seat_ibiza_2026_9542_1.jpg', 'https://www.seat.es/coches/ibiza', 'https://www.km77.com/coches/seat/ibiza/datos'),

-- Audi (99 - 108) — CORREGIDO
(99, 'https://www.km77.com/media/fotos/audi_a3_2027_9766_1.jpg', 'https://www.audi.es/es/modelos/a3/a3-sedan/', 'https://www.km77.com/coches/audi/a3/datos'),
(100, 'https://www.km77.com/media/fotos/audi_a5_2025_9105_1.jpg', 'https://www.audi.es/es/modelos/a5/a5/', 'https://www.km77.com/coches/audi/a5/datos'),
(101, 'https://www.km77.com/media/fotos/audi_a6_2025_9333_1.jpg', 'https://www.audi.es/es/modelos/a6/a6/', 'https://www.km77.com/coches/audi/a6/datos'),
(102, 'https://www.km77.com/media/fotos/audi_a6_2025_9400_1.jpg', 'https://www.audi.es/es/modelos/a6-e-tron/a6-avant-e-tron/', 'https://www.km77.com/coches/audi/a6-e-tron/2025/sportback/datos'),
(103, 'https://www.km77.com/media/fotos/audi_q2_2021_7719_1.jpg', 'https://www.audi.es/es/web/es/modelos/q2/q2.html', 'https://www.km77.com/coches/audi/q2/datos'),
(104, 'https://www.km77.com/media/fotos/audi_q3_2026_9485_1.jpg', 'https://www.audi.es/es/web/es/modelos/q3/q3.html', 'https://www.km77.com/coches/audi/q3/datos'),
(105, 'https://www.km77.com/media/fotos/audi_q4_2026_9703_2.jpg', 'https://www.audi.es/es/web/es/modelos/q4-e-tron/q4-e-tron.html', 'https://www.km77.com/coches/audi/q4/datos'),
(106, 'https://www.km77.com/media/fotos/audi_q5_2025_9166_1.jpg', 'https://www.audi.es/es/web/es/modelos/q5/q5.html', 'https://www.km77.com/coches/audi/q5/datos'),
(107, 'https://www.km77.com/media/fotos/audi_q6_2024_9030_1.jpg', 'https://www.audi.es/es/web/es/modelos/q6-e-tron/q6-e-tron.html', 'https://www.km77.com/coches/audi/q6/datos'),
(108, 'https://www.km77.com/media/fotos/audi_q8_2024_8712_1.jpg', 'https://www.audi.es/es/web/es/modelos/q8/q8.html', 'https://www.km77.com/coches/audi/q8/datos'),

-- Peugeot (109 - 124) — CORREGIDO
(109, 'https://www.km77.com/media/fotos/peugeot_208_2024_8717_1.jpg', 'https://www.peugeot.es/gama/peugeot-208/hibrido-gasolina.html', 'https://www.km77.com/coches/peugeot/208/datos'),
(110, 'https://www.km77.com/media/fotos/peugeot_208_2024_8657_1.jpg', 'https://www.peugeot.es/gama/peugeot-208/electrico.html', 'https://www.km77.com/coches/peugeot/208/datos'),
(111, 'https://www.km77.com/media/fotos/peugeot_2008_2023_8577_1.jpg', 'https://www.peugeot.es/gama/peugeot-2008/hibrido-gasolina.html', 'https://www.km77.com/coches/peugeot/2008/datos'),
(112, 'https://www.km77.com/media/fotos/peugeot_2008_2023_8577_1.jpg', 'https://www.peugeot.es/gama/peugeot-2008/hibrido-gasolina.html', 'https://www.km77.com/coches/peugeot/2008/datos'),
(113, 'https://www.km77.com/media/fotos/peugeot_2008_2023_8577_1.jpg', 'https://www.peugeot.es/gama/peugeot-2008/electrico.html', 'https://www.km77.com/coches/peugeot/2008/datos'),
(114, 'https://www.km77.com/media/fotos/peugeot_308_2026_5_puertas_9486_2.jpg', 'https://www.peugeot.es/gama/nuevo-peugeot-308/hibrido.html', 'https://www.km77.com/coches/peugeot/308/datos'),
(115, 'https://www.km77.com/media/fotos/peugeot_308_2026_sw_9490_2.jpg', 'https://www.peugeot.es/gama/nuevo-peugeot-308-sw/hibrido.html', 'https://www.km77.com/coches/peugeot/308/2026/sw/datos'),
(116, 'https://www.km77.com/media/fotos/peugeot_3008_2024_8613_1.jpg', 'https://www.peugeot.es/gama/peugeot-3008/hibrido.html', 'https://www.km77.com/coches/peugeot/3008/datos'),
(117, 'https://www.km77.com/media/fotos/peugeot_3008_2024_8613_1.jpg', 'https://www.peugeot.es/gama/peugeot-3008/electrico.html', 'https://www.km77.com/coches/peugeot/3008/datos'),
(118, 'https://www.km77.com/media/fotos/peugeot_408_2023_8284_1.jpg', 'https://www.peugeot.es/gama/nuevo-peugeot-408/hibrido.html', 'https://www.km77.com/coches/peugeot/408/2023/estandar/datos'),
(119, 'https://www.km77.com/media/fotos/peugeot_408_2023_e408_9205_1.jpg', 'https://www.peugeot.es/gama/nuevo-peugeot-408/electrico.html', 'https://www.km77.com/coches/peugeot/408/datos'),
(120, 'https://www.km77.com/media/fotos/peugeot_5008_2025_8890_1.jpg', 'https://www.peugeot.es/gama/peugeot-5008/hibrido.html', 'https://www.km77.com/coches/peugeot/5008/datos'),
(121, 'https://www.km77.com/media/fotos/peugeot_rifter_2024_8758_1.jpg', 'https://www.peugeot.es/gama/peugeot-e-rifter.html', 'https://www.km77.com/coches/peugeot/rifter/datos'),
(122, 'https://www.km77.com/media/fotos/peugeot_rifter_2024_8819_1.jpg', 'https://www.peugeot.es/gama/peugeot-e-rifter.html', 'https://www.km77.com/coches/peugeot/rifter/datos'),
(123, 'https://www.km77.com/media/fotos/peugeot_traveller_2024_etraveller_8761_1.jpg', 'https://www.peugeot.es/gama/peugeot-e-traveller.html', 'https://www.km77.com/coches/peugeot/traveller/datos'),
(124, 'https://www.km77.com/media/fotos/peugeot_traveller_2024_8836_1.jpg', 'https://www.peugeot.es/gama/peugeot-e-traveller.html', 'https://www.km77.com/coches/peugeot/traveller/datos'),

-- Citroën (125 - 135) — CORREGIDO
(125, 'https://www.km77.com/media/fotos/citroen_c3_aircross_2024_c3_aircross_8962_1.jpg', 'https://www.citroen.es/vehiculos-citroen/c3.html', 'https://www.km77.com/coches/citroen/c3-aircross/datos'),
(126, 'https://www.km77.com/media/fotos/citroen_c4_2025_9224_1.jpg', 'https://www.citroen.es/vehiculos-citroen/e-c4.html', 'https://www.km77.com/coches/citroen/c4/datos'),
(127, 'https://www.km77.com/media/fotos/citroen_c4_2025_9224_1.jpg', 'https://www.citroen.es/vehiculos-citroen/c4.html', 'https://www.km77.com/coches/citroen/c4/datos'),
(128, 'https://www.km77.com/media/fotos/citroen_c4_x_2025_c4_x_9225_1.jpg', 'https://www.citroen.es/vehiculos-citroen/c4-x.html', 'https://www.km77.com/coches/citroen/c4-x/datos'),
(129, 'https://www.km77.com/media/fotos/citroen_c4_x_2025_c4_x_9225_1.jpg', 'https://www.citroen.es/vehiculos-citroen/e-c4-x.html', 'https://www.km77.com/coches/citroen/c4-x/datos'),
(130, 'https://www.km77.com/media/fotos/citroen_c5_aircross_2026_c5_aircross_9392_1.jpg', 'https://www.citroen.es/vehiculos-citroen/nuevo-c5-aircross.html', 'https://www.km77.com/coches/citroen/c5-aircross/datos'),
(131, 'https://www.km77.com/media/fotos/citroen_c5_aircross_2026_c5_aircross_9392_1.jpg', 'https://www.citroen.es/vehiculos-citroen/nuevo-c5-aircross.html', 'https://www.km77.com/coches/citroen/c5-aircross/datos'),
(132, 'https://www.km77.com/media/fotos/citroen_c5_aircross_2026_c5_aircross_9392_2.jpg', 'https://www.citroen.es/vehiculos-citroen/nuevo-e-c5-aircross.html', 'https://www.km77.com/coches/citroen/c5-aircross/datos'),
(133, 'https://www.km77.com/media/fotos/citroen_berlingo_2024_8791_4.jpg', 'https://www.citroen.es/vehiculos-citroen/berlingo.html', 'https://www.km77.com/coches/citroen/berlingo/datos'),
(134, 'https://www.km77.com/media/fotos/citroen_spacetourer_2024_8799_2.jpg', 'https://www.citroen.es/vehiculos-citroen/spacetourer.html', 'https://www.km77.com/coches/citroen/spacetourer/datos'),
(135, 'https://www.km77.com/images/medium/0/1/6/7/citroen-spacetourer-holidays-2024-frontal-lateral.370167.jpg', 'https://www.citroen.es/vehiculos-citroen/holidays.html', 'https://www.km77.com/coches/citroen/spacetourer/2024/holidays/informacion'),

-- Opel (136 - 147) — CORREGIDO
(136, 'https://www.km77.com/media/fotos/opel_corsa_2024_8600_1.jpg', 'https://www.opel.es/coches/gama-corsa/nuevo-corsa/resumen.html', 'https://www.km77.com/coches/opel/corsa/datos'),
(137, 'https://www.km77.com/media/fotos/opel_corsa_2024_8656_1.jpg', 'https://www.opel.es/coches/gama-corsa/nuevo-corsa/resumen.html', 'https://www.km77.com/coches/opel/corsa/datos'),
(138, 'https://www.km77.com/media/fotos/opel_mokka_2025_9243_1.jpg', 'https://www.opel.es/coches/gama-mokka/mokka/resumen.html', 'https://www.km77.com/coches/opel/mokka/datos'),
(139, 'https://www.km77.com/media/fotos/opel_mokka_2025_9244_4.jpg', 'https://www.opel.es/coches/gama-mokka/mokka/resumen.html', 'https://www.km77.com/coches/opel/mokka/datos'),
(140, 'https://www.km77.com/media/fotos/opel_astra_2026_9568_1.jpg', 'https://www.opel.es/coches/gama-astra/astra/5-puertas/resumen.html', 'https://www.km77.com/coches/opel/astra/datos'),
(141, 'https://www.km77.com/media/fotos/opel_astra_2026_9626_1.jpg', 'https://www.opel.es/coches/gama-astra/astra/5-puertas/resumen.html', 'https://www.km77.com/coches/opel/astra/datos'),
(142, 'https://www.km77.com/media/fotos/opel_astra_2026_9624_1.jpg', 'https://www.opel.es/coches/gama-astra/astra/5-puertas/resumen.html', 'https://www.km77.com/coches/opel/astra/datos'),
(143, 'https://www.km77.com/media/fotos/opel_frontera_2025_8828_1.jpg', 'https://www.opel.es/coches/frontera/frontera-bev/resumen.html', 'https://www.km77.com/coches/opel/frontera/datos'),
(144, 'https://www.km77.com/media/fotos/opel_frontera_2025_8828_1.jpg', 'https://www.opel.es/coches/frontera/frontera-bev/resumen.html', 'https://www.km77.com/coches/opel/frontera/datos'),
(145, 'https://www.km77.com/media/fotos/opel_grandland_2025_9434_1.jpg', 'https://www.opel.es/coches/gama-grandland/grandland/resumen.html', 'https://www.km77.com/coches/opel/grandland/datos'),
(146, 'https://www.km77.com/media/fotos/opel_grandland_2025_8969_4.jpg', 'https://www.opel.es/coches/gama-grandland/grandland/resumen.html', 'https://www.km77.com/coches/opel/grandland/datos'),
(147, 'https://www.km77.com/media/fotos/opel_zafira_life_2024_zafira_electric_9354_1.jpg', 'https://www.opel.es/coches/gama-zafira/zafira/resumen.html', 'https://www.km77.com/coches/opel/zafira-life/datos'),

-- Fiat (148 - 154) — CORREGIDO
(148, 'https://www.km77.com/media/fotos/fiat_grande_panda_2025_grande_panda_9075_1.jpg', 'https://www.fiat.es/modelos/grande-panda-ice', 'https://www.km77.com/coches/fiat/grande-panda/datos'),
(149, 'https://www.km77.com/media/fotos/fiat_grande_panda_2025_grande_panda_9075_1.jpg', 'https://www.fiat.es/modelos/grande-panda-hibrido', 'https://www.km77.com/coches/fiat/grande-panda/datos'),
(150, 'https://www.km77.com/media/fotos/fiat_grande_panda_2025_grande_panda_9075_1.jpg', 'https://www.fiat.es/modelos/grande-panda-electrico', 'https://www.km77.com/coches/fiat/grande-panda/datos'),
(151, 'https://www.km77.com/media/fotos/fiat_600_2024_600e_8720_1.jpg', 'https://www.fiat.es/modelos/fiat-600-gasolina', 'https://www.km77.com/coches/fiat/600/datos'),
(152, 'https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20260319_0017/big.jpg', 'https://www.fiat.es/modelos/fiat-600-hibrido', 'https://www.km77.com/coches/fiat/600/datos'),
(153, 'https://www.km77.com/media/fotos/fiat_600_2024_600e_8618_1.jpg', 'https://www.fiat.es/modelos/fiat-600-electrico', 'https://www.km77.com/coches/fiat/600/datos'),
(154, 'https://www.km77.com/media/fotos/fiat_tipo_2021_4_puertas_7808_1.jpg', 'https://www.fiat.es/modelos/fiat-tipo-sedan', 'https://www.km77.com/coches/fiat/tipo/datos'),

-- Jeep (155 - 160) — CORREGIDO
(155, 'https://www.km77.com/media/fotos/jeep_avenger_2027_9718_1.jpg', 'https://www.jeep.es/nuevo-jeep-avenger/85th-anniversary', 'https://www.km77.com/coches/jeep/avenger/datos'),
(156, 'https://www.km77.com/media/fotos/jeep_avenger_2027_9810_1.jpg', 'https://www.jeep.es/nuevo-jeep-avenger/electrico', 'https://www.km77.com/coches/jeep/avenger/datos'),
(157, 'https://www.km77.com/media/fotos/jeep_avenger_2027_9811_1.jpg', 'https://www.jeep.es/nuevo-jeep-avenger/4xe-hibrido', 'https://www.km77.com/coches/jeep/avenger/datos'),
(158, 'https://www.km77.com/media/fotos/jeep_compass_2025_9774_1.jpg', 'https://www.jeep.es/nuevo-jeep-compass/electrico', 'https://www.km77.com/coches/jeep/compass/datos'),
(159, 'https://www.km77.com/media/fotos/jeep_compass_2025_9209_2.jpg', 'https://www.jeep.es/nuevo-jeep-compass/e-hybrid', 'https://www.km77.com/coches/jeep/compass/datos'),
(160, 'https://www.km77.com/media/fotos/jeep_compass_2025_9209_2.jpg', 'https://www.jeep.es/nuevo-jeep-compass/plug-in-hybrid', 'https://www.km77.com/coches/jeep/compass/datos'),

-- Renault (161 - 172) — CORREGIDO
(161, 'https://www.km77.com/media/fotos/renault_5_2025_8540_1.jpg', 'https://www.renault.es/electricos/r5-e-tech-electrico.html', 'https://www.km77.com/coches/renault/5/datos'),
(162, 'https://www.km77.com/media/fotos/renault_clio_2026_9504_1.jpg', 'https://www.renault.es/hibridos/clio.html', 'https://www.km77.com/coches/renault/clio/datos'),
(163, 'https://www.km77.com/media/fotos/renault_clio_2026_9504_1.jpg', 'https://www.renault.es/hibridos/clio.html', 'https://www.km77.com/coches/renault/clio/datos'),
(164, 'https://www.km77.com/media/fotos/renault_4_2025_9203_1.jpg', 'https://www.renault.es/electricos/r4-e-tech-electrico.html', 'https://www.km77.com/coches/renault/4/datos'),
(165, 'https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20260203_0001/big.jpg', 'https://www.renault.es/hibridos/captur.html', 'https://www.km77.com/coches/renault/captur/datos'),
(166, 'https://www.km77.com/media/fotos/renault_captur_2024_8942_1.jpg', 'https://www.renault.es/hibridos/captur.html', 'https://www.km77.com/coches/renault/captur/datos'),
(167, 'https://www.km77.com/media/fotos/renault_captur_2024_8942_1.jpg', 'https://www.renault.es/hibridos/captur.html', 'https://www.km77.com/coches/renault/captur/datos'),
(168, 'https://www.km77.com/media/fotos/renault_megane_2022_megane_etech_electric_7991_1.jpg', 'https://www.renault.es/electricos/megane-electrico.html', 'https://www.km77.com/coches/renault/megane/datos'),
(169, 'https://www.km77.com/media/fotos/renault_symbioz_2025_9396_1.jpg', 'https://www.renault.es/hibridos/symbioz.html', 'https://www.km77.com/coches/renault/symbioz/datos'),
(170, 'https://www.km77.com/media/fotos/renault_scenic_2024_8668_1.jpg', 'https://www.renault.es/vehiculos-electricos/scenic.html', 'https://www.km77.com/coches/renault/scenic/datos'),
(171, 'https://www.km77.com/media/fotos/renault_arkana_2021_7934_1.jpg', 'https://www.renault.es/hibridos/arkana.html', 'https://www.km77.com/coches/renault/arkana/datos'),
(172, 'https://www.km77.com/media/fotos/renault_rafale_2024_9002_3.jpg', 'https://www.renault.es/hibridos/rafale.html', 'https://www.km77.com/coches/renault/rafale/datos'),

-- Dacia (173 - 181) — CORREGIDO
(173, 'https://www.km77.com/media/fotos/dacia_spring_2026_9529_1.jpg', 'https://www.dacia.es/modelos-hibridos-electricos/spring.html', 'https://www.km77.com/coches/dacia/spring/datos'),
(174, 'https://www.km77.com/media/fotos/dacia_sandero_2026_9526_1.jpg', 'https://www.dacia.es/modelos/sandero.html', 'https://www.km77.com/coches/dacia/sandero/datos'),
(175, 'https://www.km77.com/media/fotos/dacia_sandero_2026_9527_1.jpg', 'https://www.dacia.es/modelos/sandero-stepway.html', 'https://www.km77.com/coches/dacia/sandero/2026/stepway/datos'),
(176, 'https://www.km77.com/media/fotos/dacia_sandero_2026_9527_1.jpg', 'https://www.dacia.es/modelos/sandero-stepway.html', 'https://www.km77.com/coches/dacia/sandero/2026/stepway/datos'),
(177, 'https://www.km77.com/media/fotos/dacia_jogger_2026_9528_1.jpg', 'https://www.dacia.es/modelos/jogger.html', 'https://www.km77.com/coches/dacia/jogger/datos'),
(178, 'https://www.km77.com/media/fotos/dacia_jogger_2026_9528_1.jpg', 'https://www.dacia.es/modelos/jogger.html', 'https://www.km77.com/coches/dacia/jogger/datos'),
(179, 'https://www.km77.com/media/fotos/dacia_duster_2024_8917_1.jpg', 'https://www.dacia.es/modelos-hibridos-electricos/duster-suv.html', 'https://www.km77.com/coches/dacia/duster/datos'),
(180, 'https://www.km77.com/media/fotos/dacia_bigster_2025_9204_1.jpg', 'https://www.dacia.es/modelos-hibridos-electricos/bigster-suv.html', 'https://www.km77.com/coches/dacia/bigster/datos'),
(181, 'https://www.km77.com/media/fotos/dacia_bigster_2025_9204_1.jpg', 'https://www.dacia.es/modelos-hibridos-electricos/bigster-suv.html', 'https://www.km77.com/coches/dacia/bigster/datos'),

-- Mitsubishi (182 - 188) — CORREGIDO
(182, 'https://www.km77.com/media/fotos/mitsubishi_asx_2024_8963_1.jpg', 'https://www.mitsubishi-motors.es/modelos/asx', 'https://www.km77.com/coches/mitsubishi/asx/datos'),
(183, 'https://www.km77.com/media/fotos/mitsubishi_asx_2024_8963_1.jpg', 'https://www.mitsubishi-motors.es/modelos/asx', 'https://www.km77.com/coches/mitsubishi/asx/datos'),
(184, 'https://www.km77.com/media/fotos/mitsubishi_eclipse_cross_2026_eclipse_cross_9405_1.jpg', 'https://www.mitsubishi-motors.es/modelos/eclipse-cross-ev', 'https://www.km77.com/coches/mitsubishi/eclipse-cross/datos'),
(185, 'https://www.km77.com/media/fotos/mitsubishi_colt_2024_8238_1.jpg', 'https://www.mitsubishi-motors.es/modelos/colt', 'https://www.km77.com/coches/mitsubishi/colt/datos'),
(186, 'https://www.km77.com/media/fotos/mitsubishi_colt_2024_8238_1.jpg', 'https://www.mitsubishi-motors.es/modelos/colt', 'https://www.km77.com/coches/mitsubishi/colt/datos'),
(187, 'https://www.km77.com/media/fotos/mitsubishi_outlander_2025_8921_4.jpg', 'https://www.mitsubishi-motors.es/modelos/outlander-phev', 'https://www.km77.com/coches/mitsubishi/outlander/datos'),
(188, 'https://www.km77.com/media/fotos/mitsubishi_grandis_2026_9315_1.jpg', 'https://www.mitsubishi-motors.es/modelos/grandis', 'https://www.km77.com/coches/mitsubishi/grandis/datos'),

-- Nissan (189 - 195) — CORREGIDO
(189, 'https://www.km77.com/media/fotos/nissan_micra_2026_9369_1.jpg', 'https://micra.nissan.es/', 'https://www.km77.com/coches/nissan/pulsar/2015/5-puertas/datos'),
(190, 'https://www.km77.com/media/fotos/nissan_qashqai_2025_8960_1.jpg', 'https://www.nissan.es/vehiculos/nuevos-vehiculos/qashqai.html', 'https://www.km77.com/coches/nissan/qashqai/datos'),
(191, 'https://www.km77.com/media/fotos/nissan_juke_2024_8880_1.jpg', 'https://www.nissan.es/vehiculos/nuevos-vehiculos/juke.html', 'https://www.km77.com/coches/nissan/juke/datos'),
(192, 'https://www.km77.com/media/fotos/nissan_juke_2024_8880_1.jpg', 'https://www.nissan.es/vehiculos/nuevos-vehiculos/juke.html', 'https://www.km77.com/coches/nissan/juke/datos'),
(193, 'https://www.km77.com/media/fotos/nissan_x_trail_2026_xtrail_9653_1.jpg', 'https://www.nissan.es/vehiculos/nuevos-vehiculos/x-trail.html', 'https://www.km77.com/coches/nissan/x-trail/datos'),
(194, 'https://www.km77.com/media/fotos/nissan_ariya_2021_7666_1.jpg', 'https://www.nissan.es/vehiculos/nuevos-vehiculos/ariya.html', 'https://www.km77.com/coches/nissan/ariya/datos'),
(195, 'https://www.km77.com/media/fotos/nissan_leaf_2026_9370_2.jpg', 'https://www.nissan.es/vehiculos/nuevos-vehiculos/leaf.html', 'https://www.km77.com/coches/nissan/leaf/datos'),

-- Ford (196 - 205) — CORREGIDO
(196, 'https://www.km77.com/images/medium/9/6/5/1/puma-gen-e-frontal-lateral.379651.jpg', 'https://www.ford.es/turismos/puma-gen-e', 'https://www.km77.com/coches/ford/puma/datos'),
(197, 'https://www.km77.com/media/fotos/ford_puma_2024_8860_1.jpg', 'https://www.ford.es/turismos/puma', 'https://www.km77.com/coches/ford/puma/datos'),
(198, 'https://www.km77.com/media/fotos/ford_explorer_2024_8940_1.jpg', 'https://www.ford.es/turismos/explorer-electrico', 'https://www.km77.com/coches/ford/explorer/datos'),
(199, 'https://www.km77.com/media/fotos/ford_capri_2025_9097_1.jpg', 'https://www.ford.es/turismos/capri-electrico', 'https://www.km77.com/coches/ford/capri/datos'),
(200, 'https://www.km77.com/media/fotos/ford_kuga_2024_8811_1.jpg', 'https://www.ford.es/turismos/kuga', 'https://www.km77.com/coches/ford/kuga/datos'),
(201, 'https://www.km77.com/media/fotos/ford_kuga_2024_8808_7.jpg', 'https://www.ford.es/turismos/kuga', 'https://www.km77.com/coches/ford/kuga/datos'),
(202, 'https://www.km77.com/media/fotos/ford_tourneo_courier_2024_tourneo_courier_8586_4.jpg', 'https://www.ford.es/turismos/tourneo-courier', 'https://www.km77.com/coches/ford/tourneo-courier/datos'),
(203, 'https://www.km77.com/media/fotos/ford_tourneo_custom_2023_tourneo_custom_9420_1.jpg', 'https://www.ford.es/turismos/e-tourneo-custom', 'https://www.km77.com/coches/ford/tourneo-custom/datos'),
(204, 'https://www.km77.com/media/fotos/ford_tourneo_connect_2022_tourneo_connect_8107_1.jpg', 'https://www.ford.es/turismos/tourneo-connect', 'https://www.km77.com/coches/ford/tourneo-connect/datos'),
(205, 'https://www.km77.com/images/medium/7/0/0/1/ford-mustang-mach-e-2025-frontal-lateral.377001.jpg', 'https://www.ford.es/turismos/mustang-mach-e', 'https://www.km77.com/coches/ford/mustang/2020/suv/datos'),

-- Volvo (206 - 215) — CORREGIDO
(206, 'https://www.km77.com/media/fotos/volvo_xc90_2025_9167_1.jpg', 'https://www.volvocars.com/es/cars/xc90-hybrid/', 'https://www.km77.com/coches/volvo/xc90/datos'),
(207, 'https://www.km77.com/media/fotos/volvo_xc60_2025_9318_1.jpg', 'https://www.volvocars.com/es/cars/xc60-hybrid/', 'https://www.km77.com/coches/volvo/xc60/datos'),
(208, 'https://www.km77.com/media/fotos/volvo_xc40_2022_8937_1.jpg', 'https://www.volvocars.com/es/cars/xc40-hybrid/', 'https://www.km77.com/coches/volvo/xc40/datos'),
(209, 'https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20250923_0053/full.jpg', 'https://www.volvocars.com/es/cars/xc90-hybrid/', 'https://www.km77.com/coches/volvo/xc90/datos'),
(210, 'https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20251031_0008/full.jpg', 'https://www.volvocars.com/es/cars/xc60-hybrid/', 'https://www.km77.com/coches/volvo/xc60/datos'),
(211, 'https://www.km77.com/media/fotos/volvo_v60_2018_recharge_8928_1.jpg', 'https://www.volvocars.com/es/cars/v60-hybrid/', 'https://www.km77.com/coches/volvo/v60/datos'),
(212, 'https://www.km77.com/media/fotos/volvo_ex60_2026_9428_3.jpg', 'https://www.volvocars.com/es/cars/ex60-electric/', 'https://www.km77.com/coches/volvo/ex60/datos'),
(213, 'https://www.km77.com/media/fotos/volvo_ex30_2023_8579_1.jpg', 'https://www.volvocars.com/es/cars/ex30-electric/', 'https://www.km77.com/coches/volvo/ex30/datos'),
(214, 'https://www.km77.com/media/fotos/volvo_ec40_2024_8898_1.jpg', 'https://www.volvocars.com/es/cars/ec40-electric/', 'https://www.km77.com/coches/volvo/ec40/datos'),
(215, 'https://www.km77.com/media/fotos/volvo_es90_2025_9322_1.jpg', 'https://www.volvocars.com/es/cars/es90-electric/', 'https://www.km77.com/coches/volvo/es90/datos'),

-- MG (216 - 224) — CORREGIDO
(216, 'https://www.km77.com/media/fotos/mg_zs_2025_9154_1.jpg', 'https://www.mgmotor.eu/es-ES/model/zs', 'https://www.km77.com/coches/mg/zs/datos'),
(217, 'https://www.km77.com/media/fotos/mg_zs_2025_9154_1.jpg', 'https://www.mgmotor.eu/es-ES/model/zs-hev', 'https://www.km77.com/coches/mg/zs/datos'),
(218, 'https://www.km77.com/media/fotos/mg_hs_2025_9095_1.jpg', 'https://www.mgmotor.eu/es-ES/model/hs', 'https://www.km77.com/coches/mg/hs/datos'),
(219, 'https://www.km77.com/media/fotos/mg_hs_2025_9141_2.jpg', 'https://www.mgmotor.eu/es-ES/model/ehs', 'https://www.km77.com/coches/mg/hs/datos'),
(220, 'https://www.km77.com/media/fotos/mg_mg3_2024_9306_1.jpg', 'https://www.mgmotor.eu/es-ES/model/mg3', 'https://www.km77.com/coches/mg/mg3/datos'),
(221, 'https://www.km77.com/media/fotos/mg_mgs9_2026_9652_1.jpg', 'https://www.mgmotor.eu/es-ES/model/mgs9-phev', 'https://www.km77.com/coches/mg/mgs9/datos'),
(222, 'https://www.km77.com/media/fotos/mg_mg4_2023_mg4_electric_8313_1.jpg', 'https://www.mgmotor.eu/es-ES/model/mg4', 'https://www.km77.com/coches/mg/mg4/datos'),
(223, 'https://www.km77.com/media/fotos/mg_mgs5_2025_9395_1.jpg', 'https://www.mgmotor.eu/es-ES/model/mgs5', 'https://www.km77.com/coches/mg/mgs5/datos'),
(224, 'https://www.km77.com/media/fotos/mg_mgs6_2026_9637_1.jpg', 'https://www.mgmotor.eu/es-ES/model/mgs6', 'https://www.km77.com/coches/mg/mgs6/datos'),

-- Tesla (225 - 228) — CORREGIDO
(225, 'https://www.km77.com/media/fotos/tesla_model_s_2021_model_s_7878_3.jpg', 'https://www.tesla.com/es_es/models', 'https://www.km77.com/coches/tesla/model-s/datos'),
(226, 'https://www.km77.com/media/fotos/tesla_model_3_2024_model_3_8685_1.jpg', 'https://www.tesla.com/es_es/model3', 'https://www.km77.com/coches/tesla/model-3/datos'),
(227, 'https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20210128_0012/full.jpg', 'https://www.tesla.com/es_es/modelx', 'https://www.km77.com/coches/tesla/model-x/datos'),
(228, 'https://www.km77.com/media/fotos/tesla_model_y_2025_model_y_9323_1.jpg', 'https://www.tesla.com/es_es/modely', 'https://www.km77.com/coches/tesla/model-y/datos'),

-- BYD (229 - 236) — CORREGIDO
(229, 'https://www.km77.com/media/fotos/byd_dolphin_2025_9472_1.jpg', 'https://www.byd.com/es-es/coches-electricos/dolphin', 'https://www.km77.com/coches/byd/dolphin/datos'),
(230, 'https://www.km77.com/media/fotos/byd_dolphin_surf_2025_dolphin_surf_9415_1.jpg', 'https://www.byd.com/es-es/coches-electricos/dolphin-surf', 'https://www.km77.com/coches/byd/dolphin-surf/datos'),
(231, 'https://www.km77.com/media/fotos/byd_seal_2026_9681_1.jpg', 'https://www.byd.com/es-es/coches-electricos/seal', 'https://www.km77.com/coches/byd/seal/datos'),
(232, 'https://www.km77.com/media/fotos/byd_seal_u_2024_phev_8891_1.jpg', 'https://www.byd.com/es-es/coches-hibridos/seal-u-dm-i', 'https://www.km77.com/coches/byd/seal-u/datos'),
(233, 'https://www.km77.com/media/fotos/byd_sealion_7_2025_sealion_7_9228_1.jpg', 'https://www.byd.com/es-es/coches-electricos/sealion-7', 'https://www.km77.com/coches/byd/sealion-7/datos'),
(234, 'https://www.km77.com/media/fotos/byd_tang_2024_8897_1.jpg', 'https://www.byd.com/es-es/coches-electricos/tang', 'https://www.km77.com/coches/byd/tang/datos'),
(235, 'https://www.km77.com/media/fotos/byd_atto_2_2025_atto_2_9299_3.jpg', 'https://www.byd.com/es-es/coches-electricos/atto-2', 'https://www.km77.com/coches/byd/atto-2/datos'),
(236, 'https://www.km77.com/media/fotos/byd_atto_3_2023_atto_3_8338_1.jpg', 'https://www.byd.com/es-es/coches-electricos/atto-3-evo', 'https://www.km77.com/coches/byd/atto-3/datos'),

-- Omoda (237 - 241) — CORREGIDO
(237, 'https://www.km77.com/media/fotos/omoda_5_2022_8611_4.jpg', 'https://www.omodajaecoo.es/modelos/omoda-5', 'https://www.km77.com/coches/omoda/5/datos'),
(238, 'https://www.km77.com/media/fotos/omoda_5_2022_8611_4.jpg', 'https://www.omodajaecoo.es/modelos/omoda-5', 'https://www.km77.com/coches/omoda/5/datos'),
(239, 'https://www.km77.com/media/fotos/omoda_5_2022_8755_6.jpg', 'https://www.omodajaecoo.es/modelos/omoda-5', 'https://www.km77.com/coches/omoda/5/datos'),
(240, 'https://www.km77.com/media/fotos/omoda_7_2025_8985_1.jpg', 'https://www.omodajaecoo.es/modelos/omoda-7', 'https://www.km77.com/coches/omoda/7/datos'),
(241, 'https://www.km77.com/media/fotos/omoda_9_2025_9336_1.jpg', 'https://www.omodajaecoo.es/modelos/omoda-9', 'https://www.km77.com/coches/omoda/9/datos'),

-- Ebro (242 - 248) — CORREGIDO
(242, 'https://www.km77.com/media/fotos/ebro_s400_2025_9399_1.jpg', 'https://ebroauto.com/modelos/s400-hev', 'https://www.km77.com/coches/ebro/s400/datos'),
(243, 'https://www.km77.com/media/fotos/ebro_s700_2025_9013_1.jpg', 'https://ebroauto.com/modelos/s700-hev', 'https://www.km77.com/coches/ebro/s700/datos'),
(244, 'https://www.km77.com/media/fotos/ebro_s700_2025_9013_1.jpg', 'https://ebroauto.com/modelos/s700-phev', 'https://www.km77.com/coches/ebro/s700/datos'),
(245, 'https://www.km77.com/media/fotos/ebro_s700_2025_9013_1.jpg', 'https://ebroauto.com/modelos/s700-gasolina', 'https://www.km77.com/coches/ebro/s700/datos'),
(246, 'https://www.km77.com/media/fotos/ebro_s800_2025_9014_1.jpg', 'https://ebroauto.com/modelos/s800-phev', 'https://www.km77.com/coches/ebro/s800/datos'),
(247, 'https://www.km77.com/media/fotos/ebro_s800_2025_9014_1.jpg', 'https://ebroauto.com/modelos/s800-gasolina', 'https://www.km77.com/coches/ebro/s800/datos'),
(248, 'https://www.km77.com/media/fotos/ebro_s900_2026_9522_1.jpg', 'https://ebro-auto.com/modelos/s900', 'https://www.km77.com/coches/ebro/s900/datos'),

-- Polestar (249 - 252) — CORREGIDO
(249, 'https://www.km77.com/media/fotos/polestar_2_2024_8466_1.jpg', 'https://www.polestar.com/es/polestar-2/', 'https://www.km77.com/coches/polestar/2/datos'),
(250, 'https://www.km77.com/media/fotos/polestar_3_2023_9092_1.jpg', 'https://www.polestar.com/es/polestar-3/', 'https://www.km77.com/coches/polestar/3/datos'),
(251, 'https://www.km77.com/media/fotos/polestar_4_2024_8549_1.jpg', 'https://www.polestar.com/es/polestar-4/', 'https://www.km77.com/coches/polestar/4/datos'),
(252, 'https://www.km77.com/media/fotos/polestar_5_2026_8306_4.jpg', 'https://www.polestar.com/es/polestar-5/', 'https://www.km77.com/coches/polestar/5/datos'),

-- Jaecoo (253 - 257) — CORREGIDO
(253, 'https://www.km77.com/media/fotos/jaecoo_5_2025_9240_2.jpg', 'https://jaecoo.es/modelos/jaecoo-5', 'https://www.km77.com/coches/jaecoo/5/datos'),
(254, 'https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20260514_0055/big.jpg', 'https://jaecoo.es/modelos/jaecoo-5', 'https://www.km77.com/coches/jaecoo/5/datos'),
(255, 'https://www.km77.com/media/fotos/jaecoo_5_2025_9240_2.jpg', 'https://jaecoo.es/modelos/jaecoo-5', 'https://www.km77.com/coches/jaecoo/5/datos'),
(256, 'https://www.km77.com/media/fotos/jaecoo_7_2024_9192_1.jpg', 'https://jaecoo.es/modelos/jaecoo-7', 'https://www.km77.com/coches/jaecoo/7/datos'),
(257, 'https://www.km77.com/media/fotos/jaecoo_8_2025_8991_1.jpg', 'https://jaecoo.es/modelos/jaecoo-8', 'https://www.km77.com/coches/jaecoo/8/datos');