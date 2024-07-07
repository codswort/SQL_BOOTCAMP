SELECT id AS object_id, pizza_name object_name
FROM menu
UNION
SELECT id AS object_id, name AS object_name
FROM person
ORDER by object_id, object_name