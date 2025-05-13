# Write your MySQL query statement below
with s as (
select user_id, activity_date,
case
    when activity_type = 'free_trial' then activity_duration
    else null
end as trail_duration ,
case
    when activity_type = 'paid' then activity_duration
    else null
end as paid_duration
from useractivity 
),
ss as (
select user_id, avg(trail_duration) as trial_avg_duration, avg(paid_duration) as paid_avg_duration from s
group by user_id 
)
select ss.user_id, round(ss.trial_avg_duration,2) as trial_avg_duration, round(ss.paid_avg_duration, 2) as paid_avg_duration from ss
where ss.user_id is not null and trial_avg_duration is not null and paid_avg_duration is not null;