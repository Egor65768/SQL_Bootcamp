WITH cte_order AS (
	SELECT *
	FROM person_order AS o
	LEFT JOIN (SELECT id AS person_id
		FROM person
		WHERE name = 'Denis'
		OR name = 'Anna') AS p
	ON o.person_id = p.person_id
	WHERE p.person_id IS NOT NULL
	)
SELECT menu.pizza_name AS pizza_name,
	pizzeria.name AS pizzeria_name
FROM cte_order
JOIN menu ON menu.id = cte_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1,2;