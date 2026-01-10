# Write your MySQL query statement below
WITH t as (
SELECT st.student_id,
st.student_name,
su.subject_name
FROM Students st
CROSS JOIN Subjects su 
)
SELECT t.student_id,
t.student_name,
t.subject_name,
COUNT(e.student_id) as attended_exams
FROM t 
LEFT JOIN Examinations e 
ON t.student_id = e.student_id
AND t.subject_name = e.subject_name
GROUP BY t.student_id, t.student_name, t.subject_name
ORDER BY t.student_id, t.subject_name