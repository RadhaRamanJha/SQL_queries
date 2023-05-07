SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    perf.rating,
    perf.film_count
FROM
    actor a
        INNER JOIN
    (SELECT 
        fa.actor_id, f.rating, COUNT(*) AS film_count
    FROM
        film_actor fa
    INNER JOIN film f ON fa.film_id = f.film_id
    GROUP BY fa.actor_id , f.rating) AS perf ON a.actor_id = perf.actor_id;