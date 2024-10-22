SELECT order_date,
	(SELECT CONCAT(name,' (age:',age,')') 
	FROM person WHERE person.id = person_order.person_id ) as "person_information"
FROM person_order
ORDER BY order_date,person_information ;
