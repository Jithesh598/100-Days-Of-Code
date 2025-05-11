# Write your MySQL query statement below
with ss as (
select u.name as name, count(rating) from movies m
join movierating mr on m.movie_id = mr.movie_id 
join users u on mr.user_id = u.user_id
group by u.name
order by count(rating) desc, u.name asc
limit 1
),
aa as (
select m.title as movie_name, avg(rating) from movies m
join movierating mr on m.movie_id = mr.movie_id 
join users u on mr.user_id = u.user_id
where DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
group by m.title 
order by avg(rating) desc, m.title asc
limit 1)

select name as results from ss
union all
select movie_name from aa;
