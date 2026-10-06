RetailPro - Data Analyst

Proyecto de análisis de datos desarrollado durante el curso de Data Analyst de CoderHouse.

## M3 - Base de datos

Creación de la base de datos `Ventas_Tech_DB`, definición de tablas, claves y restricciones, y carga de datos iniciales.

## M4 - Consultas de negocio

Desarrollo de consultas SQL para obtener métricas de ventas, ranking de productos, clientes recurrentes y comparación de facturación mensual.

## M5 - Consultas con JOINs

Cruce de tablas mediante `INNER JOIN`, `LEFT JOIN` y `UNION ALL` para enriquecer el análisis de ventas e identificar clientes y productos sin movimientos.

## M6 - Pipeline ETL con Power Query y M

Construcción de un pipeline ETL en Power BI a partir del dataset `Pipeline_ETL_Dataset.xlsx`.

Incluye perfilado y limpieza de datos, resolución de duplicados y valores nulos, estandarización de tipos de datos y nomenclatura, y enriquecimiento de `Fact_Ventas` mediante un Merge con `Dim_Productos`.

Se documentaron las transformaciones y decisiones técnicas mediante Lenguaje M en Power Query.

Archivo PBIX: `M6/Pipeline_ETL_Russo_Maria_Sol.pbix`

## Cómo ejecutar

**Motor:** SQL Server.

1. Ejecutar el script de M3 para crear la base de datos `Ventas_Tech_DB` y cargar los datos iniciales.
2. Ejecutar el script de M4 sobre la base de datos `Ventas_Tech_DB`.
3. Ejecutar el script de M5 sobre la misma base de datos.
4. Los scripts deben ejecutarse en orden: M3 → M4 → M5.
