select table_name, table_type
from information_schema.tables
where table_schema = 'sakila'
order by 1

/*excluding base tables*/

select table_name, table_type
from information_schema.tables
where table_schema = 'sakila'
and table_type != 'BASE TABLE'
order by 1

/*information about views*/
select table_name, is_updatable
from information_schema.views
where table_schema = 'sakila'


/*information about the schema*/

select constraint_name, table_name, constraint_type
from information_schema.table_constraints
where table_schema = 'sakila'
order by 3,1

