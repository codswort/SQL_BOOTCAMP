WITH VISITED AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE (person.name = 'Andrey')),
ORDERED AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
    WHERE (person.name = 'Andrey')),
VO AS (SELECT pizzeria_name FROM VISITED
       EXCEPT
       SELECT pizzeria_name FROM ORDERED)
SELECT pizzeria_name FROM VO
ORDER by 1;