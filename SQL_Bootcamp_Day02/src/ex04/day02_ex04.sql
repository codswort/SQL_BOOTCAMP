SELECT pizza_name, TWO.name AS pizzeria_name, ONE.price
FROM (SELECT * FROM menu WHERE menu.pizza_name='pepperoni pizza' OR menu.pizza_name='mushroom pizza') AS ONE
LEFT JOIN (SELECT *  FROM pizzeria ) AS TWO
    ON TWO.id = ONE.pizzeria_id
ORDER by 1, 2