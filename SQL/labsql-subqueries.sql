USE sakila3;

-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT 
    Amount_of_copies
FROM
    (SELECT 
        film_id, COUNT(inventory_id) AS Amount_of_copies
    FROM
        inventory
    GROUP BY film_id
    HAVING film_id = (SELECT 
            film_id
        FROM
            film
        WHERE
            title = 'Hunchback Impossible')) sub2;

-- 2. List all films whose length is longer than the average of all the films.

SELECT 
    title, length
FROM
    sakila.film
WHERE
    length > (SELECT 
            AVG(length)
        FROM
            sakila.film);

-- 3. Use subqueries to display all actors who appear in the film Alone Trip.

SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'Alone Trip'));
                    
-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT 
    film_id,title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_category
        WHERE
            category_id = (SELECT 
                    category_id
                FROM
                    category
                WHERE
                    name = 'Family'));
                    
-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT 
    address_id, first_name, email
FROM
    customer
WHERE
    address_id IN (SELECT 
            address_id
        FROM
            address
        WHERE
            city_id IN (SELECT 
                    city_id
                FROM
                    city
                WHERE
                    country_id = (SELECT 
                            country_id
                        FROM
                            country
                        WHERE
                            country = 'CANADA')));


SELECT 
    CONCAT(first_name, ' ', last_name) AS Customer,
    email AS Email_Address,
    country AS Country
FROM
    customer
        JOIN
    address USING (address_id)
        JOIN
    city USING (city_id)
        JOIN
    country USING (country_id)
WHERE
    country = 'Canada';

-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT 
    title, film_id
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_actor
        WHERE
            actor_id = (SELECT 
                    COUNT(actor_id)
                FROM
                    film_actor
                GROUP BY actor_id
                ORDER BY COUNT(actor_id) DESC
                LIMIT 1));
                
-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

SELECT 
    title, FILM_ID
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            inventory
        WHERE
            inventory_id IN (SELECT 
                    inventory_id
                FROM
                    rental
                WHERE
                    customer_id = (SELECT 
                            COUNT(amount)
                        FROM
                            payment
                        GROUP BY customer_id
                        ORDER BY COUNT(amount) DESC
                        LIMIT 1)));

-- 8. Customers who spent more than the average payments.

SELECT 
    customer_id, SUM(amount) AS Total_payment
FROM
    payment
GROUP BY customer_id
HAVING SUM(amount) > (SELECT 
        AVG(total_payment) AS Average_payment
    FROM
        (SELECT 
            customer_id, SUM(amount) AS total_payment
        FROM
            payment
        GROUP BY customer_id) sub1);
    
