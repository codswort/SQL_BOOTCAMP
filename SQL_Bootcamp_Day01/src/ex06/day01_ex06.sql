SELECT order_date AS action_date, name AS person_name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
INTERSECT
SELECT visit_date AS action_date, name AS person_name
FROM person_visits
INNER JOIN person ON person_visits.person_id = person.id
ORDER by action_date, person_name DESC