SELECT
       CASE WHEN person.name IS NULL THEN '-' ELSE person.name END as person_name,
       ONE.visit_date,
       CASE WHEN TWO.name IS NULL THEN '-' ELSE TWO.name END as pizzeria_name
FROM person
FULL JOIN (SELECT person_id, pizzeria_id, visit_date  FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS ONE
    ON person.id = ONE.person_id
FULL JOIN (SELECT name, id FROM pizzeria) AS TWO
    ON ONE.pizzeria_id = TWO.id
ORDER by 1,2,3