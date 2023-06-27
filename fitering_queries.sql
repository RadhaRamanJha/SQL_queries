-- A query that retrieves all rows from the payments table where the amount is either 1.98, 7.98, or 9.98.
use sakila;
show tables;
desc payment;
select * from payment where (amount in (1.98,7.98,9.98));
-- a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.
desc customer;
select concat(c.first_name,' ',c.last_name) customer_name from customer c where c.last_name like '_A%W%';