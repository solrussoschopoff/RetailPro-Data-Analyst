-- ============================================================
-- PRE-ENTREGA M5 - CONSULTAS CON JOINs
-- Proyecto: RetailPro
-- Base de datos: Ventas_Tech_DB
-- Motor: SQL Server
-- ============================================================
--
-- Nota:
-- Se agregan 3 clientes y 2 productos sin ventas para que las
-- consultas con LEFT JOIN permitan identificar casos reales.
-- Los datos originales de M3 y las ventas agregadas en M4 no se modifican.
-- ============================================================

USE Ventas_Tech_DB;
GO

-- ============================================================
-- 0. DATOS ADICIONALES PARA LAS CONSULTAS LEFT JOIN
-- ============================================================

-- Clientes sin compras
IF NOT EXISTS (
    SELECT 1
    FROM clientes
    WHERE id_cliente = 6
)
BEGIN
    INSERT INTO clientes
        (id_cliente, nombre, email, ciudad, fecha_registro)
    VALUES
        (6, 'Sofía Martínez', 'sofia@mail.com', 'La Plata', '2024-03-10'),
        (7, 'Diego Fernández', 'diego@mail.com', 'Salta', '2024-03-18'),
        (8, 'Valentina Castro', 'valentina@mail.com', 'Neuquén', '2024-04-02');
END;
GO

-- Productos sin ventas
IF NOT EXISTS (
    SELECT 1
    FROM productos
    WHERE id_producto = 7
)
BEGIN
    INSERT INTO productos
        (id_producto, nombre_producto, id_categoria, precio, stock, activo)
    VALUES
        (7, 'Webcam Full HD', 2, 75.00, 25, 1),
        (8, 'Parlante Bluetooth', 3, 85.00, 20, 1);
END;
GO

-- ============================================================
-- CONSULTA 1 — VISTA BASE DEL PROYECTO (INNER JOIN)
-- ============================================================

SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta,
    c.ciudad
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;
GO

-- ============================================================
-- CONSULTA 2 — CLIENTES SIN VENTAS (LEFT JOIN)
-- ============================================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.id_cliente;
GO

-- ============================================================
-- CONSULTA 3 — PRODUCTOS SIN VENTAS (LEFT JOIN)
-- ============================================================

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL
ORDER BY p.id_producto;
GO

-- ============================================================
-- CONSULTA 4 — CONSOLIDADO POR CANAL (UNION ALL)
-- La columna canal se crea como texto fijo en cada SELECT.
-- Se utilizan dos períodos distintos como origen del consolidado.
-- ============================================================

SELECT
    canal,
    SUM(total_venta) AS total_facturado
FROM
(
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total_venta,
        'Marzo-Abril' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-01'
      AND fecha_venta < '2024-05-01'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total_venta,
        'Mayo-Junio' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-05-01'
      AND fecha_venta < '2024-07-01'
) AS consolidado
GROUP BY canal
ORDER BY canal;
GO
