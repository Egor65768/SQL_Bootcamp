CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
	WITH cte_v AS (SELECT pizzeria_id
		FROM person_visits AS v
		JOIN (SELECT * FROM person WHERE name = 'Dmitriy') AS d
		ON d.id = v.person_id
		WHERE v.visit_date = '2022-01-08' 
		)
	SELECT pizzeria.name AS pizzeria_name
	FROM cte_v
	JOIN menu ON cte_v.pizzeria_id = menu.pizzeria_id 
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	WHERE menu.price < 800
	ORDER BY pizzeria_name
);
