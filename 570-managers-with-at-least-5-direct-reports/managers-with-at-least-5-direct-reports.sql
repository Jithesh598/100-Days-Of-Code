# Write your MySQL query statement below

# with five_direct_reports as (
   
#    select id, name,count(managerid) from employee
#     group by managerid
#     having count(managerid) > 5 
# ) 
# select five_direct_reports.name from five_direct_reports
# join employee on five_direct_reports.id = employee.managerid ;


with five_direct_reports as (
   
   select managerid, count(managerid) from employee
   group by managerid
    having count(managerid) >= 5
) 
select employee.name from five_direct_reports
join employee on five_direct_reports.managerid = employee.id ;


 # select e.managerid, e.name,count(e.managerid) as c from employee e
 # join employee e1 on e.managerid = e1.id
 # group by managerid 
 # having c > 5;

