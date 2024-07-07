WITH ONE AS (SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE (person_visits.visit_date = '2022-01-08' AND person.name = 'Dmitriy' AND price < 800)),
TWO AS (SELECT pizzeria.name AS pn
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE menu.price < 800)
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT id FROM pizzeria, ONE, TWO WHERE name <> ONE.pizzeria_name AND name = TWO.pn LIMIT 1),
        '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;