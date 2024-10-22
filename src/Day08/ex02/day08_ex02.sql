-- Запускаем транзакции с уровнем изоляции REPEATABLE READ
-- Сессия №1
START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Сессия №2
START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Смотрим уровень изоляции транзакций
-- Сессия №1
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №2
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия №2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия №1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Сессия №2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Сессия №1
COMMIT;
-- После этого коммита в сессии 2 выскакивает ошибка
-- Сессия №2
COMMIT;
-- Происходит ROLLBACK
-- Сессия №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия №2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В обоих сессиях рейтинг пиццерии равен 4 
-- этот рейтинг был установлен в сессии 1