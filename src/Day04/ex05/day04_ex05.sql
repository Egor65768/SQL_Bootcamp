CREATE VIEW v_price_with_discount AS(
WITH price_list AS (SELECT p.name,
	m.pizza_name,
	m.price
FROM person_order AS o
JOIN person AS p ON o.person_id = p.id
JOIN menu AS m ON m.id = o.menu_id)
SELECT name,
	pizza_name,
	price,
	CAST(price * 0.9 AS INT) AS discount_price
FROM price_list
ORDER BY 1,2);