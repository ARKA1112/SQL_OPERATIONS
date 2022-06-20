
/*Updating a table by adding a new column by using subquery*/

UPDATE customer c 
set c.last_update = 
(select max(r.rental_date) from rental r
 where r.customer_id = c.customer_id)

/*Same query with an added subclause*/
UPDATE customer c 
SET c.last_update = 
(SELECT max(r.rental_date) from rental r
 where r.customer_id = c.customer_id)
 where EXISTS
 (select 1 from rental r
  where r.customer_id = c.customer_id)
