# Write your MySQL query statement below
with a as(
select id, student,
case
     when id % 2 != 0 and id - (select max(id) from seat) = 0 then id
     when id % 2 != 0 then id+1
     when id % 2 = 0 then id-1
end as swapped_id
from seat
)
select swapped_id as id, student from a
order by id asc;


