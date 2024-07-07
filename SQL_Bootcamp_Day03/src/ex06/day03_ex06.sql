WITH NEW AS (SELECT menu.pizzeria_id AS p1, TWO.pizzeria_id AS p2, menu.price, menu.pizza_name
    FROM menu
    JOIN menu AS TWO ON menu.price = TWO.price
    WHERE (menu.pizza_name = TWO.pizza_name AND menu.pizzeria_id > TWO.pizzeria_id))
SELECT pizza_name, pz1.name AS pizzeria_name_1, pz2.name AS pizzeria_name_2, NEW.price
FROM NEW
JOIN pizzeria pz1 ON pz1.id = NEW.p1
JOIN pizzeria pz2 ON pz2.id = NEW.p2
ORDER by 1;