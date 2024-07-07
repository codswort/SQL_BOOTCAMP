CREATE VIEW v_price_with_discount
AS WITH BASE AS (SELECT *
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id)
SELECT name, pizza_name, price, ROUND(price - price*0.1) AS discount_price
FROM BASE
ORDER by 1, 2;