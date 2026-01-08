# Write your MySQL query statement below
with b as
(
SELECT a1.machine_id,
a1.process_id,
a1.activity_type as activity1,
a1.timestamp as time1,
a2.activity_type as activity2,
a2.timestamp as time2,
(a2.timestamp - a1.timestamp) as duration
FROM Activity a1 
JOIN Activity a2 ON a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'
) 

SELECT b.machine_id,
ROUND(AVG(b.duration),3) as processing_time
FROM b
GROUP BY machine_id