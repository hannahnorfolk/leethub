# Write your MySQL query statement below
SELECT q.query_name,
ROUND(AVG(
    (q.rating/q.position)),2) as quality,
ROUND((SUM(q.rating < 3)/COUNT(q.query_name)*100),2)as poor_query_percentage
FROM Queries q
GROUP BY q.query_name