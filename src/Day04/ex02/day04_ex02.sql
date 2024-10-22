CREATE VIEW v_generated_dates AS
SELECT date_list::date AS generated_date
FROM generate_series(
	'2022-01-01'::date,
	'2022-01-31'::date,
	'1 day')
AS date_list
ORDER BY generated_date;