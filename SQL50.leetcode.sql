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

