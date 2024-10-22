WITH buf_table AS ( SELECT address,
	ROUND(MAX(age) - (MIN(age)*1.0/MAX(age)),2) AS formula,
	ROUND(AVG(age),2) AS average
	FROM person
	GROUP BY address
	ORDER BY address)

SELECT address,formula,average,
CASE WHEN formula > average THEN 'true'
ELSE 'false' END AS comparison
FROM buf_table;
