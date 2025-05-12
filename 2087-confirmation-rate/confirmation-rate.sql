/* Write your T-SQL query statement below */
with ss as (
select s.user_id, c.action,
case
     when c.action = 'confirmed' then 1
     else 0
end as cnt
from signups s
full outer join confirmations c on s.user_id = c.user_id 
),
sa as (
select user_id , sum(cnt) as s_count, count(action) as c_rate from ss
group by user_id

)
select user_id, isnull(round(cast(s_count as float)/ nullif(c_rate, 0), 2),0) as confirmation_rate from sa
;
