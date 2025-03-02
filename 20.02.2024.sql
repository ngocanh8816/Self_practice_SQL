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

--1527. Patients With a Condition: https://leetcode.com/problems/patients-with-a-condition/?envType=study-plan-v2&envId=top-sql-50


--1517. Find Users With Valid E-Mails: https://leetcode.com/problems/find-users-with-valid-e-mails/description/?envType=study-plan-v2&envId=top-sql-50
select
    user_id,
    name,
    mail
from users
where mail ~ '^[a-zA-Z]+[-a-zA-Z0-9._]*@leetcode\.com$'

--Giải thích:
^: Ký hiệu bắt đầu của chuỗi. Nó đảm bảo rằng biểu thức regex khớp từ đầu chuỗi.

[a-zA-Z]+: Khớp với một hoặc nhiều ký tự chữ cái (chữ hoa hoặc chữ thường).

[a-zA-Z0-9_.-]*: Khớp với 0 hoặc nhiều ký tự chữ cái, chữ số, dấu chấm (.), dấu gạch dưới (_), hoặc dấu gạch ngang (-).

@leetcode\.com: Khớp với chuỗi chính xác @leetcode.com. Ký tự . được thoát bằng dấu gạch chéo ngược (\) vì trong regex, . đại diện cho bất kỳ ký tự nào.

$: Ký hiệu kết thúc của chuỗi. Nó đảm bảo rằng biểu thức regex khớp đến hết chuỗi.

--Kiểm tra xem giá trị của cột mail có bắt đầu bằng một hoặc nhiều ký tự chữ cái (không phân biệt hoa thường) ([a-zA-Z]+).

--Theo sau là 0 hoặc nhiều ký tự chữ cái, chữ số, dấu chấm, dấu gạch dưới, hoặc dấu gạch ngang ([a-zA-Z0-9_.-]*).

--Kết thúc với chuỗi chính xác @leetcode.com.

Trong biểu thức chính quy trên, không nên đặt dấu gạch ngang (-) nằm trong một khoảng ký tự không được thoát ra (escaped), dẫn đến lỗi "Invalid regular expression".
Để sửa lỗi này, ta cần đưa dấu gạch ngang vào vị trí đầu hoặc cuối của nhóm ký tự. Ví dụ sửa như:
WHERE mail ~ '^[a-zA-Z]+[a-zA-Z0-9._-]*@leetcode\.com$' hoặc WHERE mail ~ '^[a-zA-Z]+[-a-zA-Z0-9._]*@leetcode\.com$'

--1341. Movie Rating: https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50
with cte_1 as
(
select
user_id,
count(*) as count_movie
from movierating
group by user_id
),
cte_2 as
(
select
movie_id,
avg(rating) as avg_rating
from movierating
where to_char(created_at,'yyyy-mm') = '2020-02'
group by movie_id
)

(
select
min(name) as results
from cte_1
join users B on cte_1.user_id = B.user_id
where count_movie in (select max(count_movie) from cte_1)
)
union all
(
select
min(title) as results
from cte_2
join movies C on cte_2.movie_id = C.movie_id
where avg_rating in (select max(avg_rating) from cte_2)
)

--Hoặc cách giải khác
select name as results
from
(
select
name,
count(*) as count_movie
from movierating A
join users B on A.user_id = B.user_id
group by A.user_id,name
order by count_movie desc,name
limit 1
)

union all

select title as results
from
(
select
title,
avg(rating) as avg_rating
from movierating A
join movies B on A.movie_id = B.movie_id
where to_char(created_at,'yyyy-mm') = '2020-02'
group by A.movie_id, title
order by avg_rating desc, title
limit 1
)
