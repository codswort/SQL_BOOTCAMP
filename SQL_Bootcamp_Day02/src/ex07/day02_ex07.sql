SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE (person_visits.visit_date = '2022-01-08' AND person.name = 'Dmitriy' AND price < 800)