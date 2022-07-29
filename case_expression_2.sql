select monthname(rental_date) rental_month,
count(*) num_rentals
from rental
where rental_date between '2005-05-01'
and '2005-08-01'
GROUP by monthname(rental_date)

/*However, you have also been instructed to return a single row of data with three col‐
umns (one for each of the three months). To transform this result set into a single
row, you will need to create three columns and, within each column, sum only those
rows pertaining to the month in question:*/

select
sum(case when monthname(rental_date) = 'May' then 1 else 0 end) May_rentals,
sum(case when monthname(rental_date) = 'June' then 1 else 0 end) June_rentals,
sum(case when monthname(rental_date) = 'July' then 1 else 0 end) July_rentals
from rental
where rental_date BETWEEN
'2005-05-01' and '2005-08-01'