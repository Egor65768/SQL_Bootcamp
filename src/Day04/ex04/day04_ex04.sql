CREATE VIEW v_symmetric_union AS
(WITH sec_jan AS (
	SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-02'),
	sixth_jan AS (
	SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-06')
	
(SELECT * FROM sec_jan
EXCEPT
SELECT * FROM sixth_jan)
UNION
(SELECT * FROM sixth_jan
EXCEPT
SELECT * FROM sec_jan)
ORDER BY person_id);