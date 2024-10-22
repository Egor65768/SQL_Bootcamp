SELECT p.address, z.name, COUNT(*) AS count_of_orders
FROM person_order AS o
INNER JOIN person AS p
ON p.id = o.person_id
INNER JOIN menu AS m
ON m.id = o.menu_id
INNER JOIN pizzeria AS z
ON z.id = m.pizzeria_id
GROUP BY p.address,z.name
ORDER BY p.address,z.name;