SELECT pizza_name, PZ.name AS pizzeria_name
FROM person_order
JOIN (SELECT * FROM menu) AS MENU
    ON person_order.menu_id = MENU.id
JOIN (SELECT * FROM pizzeria) AS PZ
    ON  PZ.id = MENU.pizzeria_id
JOIN person ON person.id = person_order.person_id
WHERE (person.name = 'Anna' OR person.name = 'Denis')
ORDER by 1, 2