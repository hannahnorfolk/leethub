/* Write your T-SQL query statement below */
-- find distinct count of all products
-- distinct count of customer products
-- join 
-- find customers who has same distinct count as product table

WITH C AS (
    SELECT customer_id,
    COUNT(DISTINCT product_key) as unique_prod
    FROM Customer
    GROUP BY customer_id
),

 P AS (
SELECT COUNT(DISTINCT product_key) as all_prod
FROM Product
)

SELECT customer_id
FROM C
INNER JOIN P ON c.unique_prod = p.all_prod