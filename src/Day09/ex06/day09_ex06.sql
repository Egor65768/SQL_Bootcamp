CREATE OR REPLACE FUNCTION
fnc_person_visits_and_eats_on_date(pperson varchar='Dmitriy',pprice int=500, pdate date='2022-01-08')
RETURNS TABLE (name VARCHAR)
AS $$
    BEGIN
	RETURN QUERY
	
	SELECT DISTINCT z.name 
	FROM person_visits AS v
	JOIN person_order AS o 
	ON o.person_id = v.person_id
	JOIN menu AS m
	ON o.menu_id = m.id
	JOIN pizzeria AS z
	ON z.id = m.pizzeria_id
	JOIN person AS p 
	ON v.person_id = p.id
	WHERE p.name = pperson
	AND m.price < pprice
	AND v.visit_date = pdate;

    END;
$$
LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

