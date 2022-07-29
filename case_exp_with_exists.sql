select a.first_name,a.last_name,
case WHEN
exists (SELECT 1 from film_actor fa
inner join film f on fa.film_id = f.film_id
where fa.actor_id = a.actor_id
and f.rating = 'G') then 'Y'
else 'N'
end g_actor,
CASe
when exists (select 1 from film_actor fa
inner join film f on f.film_id = fa.film_id
where fa.actor_id = a.actor_id
and f.rating = 'PG') then 'Y'
else 'N'
end pg_actor,
case 
when exists (select 1 from film_actor fa
inner join film f on f.film_id = fa.film_id
where fa.actor_id = a.actor_id
and f.rating = 'NC-17') then 'Y'
else 'N'
end as nc17_actor
from actor a 
where a.last_name like 'S%' or a.first_name like 'S%'

/*Another case expression use case*/

select f.title,
case  (select count(*) from inventory i
where i.film_id = f.film_id)
when 0 then 'Not Available'
when 1 then 'Scarce'
when 2 then 'Scarce'
when 3 then 'Available'
when 4 then 'Availbale'
else 'common'
end film_availability
from film f

/*To safeguard your calculations from encountering errors or, even worse, from being
mysteriously set to null, you should wrap all denominators in conditional logic, as
demonstrated by the following*/

select c.first_name, c.last_name,
sum(p.amount) tot_payment_amt,
count(p.amount) num_payments,
sum(p.amount) /
case when count(p.amount) = 0 then 1
else count(p.amount)
end avg_payment
from customer c
left outer join payment p
on c.customer_id = p.customer_id
group by c.first_name, c.last_name