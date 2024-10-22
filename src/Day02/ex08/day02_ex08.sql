WITH cte_p AS (SELECT *
	FROM person_order 
	JOIN (SELECT name,id FROM person 
	WHERE gender = 'male' AND (address = 'Moscow' 
	OR address = 'Samara')) AS name_per
	ON name_per.id = person_order.person_id),
	cte_m AS (SELECT *
	FROM menu
	WHERE pizza_name = 'pepperoni pizza' 
	OR pizza_name = 'mushroom pizza')
	
SELECT cte_p.name
FROM cte_p
JOIN cte_m ON cte_m.id = cte_p.menu_id
ORDER BY name DESC;