use sakila;
-- query1
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) full_name,
    ct.city,
    COUNT(*) num_payments,
    SUM(amount) tot_payment
FROM
    payment p
        INNER JOIN
    customer c ON p.customer_id = c.customer_id
        INNER JOIN
    address a ON c.address_id = a.address_id
        INNER JOIN
    city ct ON a.city_id = ct.city_id
GROUP BY c.first_name , c.last_name , ct.city
ORDER BY tot_payment DESC;
 
 -- query 2: consider the subquery to generate group, num_payments, tot_payment 
SELECT 
    customer_id, COUNT(*) num_payments, SUM(amount) tot_payment
FROM
    payment
GROUP BY customer_id;

-- Query 3 Same as query 1 but generated with help of a subqery 
-- where the (subquery ) query 2 acts as a the heart of this query
-- other tables are used for display joined by customer_id

SELECT 
    CONCAT(c.first_name, '  ', c.last_name) full_name,
    ct.city,
    pymnt.num_payments,
    pymnt.tot_payment
FROM
    (SELECT 
        customer_id, COUNT(*) num_payments, SUM(amount) tot_payment
    FROM
        payment
    GROUP BY customer_id) pymnt
        INNER JOIN
    customer c ON pymnt.customer_id = c.customer_id
        INNER JOIN
    address a ON c.address_id = a.address_id
        INNER JOIN
    city ct ON a.city_id = ct.city_id
ORDER BY pymnt.tot_payment desc; 