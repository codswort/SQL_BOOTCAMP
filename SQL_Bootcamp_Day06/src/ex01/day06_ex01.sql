INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
    SELECT ROW_NUMBER() OVER (),
    person_id,
    pizzeria_id,
    (CASE WHEN count (pizzeria_id) = 1 THEN 10.5
         WHEN count (pizzeria_id) = 2 THEN 22
         ELSE 30
    END)
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
group by person_id, pizzeria_id;
