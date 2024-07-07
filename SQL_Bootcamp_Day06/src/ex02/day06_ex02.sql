SELECT person.name, menu.pizza_name, menu.price,
       menu.price - (person_discounts.discount * menu.price / 100)  AS discount_price,
       pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN person_discounts ON person_discounts.person_id = person.id
JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
WHERE pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2;
