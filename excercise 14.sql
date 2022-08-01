create view film_ctgry_actor
as
SELECT f.title, c.name as category_name, a.first_name, a.last_name
from film f
inner join film_actor fa ON
f.film_id = fa.film_id
inner JOIN film_category fc
on fc.film_id = fa.film_id
inner JOIN category c ON
c.category_id = fc.category_id
INNER join actor a ON
a.actor_id = fa.actor_id


select * from film_ctgry_actor where last_name = 'FAWCETT'


/*excercise 14-2*/

drop view cntry_pymnts

create view cntry_pymnts
AS
select cn.country as country_name, sum(p.amount) as tot_payments
from country cn
inner join city ct ON
cn.country_id = ct.country_id
inner join address ad ON
ad.city_id = ct.city_id
inner join customer c ON
c.address_id = ad.address_id
inner join payment p ON
p.customer_id = c.customer_id
group by cn.country
order by tot_payments desc

select * from cntry_pymnts