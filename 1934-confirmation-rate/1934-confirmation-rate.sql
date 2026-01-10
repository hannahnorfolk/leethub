# Write your MySQL query statement below
-- join signups with confirmations to get all users
-- group by action + count timestamps for each user - create custom field for rate

SELECT s.user_id,
ROUND(
    IF(
        COUNT(c.action)=0,
        0,
        SUM(c.action = "confirmed")/COUNT(c.action)),2) as confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id