CREATE OR REPLACE FUNCTION 
fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci INTEGER) 
AS $$
	WITH RECURSIVE my_fibonacci(first_f,second_f) AS (
	SELECT 0,1
	UNION ALL
	SELECT second_f,
	second_f + first_f
	FROM my_fibonacci
	WHERE second_f < pstop)
	SELECT first_f
	FROM my_fibonacci   
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
