select concat(a.first_name,' ',a.last_name) as actor_name, perf.rating , perf.film_count
from actor a
inner join (select fa.actor_id, f.rating, count(*) as film_count
from film_actor fa inner join film f
 on fa.film_id = f.film_id 
 group by fa.actor_id,f.rating) as perf
 on a.actor_id = perf.actor_id;