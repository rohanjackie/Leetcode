# Write your MySQL query statement below
-- find prices for product_id on date '2019-08-16'
-- if product price started after 16th then initial price shoul have started from 10 on that day
with cte as(
    select *, rank() over(partition by product_id order by change_date desc) as rnk
    from Products
    where change_date <= '2019-08-16'
)
select product_id, new_price as price
from cte
where rnk = 1
union
select product_id, 10 as price
from products
where product_id not in (select product_id from cte)
