SELECT name, COUNT(*) AS count_of_visits
FROM person_visits AS v
INNER JOIN person AS p
ON v.person_id = p.id
GROUP BY p.name 
HAVING COUNT(*) > 3;