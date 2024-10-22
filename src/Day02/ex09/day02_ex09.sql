WITH id_person_order_peperon AS (
	SELECT person_id
	FROM person_order 
	JOIN (SELECT * FROM menu
	WHERE pizza_name = 'pepperoni pizza') AS pep_men
	ON person_order.menu_id = pep_men.id),
	id_person_order_cheese AS (
	SELECT person_id
	FROM person_order 
	JOIN (SELECT * FROM menu
	WHERE pizza_name = 'cheese pizza') AS che_men
	ON person_order.menu_id = che_men.id),
	id_pers_order_che_and_pep AS (
	SELECT *
	FROM id_person_order_cheese
	INTERSECT
	SELECT *
	FROM id_person_order_peperon
	)

SELECT name
FROM id_pers_order_che_and_pep
JOIN person ON person.id = id_pers_order_che_and_pep.person_id 
WHERE gender = 'female'
ORDER BY name;