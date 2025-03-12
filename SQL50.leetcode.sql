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

--1378
select
    unique_id,
    name
from employees A
left join employeeuni B on A.id = B.id

--1068
  select
    product_name,
    year,
    price
from sales A
join product B on A.product_id = B.product_id

--1581
select
    customer_id,
    count(*) as count_no_trans
from visits A
left join transactions B on A.visit_id = B.visit_id
where transaction_id is null
group by customer_id

--197
select
  today.Id
from weather today
cross join weather yesterday
where date(today.recorddate) - date(yesterday.recorddate) = 1
    and today.temperature > yesterday.temperature

--1661
select
    machine_id,
    round(avg(end_point::decimal-timestamp::decimal),3) as processing_time
from
(
select *,
    lead(timestamp) over (partition by machine_id, process_id order by timestamp) as end_point
from activity
) cte
where end_point is not null
group by machine_id

--Hoặc
select
machine_id,
round(
    avg(
        case
        when activity_type = 'start' then -timestamp
        else timestamp
        end
    ) :: decimal * 2,3
) processing_time
from activity
group by machine_id
order by machine_id

--Hoặc
select
    cte.machine_id,
    round(avg(cte.timestamp::decimal-A.timestamp::decimal),3) as processing_time
from
(
select *
from activity
where activity_type != 'start'
) cte
join activity A on cte.machine_id = A.machine_id
and cte.process_id = A.process_id
where cte.timestamp != A.timestamp
group by cte.machine_id

--577
select
    name,
    bonus
from employee A
left join bonus B on A.empid = B.empid
where bonus < 1000 or bonus is null

--1280
select
    cte.student_id,
    cte.student_name,
    cte.subject_name,
    coalesce(count(C.subject_name),0) as attended_exams
from
(
select
    A.*,
    B.*
from students A
cross join subjects B
) cte
left join examinations C on cte.student_id = C.student_id
and cte.subject_name = C.subject_name
group by cte.student_id,cte.student_name,cte.subject_name
order by student_id, subject_name

--570
  select
    name
from employee
where id in
(
select
    managerid
from employee
group by managerid
having count(id) >= 5
)

--1934
select
    B.user_id,
    round(coalesce(avg((action='confirmed')::int),0),2) as confirmation_rate
from confirmations A
right join signups B on A.user_id = B.user_id
group by B.user_id

--1731
with cte as
(
select
    reports_to
from employees
group by reports_to
having count(*) >= 1
)

select
    A.employee_id,name,
    reports_count,average_age
from
(
select
    reports_to as employee_id,
    count(*) as reports_count,
    round(avg(age)::decimal) as average_age
from employees
where reports_to in (select * from cte)
group by reports_to
) A
join employees B on A.employee_id = B.employee_id
order by A.employee_id

--Hoặc
select
    B.reports_to as employee_id,
    A.name,
    count(*) as reports_count,
    round(avg(B.age)::decimal,0) as average_age
from employees A
join employees B on A.employee_id = B.reports_to
group by B.reports_to,A.name
order by employee_id

--1789
select
    employee_id,
    department_id
from employee
where employee_id in
(
select
    employee_id
from employee
group by employee_id
having count(*) = 1
)
or primary_flag = 'Y'

--610
select *,
    case
    when x+y>z and x+z>y and y+z>x then 'Yes'
    else 'No'
    end triangle
from triangle

--180
select
    distinct num as ConsecutiveNums
from
(
select *,
    lead(num) over (order by id) as t1,
    lead(num,2) over (order by id) as t2
from logs
) cte
where num = t1 and num = t2

--1164
select
    B.product_id,
    coalesce(new_price,10) as price
from
(
select
    product_id,
    max(change_date) as change_date
from products
where change_date <= to_date('2019-08-16','yyyy-mm-dd')
group by product_id
) cte
join products A on cte.product_id = A.product_id
and cte.change_date = A.change_date
right join (select distinct product_id from products) B
on cte.product_id = B.product_id
--Hoặc sử dụng ROW_NUMBER()

--1204
select
    person_name
from
(
select
    person_name,
    sum(weight) over (order by turn) as total_weight
from queue
) cte1
where total_weight <= 1000
order by total_weight desc
limit 1

--1907
with cte1 as
(
select'Low Salary' as category
union
select 'Average Salary'
union
select 'High Salary'
)

select
    cte1.category,
    coalesce(accounts_count,0) as accounts_count
from
(
select
    case
    when income < 20000 then 'Low Salary'
    when income between 20000 and 50000 then 'Average Salary'
    else 'High Salary'
    end as category,
    count(*) as accounts_count
from accounts
group by category
) cte2
right join cte1 on cte2.category = cte1.category
