CREATE OR REPLACE FUNCTION 
func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS
$$
	DECLARE
    minv NUMERIC := NULL; 
    currentv NUMERIC; 
    BEGIN
	    FOREACH currentv IN ARRAY arr
    		LOOP
        	IF minv IS NULL OR currentv < minv THEN
            	minv := currentv;
        	END IF;
   			END LOOP;
		RETURN minv;
    END;
$$ 
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);