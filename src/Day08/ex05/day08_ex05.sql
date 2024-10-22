-- Запускаем транзакции 
-- Сессия №1
START TRANSACTION;
-- Сессия №2
START TRANSACTION;
--Проверяем что установлен нужный уровень изоляции
-- Сессия №1
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №2
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №1
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 21.9
-- Сессия №2
INSERT INTO pizzeria (id,name,rating)
VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- Сессия №1
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 26.9
-- Сессия №1
COMMIT;
-- Сессия №1
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 26.9
-- Сессия №2
SELECT SUM(rating) FROM pizzeria;
-- Сумма равняется 26.9