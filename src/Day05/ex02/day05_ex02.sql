CREATE INDEX IF NOT EXISTS
idx_person_name ON person(UPPER(name));
SET enable_seqscan TO OFF; -- временного отключения последовательного сканирования 
EXPLAIN ANALYZE 
SELECT *
FROM person 
WHERE UPPER(person.name) = 'ANNA';