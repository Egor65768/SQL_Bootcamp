WITH person_Andrey AS (
	SELECT * FROM person WHERE name = 'Andrey'), 
	visit_Andrey AS (
		SELECT z.name FROM person_visits AS v
		JOIN person_Andrey AS p ON v.person_id = p.id
		JOIN pizzeria AS z ON z.id = v.pizzeria_id),
	order_Andrey AS (
		SELECT z.name FROM person_order AS o
		JOIN person_Andrey AS p ON o.person_id = p.id
		JOIN menu AS m ON m.id = o.menu_id
		JOIN pizzeria AS z ON z.id = m.pizzeria_id
	)
(SELECT name AS pizzeria_name
	FROM visit_Andrey)
EXCEPT
(SELECT *
	FROM order_Andrey);