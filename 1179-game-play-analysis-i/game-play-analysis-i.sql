# Write your MySQL query statement below
with ran as (
select player_id, event_date, rank() over(partition by player_id order by event_date asc) as date_rank from activity 
)
select player_id, event_date as first_login from ran
where date_rank = 1;