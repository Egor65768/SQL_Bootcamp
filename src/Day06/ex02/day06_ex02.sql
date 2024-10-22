SELECT p.name,
	m.pizza_name, 
	m.price,
	ROUND(m.price * (1 - d.discount / 100 ), 2) AS discount_price,
	z.name AS pizzeria_name
FROM person_order AS o
INNER JOIN person AS p
ON p.id = o.person_id
INNER JOIN menu AS m
ON m.id = o.menu_id
INNER JOIN pizzeria AS z
ON z.id = m.pizzeria_id
INNER JOIN person_discounts AS d
ON o.person_id = d.person_id
AND m.pizzeria_id = d.pizzeria_id
ORDER BY p.name,m.pizza_name;