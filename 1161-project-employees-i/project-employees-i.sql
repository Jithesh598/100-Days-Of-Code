# Write your MySQL query statement below
select project.project_id, round(avg(employee.experience_years) , 2) as average_years from project
right join employee on project.employee_id = employee.employee_id 
where project.project_id is not null
group by project.project_id
order by project.project_id;