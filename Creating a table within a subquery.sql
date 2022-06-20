SELECT num_role, actor_lvl.level
from (SELECT count(*) num_role
      from film_actor
      GROUP by actor_id) fa
inner JOIN
(SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
UNION ALL
SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
UNION ALL
SELECT 'Newcomer' level, 1 min_roles, 19 max_roles) actor_lvl
on fa.num_role BETWEEN
actor_lvl.min_roles and actor_lvl.max_roles
