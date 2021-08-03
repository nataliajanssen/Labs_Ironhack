USE sakila;

-- 1. Review the tables in the database.
SHOW FULL TABLES;

-- Solution: actor, actor_info, address, category, city, country, customer, customer_list, film, film_actor,film_category,film_list,film_text, inventory, language, nicer_but_slower_film_list, payment, rental, sales_by_film_category, sales_by_store, staff, staff_list, store.

-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor_info;
SELECT * FROM sakila.address;
SELECT * FROM sakila.category;
SELECT * FROM sakila.city;
SELECT * FROM sakila.country;
SELECT * FROM sakila.customer;
SELECT * FROM sakila.customer_list;
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.film_list;
SELECT * FROM sakila.film_text;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.language;
SELECT * FROM sakila.nicer_but_slower_film_list;
SELECT * FROM sakila.payment;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.sales_by_film_category;
SELECT * FROM sakila.sales_by_store;
SELECT * FROM sakila.staff;
SELECT * FROM sakila.staff_list;
SELECT * FROM sakila.store;

-- 3. Select one column from a table. Get film titles.
SELECT title FROM sakila.film_list;
SELECT COUNT (title) FROM sakila.film_list;

-- Solution: 997 titles of films

-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT last_name AS surname FROM sakila.actor;
SELECT DISTINCT(name) AS language FROM sakila.language;

-- Solution: 6 unique languages

-- 5. Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
SELECT * FROM sakila.store;
SELECT COUNT(store_id) FROM sakila.store;
SELECT * FROM sakila.staff;
SELECT first_name FROM sakila.staff;

-- Solution: 2 stores, 2 staff, Mike and Jon

-- 6. Bonus: How many unique days did customers rent movies in this dataset?
SELECT * FROM sakila.rental;
SELECT COUNT(DISTINCT DATE(rental_date)) FROM sakila.rental;

-- Solution: 41 unique days

