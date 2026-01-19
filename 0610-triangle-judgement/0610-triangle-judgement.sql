/* Write your T-SQL query statement below */
-- all sides must be +ve and each side must be less than the sum of the other two sides
with T as (
SELECT
x,
y,
z,
CASE WHEN x > 0 and x < (y+z) then 'y' END as xbool ,
CASE WHEN y > 0 and y < (x+z) then 'y' END as ybool ,
CASE WHEN z > 0 and z < (x+y) then 'y' END as zbool
FROM Triangle
)
SELECT x,
y,
z,
CASE WHEN xbool = 'y' AND ybool = 'y' AND zbool = 'y' THEN 'Yes' ELSE 'No' END as triangle
FROM T