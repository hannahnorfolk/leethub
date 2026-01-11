# Write your MySQL query statement below
with first_order as (
SELECT *,
ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY order_date ASC ) as rn
FROM Delivery
)
SELECT ROUND(
    SUM(order_date = customer_pref_delivery_date)*100.0/COUNT(delivery_id)
    ,2) as immediate_percentage
FROM first_order
WHERE first_order.rn=1