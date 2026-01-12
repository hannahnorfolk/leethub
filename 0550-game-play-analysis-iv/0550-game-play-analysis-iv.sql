# Write your MySQL query statement below
WITH CTE as (
SELECT player_id,
event_date,
MIN(event_date) OVER(
    PARTITION BY player_id
) as day_one,

LEAD(event_date) OVER (
    PARTITION BY player_id
    ORDER BY event_date
) as next_event_date
FROM Activity
)

SELECT ROUND(
    COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM activity),2) AS fraction
FROM CTE
WHERE DATE_ADD(day_one, INTERVAL 1 DAY) = next_event_date
        
