use sakila;

CREATE VIEW film_stats
AS
SELECT f.film_id, f.title, f.description, f.rating,
(SELECT c.name
FROM category c
INNER JOIN film_category fc
ON c.category_id = fc.category_id
WHERE fc.film_id = f.film_id) category_name,
(SELECT count(*)
FROM film_actor fa
WHERE fa.film_id = f.film_id
) num_actors, ( SELECT count(*)
FROM inventory i
WHERE i.film_id = f.film_id
) inventory_cnt,
(SELECT count(*)
FROM inventory i
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE i.film_id = f.film_id
) num_rentals
FROM film f;
select * from film_stats;