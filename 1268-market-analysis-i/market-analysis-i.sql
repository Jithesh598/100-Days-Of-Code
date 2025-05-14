/* Write your T-SQL query statement below */
-- with ss as (
-- select * from users u
-- full outer join orders o on u.user_id = o.buyer_id 
-- )
-- select buyer_id, join_date, count(order_id) as orders_in_2019
-- from ss
-- group by buyer_id, join_date;

-- where year(order_date) = 2019

-- with ss as (
-- select * from users u
-- join orders o on u.user_id = o.buyer_id 
-- ),
-- sa as (
-- select buyer_id, join_date,
-- case
--      when year(order_date) = 2019 then 1
--      else 0
-- end as cnt
-- from ss 
-- )
-- -- group by buyer_id, join_date;
-- select buyer_id, join_date, sum(cnt) as orders_in_2019 from sa
-- group by buyer_id, join_date
-- order by buyer_id asc;

-- WITH ss AS (
--   SELECT 
--     u.user_id, 
--     u.join_date, 
--     o.order_date
--   FROM users u
--   LEFT JOIN orders o ON u.user_id = o.buyer_id 
-- )
-- SELECT 
--   user_id AS buyer_id,
--   join_date,
--   COUNT(CASE 
--            WHEN YEAR(order_date) = 2019 THEN 1 
--        END) AS orders_in_2019
-- FROM ss 
-- GROUP BY user_id, join_date
-- ORDER BY user_id;

---

-- select buyer_id, join_date, ifnull(sum(cnt),0) as orders_in_2019 from sa
-- group by buyer_id, join_date
-- order by buyer_id asc;

with ss as (
select u.user_id, u.join_date, o.order_date from users u
left join orders o on u.user_id = o.buyer_id 
),
sa as (
select user_id as buyer_id, join_date,
case
     when year(order_date) = 2019 then 1
     else 0
end as cnt
from ss 
)
select buyer_id, join_date, sum(cnt) as orders_in_2019 from sa
group by buyer_id, join_date
order by buyer_id asc;
