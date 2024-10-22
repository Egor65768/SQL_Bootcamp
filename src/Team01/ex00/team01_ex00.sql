WITH 
	sum_balance AS(
	SELECT user_id,sum(money) AS volume,type,currency_id
	FROM balance
	GROUP by 1,3,4
	),
	last_update AS(
	SELECT id,name,max(updated) AS updated
	FROM currency
	GROUP by 1,2
	),
	update_cur AS(
	SELECT id AS currency_id, name AS currency_name,rate_to_usd
	FROM currency
	JOIN last_update USING (id,name,updated)
	),
	user_new AS(
	SELECT id AS user_id,name,lastname
	FROM "user"
	)

SELECT
	COALESCE(name,'not defined') AS name,
	COALESCE(lastname,'not defined') AS lastname,
	type,
	volume,
	COALESCE(currency_name,'not defined') AS currency_name,
	COALESCE(rate_to_usd,1) AS last_rate_to_usd,
	(volume * COALESCE(rate_to_usd, 1)) AS total_volume_in_usd
FROM user_new
FULL JOIN sum_balance ON user_new.user_id = sum_balance.user_id
FULL JOIN update_cur ON sum_balance.currency_id = update_cur.currency_id
ORDER by 1 DESC,2,3;


