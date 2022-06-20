/*Creating a query to join a table created inline and order by a query inline*/

SELECT concat(a.first_name,' ',a.last_name) name,
a.actor_id, fat.tot_films from actor a
inner JOIN (SELECT COUNT(*) tot_films, fa.actor_id actor_id 
            from film_actor fa GROUP by actor_id) fat
on 
fat.actor_id = a.actor_id
ORDER by (SELECT COUNT(*) from film_actor fa
      inner JOIN actor a ON
      a.actor_id = fa.actor_id) desc
