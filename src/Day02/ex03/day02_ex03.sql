WITH cte_date AS (
	SELECT dates.date
	FROM generate_series('2022-01-01'::date, 
	'2022-01-10'::date, '1 day') AS dates),
	cte_pers AS (
	SELECT * 
	FROM person_visits AS v
	WHERE v.person_id = 1 OR v.person_id = 2
	AND v.visit_date  >= '2022-01-01'
	AND v.visit_date <= '2022-01-10'
	)
SELECT cte_date.date AS missing_date
FROM cte_date
FULL OUTER JOIN cte_pers
ON cte_date.date = cte_pers.visit_date
WHERE cte_pers.id IS NULL
ORDER BY cte_date.date;