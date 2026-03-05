CREATE DATABASE ventas_caba;
USE ventas_caba;

CREATE TABLE compra_barrios (
	barrio VARCHAR(150),
    año INT,
    trimestre INT,
    valor FLOAT,
    ambientes INT,
    estado VARCHAR(150)
);
-- Debemos crear una tabla para unificar las 6 bases de datos de departamentos nuevos y usados por ambientes

SELECT * FROM compra_barrios;

INSERT INTO compra_barrios (barrio, año, trimestre, valor, ambientes, estado)
SELECT
	Barrio,
    Año,
    Trimestre,
    Valor,
    Ambiente,
    Estado
FROM nuevo_1amb;

INSERT INTO compra_barrios (barrio, año, trimestre, valor, ambientes, estado)
SELECT
	Barrio,
    Año,
    Trismestre,
    Valor,
    Ambientes,
    Estado
FROM nuevo_2amb;

INSERT INTO compra_barrios (barrio, año, trimestre, valor, ambientes, estado)
SELECT
	Barrio,
    Año,
    Trimestre,
    Valor,
    Ambientes,
    Estado
FROM nuevo_3amb;

INSERT INTO compra_barrios (barrio, año, trimestre, valor, ambientes, estado)
SELECT
	Barrio,
    Año,
    Trimestre,
    Valor,
    Ambientes,
    Estado
FROM usado_1amb;

INSERT INTO compra_barrios (barrio, año, trimestre, valor, ambientes, estado)
SELECT
	Barrio,
    Año,
    Trimestre,
    Valor,
    Ambientes,
    Estado
FROM usado_2amb;

INSERT INTO compra_barrios (barrio, año, trimestre, valor, ambientes, estado)
SELECT
	Barrio,
    Año,
    Trimestre,
    Valor,
    Ambientes,
    Estado
FROM usado_3amb;

-- Las 6 ejecuciones anteriores fueron para unificar las 6 tablas en una

SELECT * FROM compra_barrios;

SELECT
    año,
    ROUND(AVG(Valor), 0) AS precio_promedio
FROM compra_barrios
WHERE año BETWEEN 2018 AND 2025
GROUP BY año
ORDER BY año;
-- Respuesta 5.1
-- Evolución del precio del m2 historicamente, consulta general

SELECT
	año,
    estado,
    ROUND(AVG(valor), 0) AS precio_promedio
FROM compra_barrios
WHERE año BETWEEN 2018 AND 2025
GROUP BY año, estado
ORDER BY año, estado;
-- Respuesta 5.1
-- Evolución historica del m2 por estado del inmueble, aun es muy general

SELECT
	año,
    ambientes,
    ROUND (AVG(valor), 0) AS precio_promedio
FROM compra_barrios
GROUP BY año, ambientes
ORDER BY año, ambientes;
-- Respuesta 5.1
-- Evolución precios del m2 segun la cantidad de ambientes

SELECT
    año,
    ambientes,
    estado,
    ROUND(AVG(valor), 0) AS precio_anual
FROM compra_barrios
WHERE año BETWEEN 2018 AND 2025
GROUP BY
    año,
    ambientes,
    estado
ORDER BY
    año,
    ambientes,
    estado;
-- Respuesta 5.1
-- Evolución historica del precio del m2 segun la cantidad de ambientes y estado del inmueble.

SELECT
	barrio,
    ROUND(AVG(valor), 0) AS valor
FROM compra_barrios
GROUP BY barrio
ORDER BY valor ASC
LIMIT 5;
-- Respuesta 5.2
-- Barrios mas baratos historicamente por m2

SELECT
	barrio,
    ROUND(AVG(valor), 0) AS valor
FROM compra_barrios
GROUP BY barrio
ORDER BY valor DESC
LIMIT 5;
-- Respuesta 5.2
-- Barrios mas caros historicamente por m2

SELECT estado, barrio, precio_promedio
FROM (
    SELECT
        estado,
        barrio,
        ROUND(AVG(valor), 0) AS precio_promedio,
        ROW_NUMBER() OVER (
            PARTITION BY estado
            ORDER BY AVG(valor) DESC
        ) AS rn
    FROM compra_barrios
    GROUP BY estado, barrio
) t
WHERE rn <= 5
ORDER BY estado, precio_promedio DESC;
-- Respuesta 5.3
-- Departamentos nuevos y usados mas caros

SELECT estado, barrio, precio_promedio
FROM (
    SELECT
        estado,
        barrio,
        ROUND(AVG(valor), 0) AS precio_promedio,
        ROW_NUMBER() OVER (
            PARTITION BY estado
            ORDER BY AVG(valor) ASC
        ) AS rn
    FROM compra_barrios
    GROUP BY estado, barrio
) t
WHERE rn <= 5
ORDER BY estado, precio_promedio ASC;
-- Respuesta 5.3
-- Departamentos nuevos y usados mas baratos

SELECT ambientes, barrio, precio_promedio
FROM (
    SELECT
        ambientes,
        barrio,
        ROUND(AVG(valor), 0) AS precio_promedio,
        ROW_NUMBER() OVER (
            PARTITION BY ambientes
            ORDER BY AVG(valor) DESC
        ) AS rn
    FROM compra_barrios
    GROUP BY ambientes, barrio
) t
WHERE rn <= 3;
-- Respuesta 5.4
-- Barrios mas caros por m2 segun la cantidad de ambientes

SELECT ambientes, barrio, precio_promedio
FROM (
    SELECT
        ambientes,
        barrio,
        ROUND(AVG(valor), 0) AS precio_promedio,
        ROW_NUMBER() OVER (
            PARTITION BY ambientes
            ORDER BY AVG(valor) ASC
        ) AS rn
    FROM compra_barrios
    GROUP BY ambientes, barrio
) t
WHERE rn <= 3;
-- Respuesta 5.4
-- Barrios mas baratos por m2 segun la cantidad de ambientes

WITH precios_historicos AS (
    SELECT
        barrio,
        ambientes,
        estado,
        ROUND(AVG(valor), 0) AS precio_historico
    FROM compra_barrios
    WHERE año BETWEEN 2018 AND 2025
    GROUP BY barrio, ambientes, estado
)
SELECT ambientes, estado, barrio, precio_historico
FROM (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY ambientes, estado
            ORDER BY precio_historico DESC
        ) AS rn
    FROM precios_historicos
) t
WHERE rn <= 3
ORDER BY ambientes, estado, precio_historico DESC;
-- Respuesta 5.5
-- Top 3 historico de barrios mas caros para comprar por m2 por cantidad de ambientes y estado del inmueble

WITH precios_historicos AS (
    SELECT
        barrio,
        ambientes,
        estado,
        ROUND(AVG(valor), 0) AS precio_historico
    FROM compra_barrios
    WHERE año BETWEEN 2018 AND 2025
    GROUP BY barrio, ambientes, estado
)
SELECT ambientes, estado, barrio, precio_historico
FROM (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY ambientes, estado
            ORDER BY precio_historico ASC
        ) AS rn
    FROM precios_historicos
) t
WHERE rn <= 3
ORDER BY ambientes, estado, precio_historico ASC;
-- Respuesta 5.5
-- Top 3 historico de barrios mas baratos para comprar por m2 por cantidad de ambientes y estado del inmueble

SELECT
	estado,
    ROUND(AVG(valor), 2) AS precio_promedio
FROM compra_barrios
GROUP BY estado;
-- Respuesta 5.6
-- Precio promedio del m2 de apartamentos nuevos y usados

SELECT
    ROUND(
        (MAX(CASE WHEN Estado = 'Nuevo' THEN precio_m2 END) -
         MAX(CASE WHEN Estado = 'Usado' THEN precio_m2 END))
        /
         MAX(CASE WHEN Estado = 'Usado' THEN precio_m2 END) * 100
    , 2) AS diferencia_porcentaje
FROM (
    SELECT
        estado,
        AVG(valor) AS precio_m2
    FROM compra_barrios
    GROUP BY estado
) t;
-- Respuesta 5.6
-- Diferencia porcentual entre departamentos nuevos y usados

WITH precios_segmento AS (
    SELECT
        ambientes,
        estado,
        ROUND(AVG(valor), 0) AS precio_promedio
    FROM compra_barrios
    WHERE año BETWEEN 2018 AND 2025
    GROUP BY
        ambientes,
        estado
)
SELECT
    n.ambientes,
    n.precio_promedio AS precio_nuevo,
    u.precio_promedio AS precio_usado,
    (n.precio_promedio - u.precio_promedio) AS diferencia_usd,
    ROUND(
        (n.precio_promedio - u.precio_promedio)
        / u.precio_promedio * 100
    , 2) AS diferencia_pct
FROM precios_segmento n
JOIN precios_segmento u
    ON n.ambientes = u.ambientes
WHERE n.estado = 'Nuevo'
  AND u.estado = 'Usado'
ORDER BY n.ambientes;
-- Respuesta 5.6
-- Diferencia de precio historico entre el estado de un departamento y la cantidad de ambientes por m2

WITH ultimo_trimestre AS (
    SELECT MAX(trimestre) AS t
    FROM compra_barrios
    WHERE año = 2025
),
precios_2025 AS (
    SELECT
        ambientes,
        estado,
        ROUND(AVG(valor), 0) AS precio_2025
    FROM compra_barrios
    WHERE año = 2025
      AND trimestre = (SELECT t FROM ultimo_trimestre)
    GROUP BY
        ambientes,
        estado
)
SELECT
    n.ambientes,
    n.precio_2025 AS precio_nuevo_actual,
    u.precio_2025 AS precio_usado_actual,
    (n.precio_2025 - u.precio_2025) AS diferencia_usd,
    ROUND(
        (n.precio_2025 - u.precio_2025)
        / u.precio_2025 * 100
    , 2) AS diferencia_pct
FROM precios_2025 n
JOIN precios_2025 u
    ON n.ambientes = u.ambientes
WHERE n.estado = 'Nuevo'
  AND u.estado = 'Usado'
ORDER BY n.ambientes;
-- Respuesta 5.6
-- Diferencia de precio entre el estado del departamento y la cantidad de ambientes por m2 HOY es decir ultimo trimestre del 2025

SELECT
    barrio,
    ROUND(
        (AVG(CASE WHEN Estado = 'Nuevo' THEN Valor END) -
         AVG(CASE WHEN Estado = 'Usado' THEN Valor END))
    , 0) AS diferencia_barrio
FROM compra_barrios
GROUP BY barrio
ORDER BY diferencia_barrio DESC
LIMIT 5;
-- Respuesta 5.6
-- Barrios con mayor variacion entre el estado del inmueble

SELECT
    barrio,
    ROUND(
        (AVG(CASE WHEN Estado = 'Nuevo' THEN Valor END) -
         AVG(CASE WHEN Estado = 'Usado' THEN Valor END))
    , 0) AS diferencia_barrio
FROM compra_barrios
GROUP BY barrio
HAVING diferencia_barrio IS NOT NULL
ORDER BY diferencia_barrio ASC
LIMIT 5;
-- Respuesta 5.6
-- Barrios con menor variacion entre el estado del inmueble

WITH ultima_fecha AS (
    SELECT año, trimestre
    FROM compra_barrios
    ORDER BY año DESC, trimestre DESC
    LIMIT 1
)
SELECT ambientes, barrio, precio_actual
FROM (
    SELECT
        ambientes,
        barrio,
        ROUND(valor, 0) AS precio_actual,
        ROW_NUMBER() OVER (
            PARTITION BY ambientes
            ORDER BY valor DESC
        ) AS rn
    FROM compra_barrios
    WHERE (año, trimestre) = (
        SELECT año, trimestre FROM ultima_fecha
    )
) t
WHERE rn <= 3
ORDER BY ambientes, precio_actual DESC;
-- Respuesta 5.7
-- Barrios mas caros por m2 hoy

WITH ultima_fecha AS (
    SELECT año, trimestre
    FROM compra_barrios
    ORDER BY año DESC, trimestre DESC
    LIMIT 1
)
SELECT ambientes, barrio, precio_actual
FROM (
    SELECT
        ambientes,
        barrio,
        ROUND(valor, 0) AS precio_actual,
        ROW_NUMBER() OVER (
            PARTITION BY ambientes
            ORDER BY valor ASC
        ) AS rn
    FROM compra_barrios
    WHERE (año, trimestre) = (
        SELECT año, trimestre FROM ultima_fecha
    )
) t
WHERE rn <= 3
ORDER BY ambientes, precio_actual ASC;
-- Respuesta 5.7
-- Barrios mas baratos por m2 hoy

SELECT
    '1 ambiente' AS ambiente,
    ROUND(AVG(`1_ambiente`), 0) AS dias_promedio_publicado
FROM tiempo_publicacion

UNION ALL

SELECT
    '2 ambientes' AS ambiente,
    ROUND(AVG(`2_ambientes`), 0)
FROM tiempo_publicacion

UNION ALL

SELECT
    '3 ambientes' AS ambiente,
    ROUND(AVG(`3_ambientes`), 0)
FROM tiempo_publicacion
-- Respuesta 5.8
-- Tiempo publicado de departamentos por ambiente historico

SELECT
    '1 ambiente' AS ambiente,
    ROUND(AVG(`1_ambiente`), 0) AS dias_promedio_publicado
FROM tiempo_publicacion
WHERE Año = (SELECT MAX(Año) FROM tiempo_publicacion)

UNION ALL

SELECT
    '2 ambientes' AS ambiente,
    ROUND(AVG(`2_ambientes`), 0)
FROM tiempo_publicacion
WHERE Año = (SELECT MAX(Año) FROM tiempo_publicacion)

UNION ALL

SELECT
    '3 ambientes' AS ambiente,
    ROUND(AVG(`3_ambientes`), 0)
FROM tiempo_publicacion
WHERE Año = (SELECT MAX(Año) FROM tiempo_publicacion)
-- Respuesta 5.8
-- Tiempo publicado de departamentos 2025