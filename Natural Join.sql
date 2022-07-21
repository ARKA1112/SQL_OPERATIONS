-- Active: 1657968573025@@127.0.0.1@3306@sakila
/*Automatically detect identical/common columns */
select c.first_name, c.last_name, date(r.rental_date)
from customer c
natural join rental r 

/* SInce this returns an empty set. Schema of the DATABASE
are to be blamed */

SELECT cust.first_name, cust.last_name, date(r.rental_date)
from 
(select customer_id, first_name, last_name
from customer) cust 
natural join rental r