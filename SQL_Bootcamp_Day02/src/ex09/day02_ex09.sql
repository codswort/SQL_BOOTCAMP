SELECT name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON MENU.id = person_order.menu_id
WHERE (person.gender = 'female') AND
      (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'cheese pizza')
GROUP by name
HAVING COUNT(name) > 1
ORDER by name