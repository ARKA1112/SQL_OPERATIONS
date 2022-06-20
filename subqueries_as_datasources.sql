SELECT c.first_name, c.last_name,
pymnt.num_rentals,pymnt.tot_payments
from customer c
inner JOIN
(SELECT customer_id,
 COUNT(*) num_rentals, sum(amount) tot_payments
 from payment
 GROUP by customer_id
 ) pymnt
 on c.customer_id = pymnt.customer_id
