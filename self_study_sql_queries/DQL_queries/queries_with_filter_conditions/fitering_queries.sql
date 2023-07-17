-- A query that retrieves all rows from the payments table where the amount is either 1.98, 7.98, or 9.98.
use sakila;
show tables;
desc payment;
SELECT 
    *
FROM
    payment
WHERE
    (amount IN (1.98 , 7.98, 9.98));
-- a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) customer_name
FROM
    customer c
WHERE
    c.last_name LIKE '_A%W%';
