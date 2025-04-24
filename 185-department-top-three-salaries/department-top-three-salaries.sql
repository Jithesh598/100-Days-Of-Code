# Write your MySQL query statement below
with dd as (
select d.name as department, e.name as employee, e.salary as salary, dense_rank() over ( partition by d.name order by e.salary desc ) as dept_rank from employee e
join department d on e.departmentid = d.id 
)
select department, employee, salary from dd 
where dept_rank <= 3 ;

