# Write your MySQL query statement below
-- select d.name as department, e.name as employee, e.salary as salary from employee e
-- inner join department d on e.departmentid = d.id 
-- group by d.name
-- order by e.salary desc;


-- with n as (
-- select d.name as department, e.name as employee, e.salary as salary from employee e
-- inner join department d on e.departmentid = d.id 
-- group by d.name
-- order by e.salary desc )

with r as (
select d.name as department, e.name as employee, e.salary as salary, rank() over ( partition by d.name order by e.salary desc ) as dept_rank from employee e
join department d on e.departmentid = d.id 
)
select department, employee, salary from r 
where dept_rank = 1;