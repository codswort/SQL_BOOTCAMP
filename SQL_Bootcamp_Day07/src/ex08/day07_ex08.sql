select person.address, pizzeria.name, count(pizzeria.id)
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = menu.id
join person on person.id = person_order.person_id
group by person.address, pizzeria.id
order by 1, 2;
