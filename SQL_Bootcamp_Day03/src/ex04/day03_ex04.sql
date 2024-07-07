WITH ONE AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
    WHERE (person.gender = 'male')),
TWO AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
    WHERE (person.gender = 'female')),
THREE AS (SELECT * FROM ONE EXCEPT SELECT * FROM TWO),
FOUR AS (SELECT * FROM TWO EXCEPT SELECT * FROM ONE)
SELECT pizzeria_name FROM THREE
UNION
SELECT pizzeria_name FROM FOUR
ORDER by 1;