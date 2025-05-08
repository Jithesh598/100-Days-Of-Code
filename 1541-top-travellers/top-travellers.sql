# Write your MySQL query statement below
with ss as (
select u.name as name, sum(r.distance) as travelled_distance from users u
left join rides r on u.id = r.user_id 
group by u.id, u.name
order by travelled_distance desc, name asc 
)

select name, coalesce(travelled_distance, 0) as travelled_distance from ss 
order by travelled_distance desc, name asc ;