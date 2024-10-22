SELECT p.id AS "person.id",
	p.name AS "person.name",
	p.age AS "age",
	p.gender AS "gender",
	p.address AS "address",
	z.id AS "pizzeria.id",
	z.name AS "pizzeria.name",
	z.rating AS "rating"
FROM person AS p,
	 pizzeria AS z
ORDER BY p.id, z.id;