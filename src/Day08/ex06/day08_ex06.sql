-- Запускаем транзакции 
-- Сессия №1
START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Сессия №2
START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--Проверяем что установлен нужный уровень изоляции
-- Сессия №1
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №2
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №1
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 26.9
-- Сессия №2
INSERT INTO pizzeria (id,name,rating)
VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- Сессия №1
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 26.9
-- Сессия №1
COMMIT;
-- Сессия №1
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 30.9
-- Сессия №2
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 30.9