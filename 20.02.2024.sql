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
