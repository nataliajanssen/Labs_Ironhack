USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.category_id, COUNT(f.title) AS "number of films"
FROM sakila.film f
JOIN sakila.film_category c
ON f.film_id = c.category_id
GROUP BY c.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(p.amount)
FROM sakila.staff s
JOIN sakila.payment p 
USING (staff_id)
WHERE DATE (p.payment_date) BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
SELECT a.actor_id, COUNT(f.film_id) AS number_films
FROM sakila.film_actor f
JOIN sakila.actor a
USING (actor_id)
GROUP BY a.actor_id
ORDER BY number_films DESC
LIMIT 1;


-- 4. Most active customer (the customer that has rented the most number of films)
SELECT r.customer_id, COUNT(r.rental_id) AS total_rentals
FROM sakila.rental r
JOIN sakila.customer c
USING (customer_id)
GROUP BY r.customer_id
ORDER BY total_rentals DESC
LIMIT 1;

-- 5.Display the first and last names, as well as the address, of each staff member.
SELECT s.staff_id, s.first_name, s.last_name, a.address 
FROM sakila.staff s
JOIN sakila.address a
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(fa.actor_id) AS number_of_actors
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
GROUP BY f.title
ORDER BY number_of_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount) AS 'total_paid'
FROM sakila.payment as p
JOIN sakila.customer as c
USING (customer_id)
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- 8. List number of films per category.

SELECT c.category_id, COUNT(f.title) AS "number of films"
FROM sakila.film f
JOIN sakila.film_category c
ON f.film_id = c.category_id
GROUP BY c.category_id;


