WITH order_id AS (SELECT menu_id 
	FROM person_order
	JOIN menu ON menu.id = person_order.menu_id)
SELECT id AS menu_id
FROM menu 
EXCEPT 
SELECT * FROM order_id
ORDER BY 1;