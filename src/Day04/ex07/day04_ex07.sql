INSERT INTO person_visits(id,person_id,pizzeria_id,visit_date)
VALUES (
	(SELECT MAX(id) FROM person_visits) + 1,
	(SELECT id FROM person WHERE name = 'Dmitriy'),
	(SELECT pizzeria_id FROM menu
	JOIN pizzeria AS z ON z.id = menu.pizzeria_id 
	JOIN mv_dmitriy_visits_and_eats AS mv_d ON mv_d.pizzeria_name <> z.name
	WHERE menu.price < 800
	LIMIT 1),
	'2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;