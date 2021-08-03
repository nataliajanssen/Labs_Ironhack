USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.

 SHOW TABLES;
 SELECT * FROM sakila.actor;
 SELECT * FROM sakila.actor WHERE first_name='Scarlett';
 
-- Solution: Scarlett Damon, Scarlett Bening

-- 2. How many films (movies) are available for rent and how many films have been rented?

 SELECT * FROM sakila.rental;
 SELECT COUNT(rental_id) AS 'Available films' FROM rental
WHERE return_date is not null;

-- Solution: 15.861 available films, 

SELECT COUNT(rental_id) AS 'Unavailable films'FROM rental
WHERE return_date is null;

-- Solution: 183 unavailable films

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * FROM sakila.film;
SELECT MAX(length) AS max_duration FROM sakila.film;
SELECT MIN(length) AS min_duration FROM sakila.film;

-- Solution: the longest is 185 and the shortest is 46.

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT * FROM sakila.film;
SELECT FLOOR(AVG(length)/60)  AS hour, (AVG(length) % 60) AS minutes
 FROM sakila.film;

-- Solution: 1 hour and 55 mins.

-- 5. How many distinct (different) actors' last names are there?
SELECT * FROM sakila.actor;
SELECT COUNT(DISTINCT(last_name)) FROM sakila.actor;

-- Solution: 121

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT payment_date FROM sakila.payment;
SELECT MAX(payment_date) FROM sakila.payment; 
SELECT MIN(payment_date) FROM sakila.payment; 

SELECT DATEDIFF("2005-02-14", "2005-05-24");

-- Solution: 99 days

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;
SELECT *, dayname(rental_date) AS WeekDay FROM rental;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * FROM sakila.rental;
SELECT *,
CASE
WHEN weekday(rental_date) < 5 then 'Weekday'
ELSE 'Weekend'
END AS 'day_type'
FROM sakila.rental;

-- 9. Get release years
SELECT * FROM sakila.film;
SELECT DISTINCT(release_year) FROM sakila.film;

-- Solution: 2006

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film;
SELECT title FROM sakila.film WHERE title LIKE '%ARMAGEDDON%';

-- Solution: Armageddon lost, ladybugs armageddon, metal armageddon, mosquito armageddon, stagecoach armageddon, steers armageddon

-- 11. Get all films which title ends with APOLLO.
SELECT title FROM sakila.film WHERE title LIKE '%APOLLO';

-- Solution: salute apollo, scorpion apollo, teen apollo, wedding apollo, wild apollo

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film;
SELECT title, length FROM sakila.film ORDER BY length DESC LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT * FROM sakila.film;
SELECT COUNT(title) FROM sakila.film WHERE special_features LIKE '%Behind the scenes%';

-- Solution: 538



 