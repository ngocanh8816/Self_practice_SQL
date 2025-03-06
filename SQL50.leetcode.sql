--1757
select
  product_id
from products
where low_fats = 'Y' and recyclable = 'Y'

--584
select
  name
from customer
where referee_id != 2 or referee_id is null

--595
select
  name,
  population,
  area
from World
where area >= 3000000 or population >= 25000000

--1148
select
  distinct author_id as id
from Views
where author_id = viewer_id
order by id

--1683
select
    tweet_id
from Tweets
where length(content) > 15

--1667
SELECT
  user_id,
  initcap(name) as name
from users
order by user_id

--1527
select
    patient_id,
    patient_name,
    conditions
from Patients
where conditions ~ '(^| )DIAB1'

--196
delete
from person
where id not in 
  (select min(id) from person group by email)

--176
select
  max(salary) as SecondHighestSalary
from employee
where salary <
  (select max(salary) as max_salary from employee)

--1484
select
    sell_date,
    count(distinct product) num_sold,
    string_agg(distinct product,',' order by product) as products
from activities
group by sell_date
order by sell_date
--Hoặc
select
  sell_date,
  sum(num_sold) as num_sold,
  string_agg(product, ',' order by product) as products
from
(
  select *,
  count(distinct product) as num_sold
  from activities
  group by sell_date, product
) cte
group by sell_date
order by sell_date

--1327
select
    product_name,
    sum(unit) as unit
from orders A
join products B on A.product_id = B.product_id
where to_char(order_date,'yyyy-mm') = '2020-02'
group by product_name
having sum(unit) >= 100

--1517
select *
from users
where mail ~ '^[a-zA-Z]+[a-zA-Z0-9_.-]*@leetcode\.com$'

--1978
select
    employee_id
from employees
where salary < 30000 and manager_id not in
  (select employee_id from employees)
order by employee_id

--626
select
id,
case
    when id%2 = 0 then lag(student) over (order by id)
    else coalesce(lead(student) over (order by id), student)
end student
from seat

--1341
(select
    name as results
from
(
select
    user_id,
    count(*) as count_movie
from MovieRating
group by user_id
) cte_1
join users A on cte_1.user_id = A.user_id 
order by count_movie desc, name
limit 1)
union all
(select
    title
from
(
select
    movie_id,
    avg(rating) as avg_rating
from MovieRating
where to_char(created_at,'yyyy-mm') = '2020-02'
group by movie_id
) cte_2
join movies B on cte_2.movie_id = B.movie_id
order by avg_rating desc, title
limit 1)

--1321
select
    visited_on,
    amount,
    round(average_amount,2) as average_amount
from
(
select
    visited_on,
    sum(amount) over (order by visited_on rows between 6 preceding and current row) amount,
    avg(amount) over (order by visited_on rows between 6 preceding and current row)
    average_amount
from
    (
    select
    visited_on,
    sum(amount) as amount
    from customer
    group by visited_on
    ) tem
) cte
where visited_on >= (select min(visited_on) from customer) + 6
order by visited_on

--602
with cte_1 as
(
select
    requester_id as id,
    count(*) as num
from RequestAccepted
group by requester_id
union all
select
    accepter_id as id,
    count(*) as num
from RequestAccepted
group by accepter_id
)

select
    id,
    sum(num) as num
from cte_1
group by id
order by num desc
limit 1

--585
select
  round(sum(tiv_2016)::decimal,2) as tiv_2016
from Insurance
where tiv_2015 in
(
select tiv_2015
from Insurance
group by tiv_2015
having count(*) > 1
)
and (lat,lon) in
(
select lat, lon
from Insurance
group by lat, lon
having count(*) = 1
--Hoặc
select round(sum(tiv_2016)::decimal,2) as tiv_2016
from Insurance
where pid in
(
select pid
from
(
select
    pid,
    count(*) over (partition by tiv_2015) as count_tiv,
    count(*) over (partition by lat,lon) as count_location
from Insurance
) cte
where count_tiv > 1 and count_location = 1
)

--185
select
    B.name as Department,
    cte.name as Employee,
    Salary
from
(
select
    name,
    salary,
    departmentid,
    dense_rank() over (partition by departmentId order by salary desc) as rank
from Employee A
) cte
join Department B on cte.departmentId = B.id
where rank <= 3
