USE sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT * FROM sakila.actor;
SELECT last_name, COUNT(last_name) FROM sakila.actor GROUP BY last_name HAVING COUNT(last_name)=1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
SELECT * FROM sakila.actor;
SELECT last_name, COUNT(last_name) FROM sakila.actor GROUP BY last_name HAVING COUNT(last_name)>1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM sakila.rental;
SELECT staff_id, COUNT(rental_id) FROM sakila.rental GROUP BY staff_id;

-- Solution: 8040 (1), 8004(2)

-- 4. Using the film table, find out how many films were released each year.
SELECT * FROM sakila.film;
SELECT release_year, COUNT(title) FROM sakila.film GROUP BY release_year;

-- Solution: 1000 (2006)

-- 5. Using the film table, find out for each rating how many films were there.
SELECT * FROM sakila.film;
SELECT rating, COUNT(title) FROM sakila.film GROUP BY rating;

-- Solution: pg(194),g(178),nc-17(210),pg-13(223),r(195)

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating,round(AVG(length),2) FROM sakila.film GROUP BY rating;

-- Solution: pg (112.01),g(111.05),cc-17(113.23),pg-13(120.44),r(118.66)

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating,AVG(length) FROM sakila.film GROUP BY rating HAVING AVG(length)>120;

-- Solution: pg-13(120.4439)

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT * FROM sakila.film;
SELECT title, length,
CASE
WHEN length <= 60 then 'duration low'
WHEN length <= 120 then 'duration medium'
ELSE 'duration high'
END AS 'Ranking duration'
FROM film
WHERE length is not null
AND length <> 0;