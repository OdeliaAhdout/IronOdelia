USE sakila;
SELECT * FROM film_actor
SELECT * FROM actor
SELECT distinct actor_id FROM film_actor

-- Which actor has appeared in the most films?
select actor_id from film_actor
group by actor_id
order by count(film_id) desc
LIMIT 1;
-- get the name
SELECT first_name, last_name FROM actor
WHERE actor_id = 107

select first_name, last_name from film_actor as most_films
inner join sakila.actor as l on
most_films.actor_id = l.actor_id
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)
SELECT * FROM rental;

select customer_id from rental
group by customer_id
order by count(rental_id) desc
LIMIT 1;

SELECT first_name, last_name FROM customer
WHERE customer_id = 148

------------------------

-- USING JOIN

-- Q1
select a.actor_id, a.first_name, a.last_name, count(*) as most_films from actor as a
inner join film_actor as b on 
a.actor_id = b.actor_id
group by a.actor_id
order by most_films desc
LIMIT 1;

-- Q2
select a.customer_id, a.first_name, a.last_name, count(*) as n_rentals from customer as a
join rental as r
using(customer_id)
group by a.customer_id
order by n_rentals desc
limit 1;

-- Q3 List number of films per category
select a.category_id, a.name, count(*) as n_category from category as a
join film_category as f_c
using (category_id)
group by a.category_id;

-- Q4 Display the first and last names, as well as the address, of each staff members 
select a.first_name, a.last_name, a.address_id, b.address from staff as a
join address as b
using (address_id);

-- Q5: Display the total amount rung up by each staff member in August of 2005.
select a.staff_id, a.first_name,a.last_name, sum(b.amount) as tot_amount from staff as a
join payment as b
using (staff_id)
where b.payment_date >= '20050801' and b.payment_date <= '20050831'
group by a.staff_id;
    
-- Q6 List each film and the number of actors who are listed for that film.
select a.film_id, a.title, count(b.actor_id) as n_actors from film as a
join film_actor as b
using(film_id)
group by a.film_id
-- ! Problem with film_id= 1

/* Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
    List the customers alphabetically by last name. Bonus: Which is the most rented film? 
    The answer is Bucket Brotherhood This query might require using more than one join statement.*/
