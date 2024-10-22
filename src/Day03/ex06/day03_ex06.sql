WITH same_pizza AS (SELECT m1.pizza_name,
	m1.pizzeria_id AS p_id_1,
	m2.pizzeria_id AS p_id_2,
	m1.price
	FROM menu AS m1
	JOIN menu AS m2
	ON m1.pizza_name = m2.pizza_name
	WHERE m1.pizzeria_id <> m2.pizzeria_id
	AND m1.price = m2.price
	AND m1.id > m2.id)

SELECT s.pizza_name,
	p1.name AS pizzeria_name_1,
	p2.name AS pizzeria_name_2,
	s.price
FROM same_pizza AS s
JOIN pizzeria AS p1 ON p1.id = s.p_id_1
JOIN pizzeria AS p2 ON p2.id = s.p_id_2
ORDER BY 1;