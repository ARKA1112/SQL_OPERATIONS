/* using subqueries in case when expression */

select c.first_name, c.last_name,
case
when active = 0 then 0
else (
    select count(*) from rental r
    where r.customer_id = c.customer_id
)
end num_rentals
from customer c 