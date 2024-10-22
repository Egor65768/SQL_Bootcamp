SELECT DISTINCT o.order_date AS action_date,
	(SELECT name FROM person WHERE o.person_id = person.id) AS person_name
FROM person_visits AS v JOIN person_order AS o
ON o.order_date = v.visit_date AND o.person_id = v.person_id
ORDER BY o.order_date, person_name DESC;