WITH consulta_z AS (
  SELECT
  customer_id AS customer,
  order_date AS last_order,
  ROW_NUMBER () OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS row_num,
  LEAD (order_date) OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS previous_order
  FROM orders
),

consulta_y AS (
  SELECT
  customer,
  last_order,
  previous_order,
  DATEDIFF(last_order, previous_order) as days
  FROM consulta_z
  WHERE row_num = 1
),
  
consulta_x AS (
  SELECT *,
  CASE
  WHEN days IS NULL THEN 'nuevo'
  WHEN days <= 15 THEN 'frecuente'
  WHEN days BETWEEN 16 AND 45 THEN 'ocasional'
  ELSE 'en riesgo' END AS segment
  FROM consulta_y
)
  
SELECT
segment,
COUNT(*) AS num_customers,
COUNT(*) * 1.0 / (SUM(COUNT(*)) OVER()) AS pct
FROM consulta_x
GROUP BY segment;