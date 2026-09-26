-- ============================================================
-- M4 - CONSULTAS SQL DE NEGOCIO
-- Proyecto: RetailPro
-- Base de datos: Ventas_Tech_DB
-- Motor: SQL Server
-- ============================================================

USE Ventas_Tech_DB;
GO

-- ============================================================
-- 0. DATOS ADICIONALES PARA AMPLIAR EL PERÍODO DE ANÁLISIS
-- Los datos originales de M3 corresponden a marzo de 2024.
-- Se agregan registros adicionales de ventas de abril, mayo y junio de 2024 para ampliar el período de análisis.
-- IF NOT EXISTS evita errores por duplicación si el script se vuelve a ejecutar.
-- ============================================================

IF NOT EXISTS (
    SELECT 1
    FROM ventas
    WHERE id_venta BETWEEN 11 AND 26
)
BEGIN

    INSERT INTO ventas
        (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
    VALUES
        (11, 1, 3,  2, 450.00, '2024-04-04'),
        (12, 2, 1,  1, 1200.00, '2024-04-08'),
        (13, 3, 4,  3, 120.00, '2024-04-12'),
        (14, 4, 6,  2, 95.00, '2024-04-16'),
        (15, 5, 5,  2, 130.00, '2024-04-21'),
        (16, 1, 2, 10, 28.00, '2024-04-26'),

        (17, 2, 1,  2, 1200.00, '2024-05-03'),
        (18, 3, 3,  2, 450.00, '2024-05-09'),
        (19, 4, 5,  1, 130.00, '2024-05-14'),
        (20, 5, 4,  4, 120.00, '2024-05-18'),
        (21, 1, 6,  3, 95.00, '2024-05-23'),
        (22, 2, 2,  5, 28.00, '2024-05-28'),

        (23, 3, 1,  1, 1200.00, '2024-06-05'),
        (24, 4, 3,  1, 450.00, '2024-06-11'),
        (25, 5, 6,  5, 95.00, '2024-06-17'),
        (26, 1, 4,  2, 120.00, '2024-06-24');

END;
GO

-- ============================================================
-- CONSULTA 1 — RESUMEN EJECUTIVO MENSUAL
-- ============================================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);
GO

-- ============================================================
-- CONSULTA 2 — RANKING DE PRODUCTOS
-- Top 5 productos por total facturado.
-- ============================================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;
GO

-- ============================================================
-- CONSULTA 3 — CLIENTES RECURRENTES
-- Clientes que realizaron mas de un pedido.
-- ============================================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC, total_gastado DESC;
GO

-- ============================================================
-- CONSULTA 4 — MESES POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- ============================================================

WITH ventas_mensuales AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_mensual
    FROM ventas
    GROUP BY MONTH(fecha_venta)
),
promedio_mensual AS (
    SELECT
        AVG(total_mensual) AS promedio_general
    FROM ventas_mensuales
)
SELECT
    vm.mes,
    vm.total_mensual,
    CASE
        WHEN vm.total_mensual > pm.promedio_general THEN 'Por encima'
        WHEN vm.total_mensual < pm.promedio_general THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM ventas_mensuales AS vm
CROSS JOIN promedio_mensual AS pm
ORDER BY vm.mes;
GO

-- ============================================================
-- CONSULTAS ADICIONALES PARA CONCLUSIONES
-- ============================================================

-- CONSULTA ADICIONAL 1: TOTAL FACTURADO DEL PERÍODO

SELECT
    SUM(cantidad * precio_unitario) AS total_periodo
FROM ventas;
GO


-- CONSULTA ADICIONAL 2: PARTICIPACIÓN DEL PRODUCTO 1

SELECT
    (SUM(cantidad * precio_unitario) /
     (SELECT SUM(cantidad * precio_unitario) FROM ventas)) * 100 AS porcentaje
FROM ventas
WHERE id_producto = 1;
GO

-- ============================================================
-- BLOQUE DE CIERRE — 3 HALLAZGOS
-- ============================================================

-- 1. Marzo fue el mes con mayor facturación del período analizado,
--    con $6.444 sobre un total de $16.334 facturados.

-- 2. El producto 1 fue el principal generador de facturación,
--    con $8.400, equivalente aproximadamente al 51,4% del total.

-- 3. Marzo y mayo quedaron por encima del promedio mensual,
--    mientras que abril y junio quedaron por debajo.