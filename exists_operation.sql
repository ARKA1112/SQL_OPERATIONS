/*EXISTS OPERATOR*/

select c.first_name, c.last_name
from customer c 
where EXISTS
(SELECT 1 from rental r 
WHERE r.customer_id = c.customer_id
 AND r.rental_date < ('2005-05-25'))
