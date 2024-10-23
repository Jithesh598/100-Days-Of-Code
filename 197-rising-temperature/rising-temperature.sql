/* Write your T-SQL query statement below */


select Id 
from (
        select Id, recordDate, temperature,
               LAG(temperature) over (order by recordDate) as prev_temp,
               LAG(recordDate) over (order by recordDate) as prev_date
        from weather
) t
where prev_temp is not null 
   and prev_date = DATEADD(day,-1,recordDate)
   and temperature > prev_temp ;
