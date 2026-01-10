# Write your MySQL query statement below
SELECT *
FROM Cinema c
WHERE c.id % 2 <> 0 AND description <> "boring"
ORDER BY rating DESC 
-- % 2 <> 0 means where the remainder of the value divided by 2 is not equal to 0 - useful way for identifying odd numbers