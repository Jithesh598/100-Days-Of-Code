# Write your MySQL query statement below
-- with vs as (
-- select p.product_id as product_id, p.product_name as product_name, sum(o.unit) as cnt from products p
-- join orders o on p.product_id = o.product_id
-- group by p.product_id, p.product_name
-- )
-- select product_name, cnt from vs 
-- inner join orders o on vs.product_id = o.product_id 
-- group by product_name
-- having month(o.order_date) = 2;
-- -- where o.order_date between 2020-02-01 and 2020-02-28;

-- -- and o.order_date between 2020-02-01 and 2020-02-28 ;








with ss as (
select p.product_id as product_id, p.product_name as product_name, p.product_category as product_category, o.order_date as order_date, o.unit as unit from products p
left join orders o on p.product_id = o.product_id 
where month(o.order_date) = 02 and year(o.order_date) = 2020
)
select product_name, sum(unit) as unit from ss
group by product_name 
having sum(unit) >= 100;






