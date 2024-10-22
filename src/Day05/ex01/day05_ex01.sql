SET enable_seqscan TO OFF; -- временного отключения последовательного сканирования 
EXPLAIN ANALYZE 
SELECT menu.pizza_name,
	pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria 
ON pizzeria.id = menu.pizzeria_id;