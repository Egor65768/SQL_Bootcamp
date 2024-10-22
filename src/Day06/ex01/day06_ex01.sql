WITH count_order AS (
	SELECT o.person_id,
	m.pizzeria_id, COUNT(o.id) AS kol
	FROM person_order AS o
	INNER JOIN menu AS m
	ON m.id = o.menu_id
	GROUP BY o.person_id,m.pizzeria_id
	)
INSERT INTO person_discounts(id,person_id,pizzeria_id,discount)
SELECT ROW_NUMBER() OVER() AS id,
	c.person_id,
	c.pizzeria_id,
	(CASE WHEN kol = 1 THEN 10.5
	WHEN kol = 2 THEN 22
	ELSE 30 END) AS discount
FROM count_order AS c;