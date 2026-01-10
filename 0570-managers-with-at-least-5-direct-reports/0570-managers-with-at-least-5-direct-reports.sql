# Write your MySQL query statement below
SELECT f.name
FROM Employee e 
JOIN Employee f on e.managerId = f.id
GROUP BY f.id
HAVING count(distinct e.id) >=5
