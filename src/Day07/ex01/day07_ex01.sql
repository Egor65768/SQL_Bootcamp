SELECT p.name,
COUNT(v.id) AS count_of_visits
FROM person_visits AS v
INNER JOIN person AS p
ON p.id = v.person_id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name
LIMIT 4;