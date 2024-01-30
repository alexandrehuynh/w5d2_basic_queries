-- Week 5 - Tuesday 1.30.2024 Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?
select first_name,last_name
from actor
where last_name = 'Wahlberg';
-- There are two Wahlberg (Nick and Daryl)


-- 2. How many payments were made between $3.99 and $5.99?
select count(*)
from payment
where amount between 3.99 and 5.99;
-- There are 5,607 payments made between $3.99 and $5.99


-- 3. What film does the store have the most of? (search in inventory)
select count(inventory_id) as inventory_count, film_id 
from inventory
group by film_id 
order by count(inventory_id) desc;
-- There are 72 different films with 8 copies.


-- 4. How many customers have the last name ‘William’?
select last_name
from customer
where last_name = 'William';
-- There is no one with the last name William

-- 5. What store employee (get the id) sold the most rentals?
select count(rental_id), staff_id
from rental
group by staff_id 
order by count(rental_id) desc
limit 1;
-- Staff 1 aka Mike sold the most rental with 8040


-- 6. How many different district names are there?
select count(distinct district)
from address;
-- There are 378 different districts


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(film_actor)
from film_actor
group by film_id
order by count(film_actor) desc
limit 1;
-- Lambs Cincinatti (508) has the most actors with the count of 15


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select store_id, count(last_name) as customer_count
from customer
where last_name LIKE '%es'
group by store_id
order by customer_count desc
limit 1;
-- There are 13 customers at store 1 with a last name ending in es


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
select amount, count(*) as rental_count
from payment
where customer_id between 380 and 430
group BY amount
having count(*) > 250;
-- There are 3 amount payments (2.99, 4.99 and 0.99) that meets these requirements


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
select count(distinct rating) as film_rating
from film;
-- There are 5 different rating categories
select rating, count(*) as num_movies
from film
group by rating
order by num_movies desc;
-- The rating with the most movies is PG-13

