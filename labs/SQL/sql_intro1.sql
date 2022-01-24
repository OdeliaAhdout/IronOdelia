USE sakila;

-- explore tables
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;

-- get film titles
SELECT title FROM film;

-- alias 'langs' to column 'name' in 'languages' and produce the unique list of languages
SELECT distinct name 
FROM language AS langs;

SELECT film.title, language.name
 FROM film  
 JOIN language; 
 
 -- How many stores does the company have?
 SELECT count(distinct store_id) FROM store;
 
 -- or
 SELECT COUNT(distinct address_id) FROM store;
 
 -- How many employees does the company have?
  SELECT count(distinct staff_id) FROM staff;

-- Return first name only
  SELECT (first_name) FROM staff;
