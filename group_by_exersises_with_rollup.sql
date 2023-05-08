use sakila;
SELECT 
    fa.actor_id, f.rating, COUNT(*)
FROM
    film_actor fa
        INNER JOIN
    film f ON fa.film_id = f.film_id
GROUP BY fa.actor_id , f.rating WITH ROLLUP
ORDER BY 1 , 2;

-- To count total number of payment made by customer

SELECT 
    customer_id, COUNT(*)
FROM
    payment
GROUP BY customer_id;