WITH order_id AS (SELECT o.menu_id
	FROM person_order AS o
	JOIN menu AS m ON m.id = o.menu_id),
	not_order_id AS ( SELECT id AS menu_id FROM menu 
	EXCEPT 
	SELECT * FROM order_id
	ORDER BY 1)
	
SELECT m.pizza_name,
	m.price,
	z.name
FROM not_order_id AS n
JOIN menu AS m
ON n.menu_id = m.id
JOIN pizzeria AS z
ON z.id = m.pizzeria_id
ORDER BY 1,2;