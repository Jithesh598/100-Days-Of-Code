# Write your MySQL query statement below
-- select machine_id, process_id, (select timestamp from activity where activity_type = 'end') - (select timestamp from activity where activity_type = 'start') as diff from activity
-- group by machine_id, process_id;
with s as (
select machine_id, process_id, case
    when activity_type = 'start' then -1*timestamp 
    when activity_type = 'end' then 1*timestamp
    end as timestamp1 from activity
),
ss as (
select machine_id, process_id, sum(round(timestamp1,3)) as timestamp2 from s
group by machine_id, process_id
)
select machine_id, round(avg(timestamp2),3) as processing_time from ss
group by machine_id
;
