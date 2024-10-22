-- Сессия №1
-- Запускаем транзакцию и локально делаем изменения в таблице
START TRANSACTION;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия №2
-- Проверяем что изменения не видно во второй сессии
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия №1
-- Зафиксируем изменения с помощью оператора COMMIT
COMMIT;
-- Сессия №2
-- Проверяем что изменения видны во второй сессии
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';