/* Write your T-SQL query statement below */
WITH f AS (
SELECT product_id,
MIN(year) as fy
FROM Sales
GROUP BY product_id
)

SELECT s.product_id,
f.fy as first_year,
s.quantity,
s.price
FROM Sales s
INNER JOIN f on f.product_id = s.product_id and f.fy = s.year