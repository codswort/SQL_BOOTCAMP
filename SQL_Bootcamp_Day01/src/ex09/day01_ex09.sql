SELECT name
FROM pizzeria
WHERE pizzeria.id NOT IN (SELECT person_visits.pizzeria_id FROM person_visits);

SELECT name
FROM pizzeria
WHERE NOT EXISTS (SELECT person_visits.pizzeria_id FROM person_visits WHERE pizzeria.id = person_visits.pizzeria_id)