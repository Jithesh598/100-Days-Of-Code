/* Write your T-SQL query statement below */
-- select employee_id from employees 
-- where employee_id not in (
-- select e1.employee_id from employees e1
-- join employees e2 on e1.employee_id = e2.manager_id 
-- where e1.salary < 30000 ;

-- e2.manager_id not in e1.employee_id ;


-- select e1.employee_id , e1.manager_id from employees e1 join
-- employees e2 on e1.employee_id = e2.employee_id ;
-- where e1.manager_id not in 

-- (
select distinct e1.employee_id from employees e1
full outer join employees e2 on e1.employee_id = e2.manager_id 
where e1.salary < 30000 and e1.manager_id not in (

-- );
select e1.employee_id from employees e1 full outer join
employees e2 on e1.employee_id = e2.employee_id ) 
order by e1.employee_id;
-- where e1.salary < 30000 );