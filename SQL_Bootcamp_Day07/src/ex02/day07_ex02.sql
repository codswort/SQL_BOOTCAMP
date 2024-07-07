with visit as (select pizzeria_id, pizzeria.name, count(pizzeria_id) as count, ('visit') as action_type
from person_visits
join pizzeria on pizzeria.id = person_visits.pizzeria_id
group by pizzeria.id, person_visits.pizzeria_id
order by 3 desc limit 3),

orderr as (select pizzeria_id, pizzeria.name, count(pizzeria_id) as count, ('order') as action_type
from person_order
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
group by pizzeria.id, menu.pizzeria_id
order by 3 desc limit 3)

select name, count, action_type from visit
union all
select name, count, action_type from orderr
order by 3, 2 desc;
