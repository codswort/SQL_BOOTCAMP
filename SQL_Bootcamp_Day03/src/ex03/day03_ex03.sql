WITH ONE AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE (person.gender = 'male')),
TWO AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE (person.gender = 'female')),
THREE AS (SELECT * FROM ONE EXCEPT ALL SELECT * FROM TWO),
FOUR AS (SELECT * FROM TWO EXCEPT ALL SELECT * FROM ONE)
SELECT pizzeria_name FROM THREE
UNION ALL
SELECT pizzeria_name FROM FOUR
ORDER by 1;