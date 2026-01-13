/* Write your T-SQL query statement below */
WITH C as (
SELECT COUNT(DISTINCT student) as s,
class
FROM Courses
GROUP BY class
)

SELECT
class
FROM C
WHERE s >= 5
GROUP BY class