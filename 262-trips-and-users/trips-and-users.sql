# Write your MySQL query statement below
with t1 as (
select t.id as id, t.client_id as client_id , t.driver_id as driver_id , t.city_id as city_id, t.status as status, t.request_at as request_at, u.users_id as users_id, u.banned as client_banned, u.role as role
from trips t join users u on t.client_id = u.users_id
where u.role = 'client' 
),
t2 as (
select id, client_id, driver_id, city_id, status, request_at, t1.users_id as users_id, t1.client_banned, d.banned as driver_banned, t1.role as role from t1 
join users d on t1.driver_id = d.users_id
where d.role = 'driver' 
)

-- select request_at as day, round((select count(id) from t2 where status != 'completed' and client_banned = 'No' and driver_banned = 'No')/(select count(id) from t2 where client_banned = 'No' and driver_banned = 'No'), 2) as 'cancellation rate' from t2
-- where request_at between 2013-10-01 and 2013-10-03
-- group by request_at
-- ;

-- select request_at as day, round(
--     sum(select count(id) from t2 where status != 'completed')*1.0/(select count(*) from t2 ), 2) as 'cancellation rate' from t2
-- where client_banned = 'No' and driver_banned = 'No' and  request_at between 2013-10-01 and 2013-10-03
-- group by request_at ;



select request_at as day , round(
    sum(case when status != 'completed' then 1 else 0 end)*1.0/count(*) ,2) as 'cancellation rate' from t2
where client_banned = 'No' and driver_banned = 'No' and request_at between '2013-10-01' and '2013-10-03'
group by request_at;

-- select request_at, id from t2
-- where status = 'completed' and not banned = 'yes';