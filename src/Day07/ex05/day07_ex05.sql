SELECT DISTINCT p.name 
FROM person_order AS o
INNER JOIN person AS p
ON p.id = o.person_id
ORDER BY p.name;