# Write your MySQL query statement below
SELECT v.customer_id,
COUNT(DISTINCT(v.visit_id)) as count_no_trans
FROM Visits as v
LEFT OUTER JOIN Transactions as t ON v.visit_id=t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id
