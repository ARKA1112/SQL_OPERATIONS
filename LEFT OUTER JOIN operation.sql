/*OUTER JOINS*/

SELECT f.film_id, f.title, count(i.inventory_id) num_counts from film f 
left outer join inventory i
on f.film_id = i.film_id
GROUP by f.film_id

/*OUTER JOINS*/

SELECT f.film_id, f.title, i.inventory_id, r.rental_date
from film f
left outer join inventory i 
on f.film_id = i.film_id
left outer join rental r
on i.inventory_id = r.inventory_id
GROUP by f.film_id
