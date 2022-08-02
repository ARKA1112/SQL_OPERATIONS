select table_name, index_name
from information_schema.statistics
where table_schema = 'sakila'   