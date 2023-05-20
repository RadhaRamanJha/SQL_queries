use sakila;
with actor_a as 
(SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    first_name LIKE 'a%'),
actors_a_r as
(SELECT 
    a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM
    actor_a a
        INNER JOIN
    film_actor fa ON a.actor_id = fa.actor_id
        INNER JOIN
    film f ON fa.film_id = f.film_id
WHERE
    f.rating = 'R'
),
actor_a_r_revenue as 
(SELECT 
    ar.first_name, ar.last_name, p.amount
FROM
    actors_a_r ar
        INNER JOIN
    inventory i ON i.film_id = ar.film_id
        INNER JOIN
    rental r ON i.inventory_id = r.inventory_id
        INNER JOIN
    payment p ON r.rental_id = p.rental_id) -- end of with clause
    SELECT 
    arrev.first_name,
    arrev.last_name,
    SUM(arrev.amount) tot_revenue
FROM
    actor_a_r_revenue arrev
GROUP BY arrev.first_name , arrev.last_name
ORDER BY 3 DESC;
