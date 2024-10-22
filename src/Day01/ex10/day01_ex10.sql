SELECT p.name AS "person_name",
	m.pizza_name AS "pizza_name",
	z.name AS "pizzeria_name"
FROM person_order AS o
INNER JOIN menu AS m
	ON o.menu_id = m.id
INNER JOIN person AS p
	ON o.person_id = p.id
INNER JOIN pizzeria AS z
	ON m.pizzeria_id = z.id
ORDER BY person_name,pizza_name,pizzeria_name;