select name,
       count(pizzeria.id) as count_of_orders,
       round(avg(menu.price), 2) as average_price,
       max(menu.price) as max_price,
       min(menu.price) as min_price
from person_order
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
group by (pizzeria.id)
order by 1;
