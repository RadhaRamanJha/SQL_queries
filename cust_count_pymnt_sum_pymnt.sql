use sakila;
SELECT 
    CONCAT(c.first_name, c.last_name) full_name,
    pymnt.num_rentals,
    pymnt.total_payment
FROM
    customer c
        INNER JOIN
    (SELECT 
        customer_id, COUNT(*) num_rentals, SUM(amount) total_payment
    FROM
        payment
    GROUP BY customer_id) pymnt ON c.customer_id = pymnt.customer_id;