SELECT order_date, CONCAT (person.name, ' (age:', person.age, ')') AS person_information
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
ORDER by order_date, person_information