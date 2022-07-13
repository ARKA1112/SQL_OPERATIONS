/*application of cross join*/
select * from
(select days.dt, count(r.rental_id) num_rentals
from rental r
right outer join
(select date_add('2005-01-01', INTERVAL(ones.num+tens.num+hundreds.num) day) dt
from
(select 0 num UNION ALL
select 1 num UNION ALL
select 2 num UNION ALL
select 3 num UNION ALL
select 4 num UNION ALL
select 5 num UNION ALL
select 6 num UNION ALL
select 7 num UNION ALL
select 8 num UNION ALL
select 9 num) ones
cross join
(select 0 num UNION ALL
select 10 num UNION ALL
select 20 num UNION ALL
select 30 num UNION ALL
select 40 num UNION ALL
select 50 num UNION ALL
select 60 num UNION ALL
select 70 num UNION ALL
select 80 num UNION ALL
select 90 num) tens
cross join
(select 0 num UNION ALL
select 100 num UNION ALL
select 200 num UNION ALL
select 300) hundreds
where date_add('2005-01-01', interval(ones.num + tens.num + hundreds.num) day) < '2006-01-01'
) days
on days.dt = date(r.rental_date)
group by days.dt
order by 1
) rental_dates
where
rental_dates.num_rentals != 0