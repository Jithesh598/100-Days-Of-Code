# Write your MySQL query statement below

select register.contest_id , round(count(distinct(register.user_id)) * 100 / (select count(*) from users) ,2) as percentage from register 
group by register.contest_id
order by percentage desc, register.contest_id asc;


