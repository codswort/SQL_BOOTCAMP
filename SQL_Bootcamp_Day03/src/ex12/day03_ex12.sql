INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series((SELECT MAX(id) + 1 FROM person_order),
                (SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order)) AS id,
       generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)) AS person_id,
(SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25';

