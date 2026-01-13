/* Write your T-SQL query statement below */
-- join employees to self 
-- distinct count employee_id and having > 0

SELECT m.employee_id,
m.name,
COUNT(e.employee_id) as reports_count,
ROUND(AVG(CAST(e.age AS FLOAT)),0) as average_age
FROM Employees e
INNER JOIN Employees m ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id asc