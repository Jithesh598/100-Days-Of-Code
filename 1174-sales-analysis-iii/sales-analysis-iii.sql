# Write your MySQL query statement below
select product_id, product_name from product 
where product_id not in (

select p.product_id from product p
left join sales s on p.product_id = s.product_id 
where sale_date is null or sale_date not between '2019-01-01' and '2019-03-31' );