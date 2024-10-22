WITH res AS (
	SELECT o.id, z.name,m.price
	FROM person_order AS o
	INNER JOIN menu AS m
	ON m.id = o.menu_id
	INNER JOIN pizzeria AS z
	ON z.id = m.pizzeria_id)

SELECT name, COUNT(*) AS count_of_orders,
ROUND(AVG(price),2) AS average_price,
MAX(price) AS max_price,
MIN(price) AS min_price
FROM res
GROUP BY name
ORDER BY name;