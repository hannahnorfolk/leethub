# Write your MySQL query statement below
SELECT w1.id as Id
FROM Weather W1
JOIN Weather W2 ON W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL 1 DAY)
WHERE W1.temperature > W2.temperature
-- don't assume the days are consecutive! Doing a join will ensure each row is one day after the other