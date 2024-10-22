-- Сессия №1
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №2
SHOW TRANSACTION ISOLATION LEVEL;
-- Сессия №1
START TRANSACTION;
-- Сессия №2
START TRANSACTION;
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
-- Сессия №2
COMMIT;
-- Сессия №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия №2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';