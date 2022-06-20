with actor_s AS
(SELECT actor_id, first_name, last_name
 from actor
 WHERE last_name like 'S%'
 ),
 actor_s_pg AS
 (SELECT s.actor_id, s.first_name, s.last_name,
  f.film_id, f.title
  from actor_s s
  inner join film_actor fa
  on s.actor_id = fa.actor_id
  inner join film f
  on f.film_id = fa.film_id
  where f.rating LIKE 'PG'
  ),
  actors_s_pg_revenue AS
  (SELECT spg.first_name, spg.last_name, p.amount
   from actor_s_pg spg
   inner join inventory i
   on spg.film_id = i.film_id
   INNER JOIN rental r
   on i.inventory_id = r.inventory_id
   inner join payment p
   on r.rental_id = p.rental_id
   ) -- end of with clause
   SELECT spg_rev.first_name, spg_rev.last_name, sum(spg_rev.amount) tot_revenue
   from actors_s_pg_revenue spg_rev
   GROUP BY spg_rev.first_name, spg_rev.last_name
   ORDER by 3 DESC
