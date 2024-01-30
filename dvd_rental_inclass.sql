-- select all columns from actor table
-- select grabs the column we want to display
select * -- selects all the column from our table
from actor; -- from is going to determine the table we are querying

-- selecting specific column from actor table
-- first name and last name
select first_name, last_name
from actor;

-- using the WHERE clause
-- condition to only pull back data matching the WHERE
select first_name, last_name
from actor 
where first_name = 'Nick';

-- using the WHERE clause to find the actor with an id of 2
select first_name, last_name
from actor
where actor_id = 2;

-- using WHERE and LIKE to find a matcg
select first_name, last_name
from actor 
where first_name like 'Joe';

-- using the LIKE with the the wildcard %
-- using LIKE for a partial match
select first_name, last_name
from actor
where first_name like 'J%'; -- % takes place for everything following J

-- using the LIKE and WHERE 
-- to find a three letter name that starts with K
select first_name, last_name
from actor
where first_name like 'K___'; -- count of _ 

select first_name, last_name
from actor
where first_name like 'K___n';

-- Comparison Operators
-- Greater than > Greater than or equal to >=
-- Less than < Less than or equal to <=
-- Equal = only one equal sign
-- Not Equal <>

-- query to check  out what's in our payment table
select *
from payment;

-- query to show customers who spent over 3.00
select customer_id, amount  
from payment
where amount > 3.00;

-- select unique rows where the customers spent over 3.00
-- using the DISTINCT keyword
select distinct customer_id -- select unique instances of customer_id from payment table
from payment
where amount > 3.00 -- the condition to select those customers
order by customer_id; -- ordering the customer_id in asc (ascending) by default

-- select unique rows where the customers spent under 7.99
-- using the DISTINCT keyword
select customer_id, rental_id, amount 
from payment
where amount < 7.99
order by amount desc; -- order amount in desc (descending) 

-- select unique rows where the customers spent greater than or equal to 5.99
-- using the DISTINCT keyword
select customer_id, rental_id, amount 
from payment
where amount >= 5.99
order by amount desc;

-- select unique rows where the customers spent less than or equal to 2.99
-- using the DISTINCT keyword
select customer_id, rental_id, amount 
from payment
where amount <= 2.99
order by amount; -- defaults to asc order

-- limiting the number of records we get back
-- e.g., the top 5 most expensive rentals
select customer_id, rental_id, amount -- select column to display
from payment -- table we are selecting from
order by amount desc -- order our value by amount in descending order so largest go to the top
limit 5; -- limit the return query to 5 records

-- OFFSETting our list
-- between the top 10 and 20 rows
select customer_id, amount 
from payment 
order by amount desc 
limit 10 offset 20; -- offset means skip the top 20, and give me the 21st value

-- using DISTINCT to show unique customer id and then OFFSET to show its functionality
select distinct customer_id 
from payment 
order by customer_id 
limit 10 offset 20; 

-- ORDER BY
-- BETWEEN
select *
from payment
order by amount asc; 

-- using between to show customers who paid between 2 certain amounts
-- BETWEEN goes with WHERE
-- AND to join the two clauses
select customer_id, amount
from payment
where amount between 2.99 and 5.99;

-- query to see customers who paid 0.00 for the rentals
select customer_id, amount
from payment
where amount = 0.00;

-- query to see customers who paid for the rentals
select customer_id, amount
from payment
where amount <> 0.00 -- <> means does not equal
order by amount;

-- SQL Aggregations (runs calculations)- SUM(), AVG(), COUNT(), MIN(), MAX()
-- query to display sum of amount paid
select sum(amount)
from payment;

-- SUM() of amount paid over 5.99
select sum(amount)
from payment
where amount > 5.99; -- for all the amount over 5.99, we take them and add them up


-- query to display average amount paid
select avg(amount)
from payment;

-- AVG() amount paid over 6.99
select avg(amount)
from payment
where amount > 6.99;

-- query to display count of amounts paid
select count(amount)
from payment;

-- show the count of unique or DISTINCT number of payment amount
select count(distinct amount) -- distinct must proceed column name
from payment;

-- amount paid over 5.99
select count(distinct amount)
from payment
where amount > 5.99;

-- MIN and MAX
-- display the smallest amount paid over 7.99
select min(amount) as min_num_payments
from payment
where amount > 7.99

-- display the largest amount greater than 7.99 
select max(amount) as max_num_payments
from payment
where amount > 7.99

-- query to display the individual number of payment amounts
select amount, count(amount)
from payment
group by amount
order by amount;

-- how much each customer_id has paid
select customer_id, sum(amount)
from payment
group by customer_id
order by sum(amount) desc;

-- grab the amount by customer id
select customer_id, amount
from payment
group by customer_id, amount 
order by customer_id;

select*
from address
