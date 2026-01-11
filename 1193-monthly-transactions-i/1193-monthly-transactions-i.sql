# Write your MySQL query statement below
SELECT DATE_FORMAT(trans_date,'%Y-%m') as month,
country,
COUNT(DISTINCT id) as trans_count,
SUM(amount) as trans_total_amount,
COUNT(DISTINCT(CASE WHEN state = 'approved' then id else null end)) as approved_count,
SUM(CASE WHEN state = 'approved' then amount else 0 end) as approved_total_amount
FROM Transactions t
GROUP BY country,DATE_FORMAT(trans_date,'%Y-%m') 




