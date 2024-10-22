-- Запускаем транзакции с уровнем изоляции SERIALIZABLE
-- Сессия №1
START TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Сессия №2
START TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--Проверяем что установлен нужный уровень изоляции
-- Сессия №1
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №2
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг пиццерии 3.6
-- Сессия №2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
COMMIT;
-- Сессия №1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг пиццерии 3.6
COMMIT;
-- Сессия №1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг пиццерии 3.0
-- Сессия №2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг пиццерии 3.0