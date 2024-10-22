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
-- Видим что в обоих сессиях по дефолту
-- стоит уровеньизоляции read committed
-- Сессия №1
UPDATE pizzeria SET rating = 1.5 WHERE id = 1;
-- Сессия №2
UPDATE pizzeria SET rating = 0.5 WHERE id = 2;
-- Сессия №1
UPDATE pizzeria SET rating = 4.1 WHERE id = 2;
-- Сессия №2
UPDATE pizzeria SET rating = 3.2 WHERE id = 1;
-- Сессия №1
COMMIT;
-- После этого коммита в сессии 2 выскочила ошибка  
-- Сессия №2
COMMIT;
-- После этого коммита в сессии 2 произошел ROLLBACK
-- Таким образом в базу данных были внесены изменения 
-- сделанные в первой сессии