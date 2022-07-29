select c.first_name, c.last_name,
case
when a.address is NULL then 'Unknown'
else
a.address
end address,
case when ct.city is NULL then 'Unknown'
else ct.city
end city,
case when cn.country is NULL then 'Unkown'
else cn.country
end country
from customer c
inner join address a on c.address_id = a.address_id
inner join city ct on a.city_id = ct.city_id
inner join country cn on cn.country_id = ct.country_id