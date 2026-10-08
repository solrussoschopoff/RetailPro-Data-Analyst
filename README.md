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

## M7 - Boceto del Dashboard RetailPro

Diseño del boceto del dashboard de RetailPro, definiendo el propósito, la pregunta de análisis y la distribución de los elementos visuales según el patrón de lectura en Z.

El dashboard se orienta a identificar diferencias en las ventas de las categorías de productos entre los canales Online y Presencial.

La propuesta incluye 4 KPIs principales, un gráfico de líneas para la evolución mensual, un gráfico de barras agrupadas para la comparación por categoría y una matriz de detalle por producto y canal.

## M8 - Modelo de datos y medidas DAX

Construcción del modelo analítico en Power BI a partir del pipeline ETL desarrollado en M6.

Incluye la configuración de un esquema en estrella con relaciones 1:N activas y de dirección única entre las tablas de dimensiones y `Fact_Ventas`, la creación de `Dim_Fechas` como tabla calendario y la creación de la tabla `_Medidas` con cinco medidas DAX core.

Las medidas implementadas son `Total Ventas`, `Ventas Online`, `Ventas YTD`, `Ventas LY` y `% Crecimiento Anual`, utilizando `SUM`, `CALCULATE`, inteligencia de tiempo, `VAR` y `DIVIDE`.

Archivo PBIX: `M8/Russo_Maria_Sol_Checkpoint2.pbix`

## Cómo ejecutar

**Motor:** SQL Server.

1. Ejecutar el script de M3 para crear la base de datos `Ventas_Tech_DB` y cargar los datos iniciales.
2. Ejecutar el script de M4 sobre la base de datos `Ventas_Tech_DB`.
3. Ejecutar el script de M5 sobre la misma base de datos.
4. Los scripts deben ejecutarse en orden: M3 → M4 → M5.
