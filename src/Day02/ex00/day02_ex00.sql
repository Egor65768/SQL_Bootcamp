SELECT p.name, p.rating
FROM pizzeria AS p
LEFT JOIN person_visits AS v
	ON p.id = v.pizzeria_id
WHERE v.id IS NULL;