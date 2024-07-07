WITH MENU AS (SELECT * FROM menu)
SELECT MENU.pizza_name, MENU.price, pizzeria.name AS pizzeria_name
FROM MENU
    JOIN pizzeria ON MENU.pizzeria_id = pizzeria.id
LEFT JOIN person_order
ON person_order.menu_id = menu.id
WHERE person_order.menu_id IS NULL
ORDER by 1, 2;