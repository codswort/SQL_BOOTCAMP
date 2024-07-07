SELECT
pizza_name, pizzeria.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria ON pizzeria.id = m.pizzeria_id;

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT
pizza_name, pizzeria.name
FROM menu AS m
JOIN pizzeria ON pizzeria.id = m.pizzeria_id;
