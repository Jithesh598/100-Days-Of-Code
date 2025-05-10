/* Write your T-SQL query statement below */
select e.employee_id from employees e
full outer join salaries s on e.employee_id = s.employee_id
where s.salary is null or e.name is null and e.employee_id is not null 
union
select s.employee_id from employees e
full outer join salaries s on e.employee_id = s.employee_id
where e.employee_id is null and e.name is null;