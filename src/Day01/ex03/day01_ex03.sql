SELECT DISTINCT o.order_date AS action_date,
	o.person_id AS person_id
FROM person_visits AS v JOIN person_order AS o
ON o.order_date = v.visit_date AND o.person_id = v.person_id
ORDER BY o.order_date,o.person_id DESC;