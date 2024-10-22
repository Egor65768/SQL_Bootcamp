SELECT dates.date AS missing_date
FROM generate_series('2022-01-01'::date, 
	'2022-01-10'::date, '1 day') AS dates
FULL OUTER JOIN (SELECT * 
	FROM person_visits AS v
	WHERE v.person_id = 1 OR v.person_id = 2) AS t
ON dates.date = t.visit_date
WHERE t.id IS NULL
AND dates.date >= '2022-01-01'
AND dates.date <= '2022-01-10'
ORDER BY dates.date;