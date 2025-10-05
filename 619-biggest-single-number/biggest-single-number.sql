# Write your MySQL query statement below
select ifnull (
(select * from MyNumbers
group by num
Having count(*) = 1 
order by num desc limit 1) , null
) as num

