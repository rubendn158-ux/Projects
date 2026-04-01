# Segmentación de Clientes con SQL Avanzado

## Descripción
Este proyecto implementa un análisis de segmentación de clientes basado en su comportamiento de compra. La consulta identifica la última compra de cada cliente, calcula los días desde su compra anterior y clasifica a los clientes en segmentos estratégicos.

## Tecnologías
- SQL (compatible con MySQL, PostgreSQL, SQLite)
- DB Fiddle / SQLite para pruebas

## Conceptos SQL demostrados
- **CTEs (WITH)** para descomponer la lógica en pasos claros
- **Window Functions**: `ROW_NUMBER()` y `LEAD()` para análisis temporal
- **Agregaciones con ventana**: `SUM(COUNT(*)) OVER()` para porcentajes
- **CASE** para segmentación condicional
- **Análisis de cohortes** y segmentación de clientes

## Archivos
- `consulta.sql`: Script completo con la lógica de segmentación
- `presentacion.pdf`: Visualización explicativa del análisis
- `resultado_ejemplo.csv`: Muestra del output generado

## Resultado del análisis
La consulta produce una tabla con:
- Segmento del cliente (nuevo, frecuente, ocasional, en riesgo)
- Número de clientes por segmento
- Porcentaje que representa cada segmento del total

## Ejecutar en DB Fiddle
https://www.db-fiddle.com/f/r8LLBdFG7YFVFtUjpKAdY/18

-

*Proyecto desarrollado como parte de portafolio para roles de Data Analyst / BI Analyst*
