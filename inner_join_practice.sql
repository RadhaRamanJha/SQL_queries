-- 
use sakila;
SELECT 
    f.title, c.name
FROM
    film f
        INNER JOIN
    film_category fc ON f.film_id = fc.film_id
        INNER JOIN
    category c ON fc.category_id = c.category_id
WHERE
    c.name = 'Action'