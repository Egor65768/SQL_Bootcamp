SELECT COALESCE(p.name, '-') AS person_name,
	v.visit_date,
	COALESCE(z.name, '-') AS pizzeria_name	
FROM (SELECT *
FROM person_visits
WHERE person_visits.visit_date >= '2022-01-01'
AND person_visits.visit_date <= '2022-01-03') AS v
FULL OUTER JOIN person AS p
ON p.id = v.person_id
FULL OUTER JOIN pizzeria AS z
ON z.id = v.pizzeria_id
ORDER BY person_name,v.visit_date,pizzeria_name;