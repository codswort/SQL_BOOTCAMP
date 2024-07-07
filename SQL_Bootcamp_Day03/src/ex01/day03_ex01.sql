SELECT menu.id AS menu_id
FROM menu
EXCEPT
SELECT person_order.menu_id
FROM person_order
ORDER by 1;