DROP TABLE IF EXISTS pairs;
CREATE TABLE pairs(
	point1 CHAR(1),
	point2 CHAR(1),
	cost INT
);

INSERT INTO pairs(point1, point2, cost)
VALUES ('a','b',10),
		('a','d',20),
		('a','c',15),
		('b','d',25),
		('b','c',35),
		('c','d',30),
		('b','a',10),
		('d','a',20),
		('c','a',15),
		('d','b',25),
		('c','b',35),
		('d','c',30);

WITH RECURSIVE iteration(n, point1, point2, paths, sum) AS (
    SELECT 1::INT,
    '0'::CHAR(1),
    'a'::CHAR(1),
    'a'::bpchar ,
    0::INT
    UNION ALL
    SELECT n+1, 
    iteration.point2,
    p.point2,
    paths || ',' || p.point2 AS paths,
    sum+p.cost
    FROM iteration
    JOIN pairs p
    ON (
        iteration.point2=p.point1
        AND 
        iteration.point1<>p.point2
    )
    WHERE n<5
    AND  (
        paths NOT LIKE ( '%' || p.point2 || '%')
        OR (
            n=4
            AND 
            p.point2='a'
        ))
   
)

SELECT sum, '{' || paths || '}' AS tour
FROM iteration it
WHERE LENGTH(paths)=9 
AND sum=(
    SELECT MIN(sum) FROM iteration WHERE LENGTH(paths)=9
)
ORDER BY sum, tour;