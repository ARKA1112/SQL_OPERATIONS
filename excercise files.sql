select * from customer
select * from film

alter table film
add INDEX yr_idx (release_year)


select * from film
where release_year = 2006


/*Excercise 13-1*/

alter table rental
add CONSTRAINT fk_cust_id (customer_id) foreign key (customer_id)
REFERENCES customer (customer_id) on delete restrict on update CASCADE

select customer_id, payment_date, amount
from payment
where payment_date > cast('2019-12-31 23:59:59' as datetime)