USE sakila3;

-- 1. Drop column picture from staff.
ALTER TABLE sakila3.staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT 
    *
FROM
    sakila3.customer
WHERE
    first_name = 'tammy';
SELECT 
    *
FROM
    sakila3.staff;
INSERT INTO sakila3.staff(staff_id, first_name, last_name, address_id, email, store_id,active,username,password,last_update) 
VALUES
(3,'Tammy','SANDERS',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy',0,'2006-02-15 04:57:20');



-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

INSERT INTO sakila3.rental()
VALUES
(16050, '2021-04-05', 1, 130, NULL, 1, '2021-04-05');

SELECT 
    *
FROM
    SAKILA3.RENTAL
WHERE
    RENTAL_ID = 16050;
