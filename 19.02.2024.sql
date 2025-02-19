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

