-- Intro 
-- Question:
-- We would like to find the total weight of cats grouped by age. But only return those groups with a total weight larger than 12.

select 
age,sum(weight) as total_weight
 from cats 
group by 1
having sum(weight) >12
order by 1

-- Over
-- Question:
-- The cats must by ordered by name and will enter an elevator one by one. We would like to know what the running total weight is.

select 
name,sum(weight) over(order by name) as running_total_weight
from cats 


-- Partitioned Running Totals
-- Question:
-- The cats must by ordered first by breed and second by name. They are about to enter an elevator one by one. When all the cats of the same breed have entered they leave.

-- We would like to know what the running total weight of the cats is.

select 
name,breed, sum(weight) over(partition by breed order by name) as running_total_Weight
 from cats 
order by breed,nam


-- Examining nearby rows
-- Question:
-- The cats would like to see the average of the weight of them, the cat just after them and the cat just before them.


select 
name,weight,avg(weight) over(order by weight rows between 1 preceding and 1 following)
 from cats 


-- Correct Running Total
-- Question:
-- The cats must by ordered by weight descending and will enter an elevator one by one. We would like to know what the running total weight is.

-- If two cats have the same weight they must enter separately
 
 
select 
name,sum(weight) over(order by weight desc 
rows between unbounded preceding and current row) as running_total_weight
from cats 

