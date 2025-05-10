# Write your MySQL query statement below
with ss as (
select user_id, time_stamp, row_number() over(partition by user_id order by time_stamp desc) as ran from logins
where year(time_stamp) = 2020 
)
select user_id, time_stamp as last_stamp from ss
where ran = 1 ;