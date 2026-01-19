/* Write your T-SQL query statement below */
-- note to self: if no price exists before that date, it will be 10
WITH m AS (
  SELECT
    product_id,
    MAX(change_date) AS change_date
  FROM Products
  WHERE change_date <= '2019-08-16'
  GROUP BY product_id
)
SELECT
  p.product_id,
  COALESCE(pr.new_price, 10) AS price
FROM (
  SELECT DISTINCT product_id FROM Products
) p
LEFT JOIN m
  ON p.product_id = m.product_id
LEFT JOIN Products pr
  ON pr.product_id = m.product_id
 AND pr.change_date = m.change_date