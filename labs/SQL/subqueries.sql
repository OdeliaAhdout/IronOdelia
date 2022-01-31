USE sakila;

-- Q1 How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from sakila.inventory;
select film_id from sakila.film
where title = 'Hunchback Impossible';
select count(inventory_id) from sakila.inventory
where film_id = (select film_id from sakila.film
where title = 'Hunchback Impossible')
group by film_id;

-- Q2 List all films whose length is longer than the average of all the films.
select title, length from sakila.film
where length > (select avg(length) from sakila.film);

-- Q3 Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor
where actor_id in (SELECT actor_id FROM film_actor
where film_id = (select film_id from film where title = 'Alone Trip'));

-- Q4 Identify all movies categorized as family films.
SELECT title FROM film
where film_id in (SELECT film_id FROM film_category
where category_id = (SELECT category_id FROM category where `name` = "Family"));

-- Q5a Get name and email from customers from Canada [using subqueries]. 

select first_name, last_name, email from customer
where address_id in
(SELECT address_id FROM address
where city_id in
(SELECT city_id FROM city
where country_id = (SELECT country_id FROM country
where country= "Canada")))

select a.category_id, a.name, count(*) as n_category from category as a
join film_category as f_c
using (category_id)
group by a.category_id;

-- Q5b Do the same with joins.

select first_name, last_name, email from customer
join address on customer.address_id = address.address_id 
join city on city.city_id = address.city_id
join country on country.country_id = city.country_id 
where country = "Canada"
