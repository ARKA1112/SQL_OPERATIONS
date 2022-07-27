-- Active: 1657968573025@@127.0.0.1@3306@sakila

/*CONDITIONAL LOGIC STATEMENT*/
select first_name, last_name,
CASE
when active = 1 then "active"
else "inactive"
end  activity_type
from customer

/*Different use cases of the case operation*/
select c.first_name, c.last_name,
CASE
 when active = 0 then 0
 else
 (SELECT count(*) from rental r
 where r.customer_id = c.customer_id)
 end num_rentals
from customer c
