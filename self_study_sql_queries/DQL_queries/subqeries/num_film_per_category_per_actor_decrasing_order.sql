use sakila;
/* Total number of film done by each actors/rating */
select concat(a.first_name, a.last_name) as actor_name, perf.rating , perf.total_films 
from actor a
inner join (select fa.actor_id, f.rating, count(*)  as total_films 
from film_actor fa inner join film f
 on fa.film_id = f.film_id 
 group by fa.actor_id,f.rating) as perf 
 on a.actor_id = perf.actor_id;