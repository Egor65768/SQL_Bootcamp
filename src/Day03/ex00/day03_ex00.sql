SELECT m.pizza_name AS pizza_name,
	m.price AS price,
	z.name AS pizzeria_name,
	v.visit_date AS visit_date
FROM person_visits AS v
JOIN (SELECT * FROM person WHERE name = 'Kate') AS p
ON v.person_id = p.id
JOIN pizzeria AS z ON z.id = v.pizzeria_id
JOIN menu AS m ON m.pizzeria_id = v.pizzeria_id 
WHERE m.price >= 800 AND m.price <= 1000
ORDER BY 1,2,3;