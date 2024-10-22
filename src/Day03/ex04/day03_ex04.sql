WITH visit_female AS (SELECT z.name 
	FROM person_order AS o
	JOIN (SELECT * FROM person AS p
		WHERE p.gender = 'female' ) AS w
	ON o.person_id = w.id
	JOIN (SELECT  * FROM menu) AS m ON m.id = o.menu_id
	JOIN (SELECT * FROM pizzeria) AS z ON z.id = m.pizzeria_id),
		visit_male AS (SELECT z.name 
	FROM person_order AS o
	JOIN (SELECT * FROM person AS p
		WHERE p.gender = 'male' ) AS w
	ON o.person_id = w.id
	JOIN (SELECT  * FROM menu) AS m ON m.id = o.menu_id
	JOIN (SELECT * FROM pizzeria) AS z ON z.id = m.pizzeria_id)

(SELECT name AS pizzeria_name FROM visit_female
EXCEPT
SELECT name FROM visit_male)
UNION
(SELECT name AS pizzeria_name FROM visit_male
EXCEPT
SELECT name FROM visit_female);