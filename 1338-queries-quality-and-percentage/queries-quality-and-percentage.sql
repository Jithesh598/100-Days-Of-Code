# Write your MySQL query statement below
select distinct(query_name), round(avg(rating / position),2) as quality, round(sum(IF(rating < 3, 1, 0)) * 100 / count(query_name), 2) AS poor_query_percentage
from queries where query_name is not null
group by query_name ;
