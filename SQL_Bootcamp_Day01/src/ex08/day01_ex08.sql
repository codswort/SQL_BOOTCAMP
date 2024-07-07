SELECT P.order_date, CONCAT (person.name, ' (age:', person.age, ')') AS person_information
FROM (SELECT person_id AS id, order_date FROM person_order) AS P
NATURAL JOIN person
ORDER by P.order_date, person_information