SELECT 
    actor_id, film_id
FROM
    film_actor
WHERE
    (actor_id , film_id) IN (SELECT 
            a.actor_id, f.film_id
        FROM
            actor a
                CROSS JOIN
            film f
        WHERE
            a.last_name = 'monroe'
                AND f.rating = 'PG');