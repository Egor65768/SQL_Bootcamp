WITH top_visit AS (
	SELECT pizzeria_id, COUNT(id) AS count,
	'visit' AS action_type
	FROM person_visits
	GROUP BY pizzeria_id
	ORDER BY count DESC
	LIMIT 3),
	top_order AS (
	SELECT m.pizzeria_id, COUNT(o.id) AS count,
	'order' AS action_type
	FROM person_order AS o
	INNER JOIN menu AS m
	ON m.id = o.menu_id
	GROUP BY m.pizzeria_id
	ORDER BY count DESC
	LIMIT 3),
	final_table AS (
	SELECT *
	FROM top_visit
	UNION
	SELECT *
	FROM top_order)

SELECT z.name,f.count,f.action_type
FROM final_table AS f
INNER JOIN pizzeria AS z
ON z.id = f.pizzeria_id
ORDER BY action_type,count DESC;