# Write your MySQL query statement below
-- return all employees with primary departments
-- return only one result for employee with its primary department
-- return first deaprtment if employee does not have primary department - if one department primary is 'N'
with cte as (
    select *, row_number() over(partition by employee_id order by case when primary_flag = 'Y' then 1 else 2 end) as rnk
    from Employee
)

select employee_id, department_id
from cte
where rnk = 1
