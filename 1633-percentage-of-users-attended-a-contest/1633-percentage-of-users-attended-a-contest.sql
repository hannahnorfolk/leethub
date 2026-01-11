# Write your MySQL query statement below
SELECT r.contest_id, 
ROUND(
    (COUNT(DISTINCT r.user_id)/
        (SELECT COUNT(DISTINCT u.user_id)
        FROM Users u))
        *100,2)
         as percentage
FROM Register r
LEFT JOIN Users u on u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC