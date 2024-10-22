WITH pizza AS (SELECT *
	FROM menu
	WHERE pizza_name = 'mushroom pizza'
	OR pizza_name = 'pepperoni pizza')
SELECT pizza.pizza_name AS pizza_name,
	z.name AS pizzeria_name,
	pizza.price
FROM pizza
LEFT JOIN pizzeria AS z
ON z.id = pizza.pizzeria_id
ORDER BY pizza_name,pizzeria_name;