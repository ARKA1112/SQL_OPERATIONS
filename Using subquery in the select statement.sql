/*Query to show the fname. lname, city, tot amount, count from multiple tables by using subqueries in the select statement*/

SELECT
(SELECT c.first_name from customer c 
 where c.customer_id = p.customer_id
 ) first_name,
 (select c.last_name from customer c 
  where c.customer_id = p.customer_id
  ) last_name,
  (SELECT ct.city from customer c
   inner JOIN address a
   on a.address_id = c.address_id
   INNER JOIN city ct
   on ct.city_id =  a.city_id
   WHERE c.customer_id = p.customer_id)
   city,
   sum(amount) tot_payments,
   count(*) tot_rentals
   from payment p 
   GROUP BY p.customer_id
