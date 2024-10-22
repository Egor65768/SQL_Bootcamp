-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH buf_table AS (
	SELECT b.user_id,
	b.money,
	c.id,
	c.name,
	(SELECT rate_to_usd
	FROM currency AS buf_c
	WHERE buf_c.id = b.currency_id
	AND buf_c.updated < b.updated
	ORDER BY rate_to_usd
	LIMIT 1) AS rate_before,
	(SELECT rate_to_usd
	FROM currency AS after_c
	WHERE after_c.id = b.currency_id
	AND after_c.updated > b.updated
	ORDER BY rate_to_usd
	LIMIT 1) AS rate_after
	FROM currency AS c
	INNER JOIN balance AS b
	ON b.currency_id = c.id
)

SELECT DISTINCT
	COALESCE("user".name,'not defined') AS name,
	COALESCE("user".lastname,'not defined') AS lastname,
	buf_table.name AS currency_name,
	buf_table.money * COALESCE(buf_table.rate_before, buf_table.rate_after) AS currency_in_usd
	
FROM buf_table
LEFT JOIN "user"
ON "user".id = buf_table.user_id
ORDER BY name DESC,lastname,currency_name;