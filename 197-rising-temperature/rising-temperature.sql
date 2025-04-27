# Write your MySQL query statement below
with tem as (
select id, recordDate, temperature, lag(temperature) over (order by recorddate) as prev_value, lag(recordDate) over (order by recorddate) as prev_date from weather 
)
select id from tem
where datediff(recorddate, prev_date) = 1  and temperature > prev_value ;