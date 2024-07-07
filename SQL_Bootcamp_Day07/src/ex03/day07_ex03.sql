with visit as (select pizzeria_id, pizzeria.name, count(pizzeria_id) as count
from person_visits
join pizzeria on pizzeria.id = person_visits.pizzeria_id
group by pizzeria.id, person_visits.pizzeria_id
order by 3 desc),

orderr as (select pizzeria_id, pizzeria.name, count(pizzeria_id) as count
from person_order
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
group by pizzeria.id, menu.pizzeria_id
order by 3 desc),

common as (select name, count as total_count from visit
union all
select name, count as total_count from orderr)

select name, sum(total_count) from common
group by name
order by 2 desc, 1;
