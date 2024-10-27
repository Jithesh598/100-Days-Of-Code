# Write your MySQL query statement below

with units_table as (
select prices.product_id, COALESCE(unitssold.units, 0) as total_units, COALESCE(prices.price * unitssold.units, 0)  as price_of_units from prices 
left join unitssold on prices.product_id = unitssold.product_id 
and unitssold.purchase_date between prices.start_date and prices.end_date
) 
select product_id, round(COALESCE(sum(price_of_units) / nullif(sum(total_units), 0), 0), 2) as average_price from units_table
group by product_id ;

