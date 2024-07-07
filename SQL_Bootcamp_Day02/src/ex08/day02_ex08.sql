SELECT name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN (SELECT * FROM menu WHERE menu.pizza_name = 'pepperoni pizza' OR
                               menu.pizza_name = 'mushroom pizza') AS MENU
ON MENU.id = person_order.menu_id
WHERE (person.gender = 'male' AND
       (person.address = 'Moscow' OR person.address = 'Samara'))
ORDER by name DESC