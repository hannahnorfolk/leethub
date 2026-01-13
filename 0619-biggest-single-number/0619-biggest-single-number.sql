/* Write your T-SQL query statement below */
WITH fq as (
SELECT 
num,
COUNT(*) as frequency
FROM MyNumbers
GROUP BY num
)
SELECT 
MAX(num) as num
FROM fq
WHERE frequency = 1