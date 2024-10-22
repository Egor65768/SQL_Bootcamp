CREATE UNIQUE INDEX IF NOT EXISTS idx_menu_unique
ON menu(pizzeria_id,pizza_name);
SET enable_seqscan TO OFF; -- временного отключения последовательного сканирования 
EXPLAIN ANALYZE 
SELECT *
FROM menu
WHERE pizzeria_id = 2;