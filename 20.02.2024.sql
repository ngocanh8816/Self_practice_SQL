LEETCODE
--1211. Queries Quality and Percentage: https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50
select
    query_name,
    round(avg(rating / position :: decimal),2) as quality,
    round(sum((rating < 3):: int) * 100 / count(*)::decimal,2) poor_query_percentage
    --hoặc round(avg((rating < 3):: int) * 100 ,2) poor_query_percentage
from queries
group by query_name
order by query_name

--1934. Confirmation Rate: https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50
select
    A.user_id,
    coalesce(round(avg((action = 'confirmed')::int),2),0) confirmation_rate
from signups A
left join confirmations B on A.user_id = B.user_id
group by A.user_id

--1251. Average Selling Price: https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50
select
    A.product_id,
    coalesce(round(sum(price * units)/sum(units)::decimal,2),0) as average_price
from prices A
left join unitssold B on A.product_id = B.product_id
where purchase_date between start_date and end_date
      or purchase_date is null
group by A.product_id

--1633. Percentage of Users Attended a Contest: https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50
select
    contest_id,
    round(count(*)/
    (select count(*) from users)::decimal*100,2) as percentage
from register
group by contest_id
order by percentage desc, contest_id

--619. Biggest Single Number: https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50
select
case
    when count(*) = 1 then num
    else null
end num
from mynumbers
group by num
order by num desc nulls last
limit 1
--NULLs First: Giá trị NULL sẽ xuất hiện đầu tiên khi sắp xếp theo thứ tự tăng dần (ASC).
--NULLs Last: Giá trị NULL sẽ xuất hiện cuối cùng khi sắp xếp theo thứ tự giảm dần (DESC).
--Cách khác: tìm dãy số chứa các số chỉ xuất hiện đúng 1 lần. Sau đó tìm giá trị lớn nhất trong dãy số đó
select
    max(num) as num
from
(
    select num
    from mynumbers
    group by num
    having count(*) = 1
) cte

--180. Consecutive Numbers: https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50
select distinct
    num as ConsecutiveNums 
from
    (
    select*,
    lead(num,1) over (order by id) after_num_1,
    lead(num,2) over (order by id) after_num_2
    from logs
    ) cte
where num = after_num_1 and num = after_num_2
