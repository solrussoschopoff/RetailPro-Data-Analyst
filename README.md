RetailPro - Data Analyst

Proyecto de análisis de datos desarrollado para RetailPro, una empresa distribuidora de tecnología, en el marco del curso de Data Analyst de CoderHouse.

El repositorio documenta las distintas etapas del proyecto, desde la creación de una base de datos relacional y el desarrollo de consultas SQL hasta la preparación de datos mediante ETL, el diseño conceptual de un dashboard ejecutivo y el modelado analítico en Power BI.

Herramientas y tecnologías utilizadas

SQL Server: creación y gestión de la base de datos, y ejecución de consultas SQL.

Power BI: preparación, modelado y análisis de datos.

Power Query y Lenguaje M: transformación y limpieza de datos mediante un pipeline ETL.

DAX: creación de medidas para el análisis de ventas y la inteligencia de tiempo.

Estructura del proyecto por etapas

M3 - Base de datos

Creación de la base de datos Ventas_Tech_DB.

Definición de tablas, claves primarias, claves foráneas y restricciones.

Carga de datos iniciales.

M4 - Consultas de negocio

Desarrollo de consultas SQL para obtener métricas de ventas.

Generación de rankings de productos y análisis de clientes recurrentes.

Comparación de la facturación mensual con el promedio del período.

M5 - Consultas con JOINs

Cruce de información mediante INNER JOIN y LEFT JOIN.

Uso de UNION ALL para consolidar resultados.

Identificación de clientes y productos sin ventas registradas.

M6 - Pipeline ETL con Power Query y M

Construcción de un pipeline ETL en Power BI a partir del dataset Pipeline_ETL_Dataset.xlsx.

Perfilado y limpieza de datos, tratamiento de duplicados y valores nulos.

Estandarización de tipos de datos y nomenclatura.

Enriquecimiento de Fact_Ventas mediante un Merge con Dim_Productos.

Documentación de transformaciones y decisiones técnicas mediante Lenguaje M.

Archivo PBIX: M6/Pipeline_ETL_Russo_Maria_Sol.pbix

M7 - Boceto del Dashboard RetailPro

Diseño conceptual del dashboard ejecutivo para analizar diferencias de ventas entre los canales Online y Presencial según la categoría de productos.

Definición del propósito, la pregunta de análisis y la distribución de los elementos visuales según el patrón de lectura en Z.

Propuesta de cuatro KPIs principales, un gráfico de líneas para la evolución mensual, un gráfico de barras agrupadas por categoría y una matriz de detalle por producto y canal.

M8 - Modelo de datos y medidas DAX

Construcción del modelo analítico en Power BI a partir del pipeline ETL desarrollado en M6.

Configuración de relaciones 1 activas y de dirección única entre Dim_Clientes, Dim_Productos y Dim_Fechas con Fact_Ventas, y entre Dim_Categorias y Dim_Productos.

Creación de Dim_Fechas como tabla calendario y de la tabla _Medidas.

Implementación de cinco medidas DAX: Total Ventas, Ventas Online, Ventas YTD, Ventas LY y % Crecimiento Anual.

Aplicación de funciones como SUM, CALCULATE, funciones de inteligencia de tiempo, VAR y DIVIDE.

Archivo PBIX: M8/Russo_Maria_Sol_Checkpoint2.pbix

Cómo ejecutar los scripts SQL

Motor de base de datos: SQL Server.

Para crear la base de datos y ejecutar las consultas analíticas, seguir este orden:

Ejecutar el script de M3 para crear Ventas_Tech_DB, definir las tablas y cargar los datos iniciales.

Ejecutar el script de M4 sobre la base de datos Ventas_Tech_DB para incorporar los registros adicionales y realizar las consultas de negocio.

Ejecutar el script de M5 sobre la misma base de datos para realizar las consultas con JOINs y las demás operaciones incluidas en esa etapa.

Los scripts SQL deben ejecutarse en orden: M3 → M4 → M5.
