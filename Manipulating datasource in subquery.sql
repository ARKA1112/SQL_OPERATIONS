select pymnt_grps.name, count(*) num_customers
FROM
(SELECT customer_id,
 count(*) num_rentals, sum(amount) tot_payments
 from payment
 GROUP BY customer_id
 ) pymnt
 inner JOIN
 (SELECT 'small fry' name, 0 low_limit, 74.99 high_limit
  UNION ALL
  SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
  UNION ALL
  SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit) pymnt_grps
  on pymnt.tot_payments between pymnt_grps.low_limit and pymnt_grps.high_limit
  GROUP BY pymnt_grps.name



select c.first_name, c.last_name,
ct.city, pymnt.tot_payments, pymnt.tot_rentals
FROM
(SELECT customer_id,
 count(*) tot_rentals, sum(amount) tot_payments
 from payment
 group by customer_id
 ) pymnt
 inner JOIN customer c
 on pymnt.customer_id = c.customer_id
 inner JOIN address a
 on a.address_id = c.address_id
 inner join city ct
 on ct.city_id = a.city_id
