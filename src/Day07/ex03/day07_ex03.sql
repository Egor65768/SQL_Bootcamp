WITH p_vis AS (
	SELECT id, pizzeria_id
	FROM person_visits ),
	p_order AS (
	SELECT o.id,m.pizzeria_id 
	FROM person_order AS o
	INNER JOIN menu AS m
	ON m.id = o.menu_id),
	p_vis_and_ord AS (
	SELECT *
	FROM p_order
	UNION ALL 
	SELECT *
	FROM p_vis)

SELECT z.name, COUNT(p.id) AS total_count
FROM p_vis_and_ord AS p
INNER JOIN pizzeria AS z
ON z.id = p.pizzeria_id
GROUP BY z.name
ORDER BY total_count DESC,name;