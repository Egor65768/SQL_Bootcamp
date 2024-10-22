SELECT new_table.order_date,
	CONCAT(p.name,' (age:',p.age,')') AS "person_information"
FROM person AS p
	NATURAL JOIN (SELECT person_id AS id,order_date FROM person_order) AS new_table
ORDER BY new_table.order_date,person_information ;
