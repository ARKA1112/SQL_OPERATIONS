/*Query to select the described where it not meets the cond*/

SELECT a.first_name, a.last_name
from actor a 
where not EXISTS
(select 1
 from film_actor fa 
 inner join film f on f.film_id = fa.film_id
 where fa.actor_id = a.actor_id
 and f.rating = 'R')
