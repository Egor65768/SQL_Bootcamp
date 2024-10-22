WITH visit_female AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.gender = 'female'),
	visit_male AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.gender = 'male'
	)

((SELECT *
FROM visit_female)
EXCEPT ALL (SELECT *
FROM visit_male))
UNION ALL
((SELECT *
FROM visit_male)
EXCEPT ALL (SELECT *
FROM visit_female))
ORDER BY 1;