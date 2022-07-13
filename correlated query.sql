/*correlated query*/
SELECT unique(title) from film f
inner join film_actor fa
on fa.film_id = f.film_id
inner join film_category fc
on fc.film_id = fa.film_id
inner join category c
on c.category_id = fc.category_id
where (c.name = 'Action')


SELECT title from film f
where film_id in (SELECT film_id from film_category
                  WHERE category_id in
                  (SELECT category_id from category
                   WHERE name = 'Action'))
