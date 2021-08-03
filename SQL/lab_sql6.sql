USE sakila;

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT s.store_id,c.city,co.country
FROM sakila.store s
JOIN sakila.address a
USING (address_id)
JOIN sakila.city c
USING (City_id)
JOIN sakila.country co
USING (Country_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id, SUM(p.amount) as dollars
FROM sakila.staff s
JOIN sakila.payment p
USING (staff_id)
GROUP BY s.store_id;

-- 3. Which film categories are longest?
SELECT fc.category_id, c.name, AVG(f.length) AS avg_duration
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
JOIN sakila.category c
USING (category_id)
GROUP BY category_id
ORDER BY avg_duration DESC
LIMIT 1;

-- 4. Display the most frequently rented movies in descending order.
SELECT f.film_id, f.title,COUNT(r.rental_id) AS rental_times
FROM sakila.rental r
JOIN sakila.inventory i
USING (inventory_id)
JOIN sakila.film f
USING (film_id)
GROUP BY f.film_id
ORDER BY rental_times DESC;

-- 5. List the top five genres in gross revenue in descending order.
SELECT c.category_id, c.name, SUM(p.amount) AS gross_revenue
FROM sakila.category c
JOIN sakila.film_category fc
USING(category_id)
JOIN sakila.inventory i
USING(film_id)
JOIN sakila.rental r
USING (inventory_id)
JOIN sakila.payment p
USING (rental_id)
GROUP BY c.category_id
ORDER BY gross_revenue DESC
LIMIT 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT store_id, f.title, COUNT(store_id) AS Num_film
FROM store
JOIN sakila.inventory i
USING (store_id)
JOIN sakila.film f
USING(film_id)
GROUP BY f.title, store_id
HAVING f.title = 'Academy Dinosaur';


-- 7. Get all pairs of actors that worked together.

select f3.title AS Title_of_the_Film,CONCAT(a.first_name,' ', a.last_name, '/', a2.first_name, a2.last_name) AS Actors from sakila.film_actor AS f1
join sakila.film_actor AS f2
oN (f1.film_id = f2.film_id) AND (f1.actor_id <> f2.actor_id)
JOIN sakila.film as f3
ON (f1.film_id = f3.film_id)
JOIN SAKILA.ACTOR AS a
ON a.actor_id =f1.actor_id
JOIN SAKILA.ACTOR AS a2
ON a2.actor_id =f2.actor_id
ORDER BY f1.film_id ASC;



-- 8. Get all pairs of customers that have rented the same film more than 3 times.

select 
    concat(c.first_name, ' ',c.last_name) as name,count(r.rental_id)
from sakila.rental r
inner join sakila.customer c 
on r.customer_id = c.customer_id
inner join sakila.inventory i    
on r.inventory_id = i.inventory_id
inner join sakila.film f
on i.film_id = f.film_id
group by 
    concat(c.first_name, ' ',c.last_name)
having count(r.rental_id) >= 3;


