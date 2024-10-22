# Task0
Пожалуйста, создайте простой индекс BTree для каждого внешнего ключа в нашей базе данных. Шаблон имени должен соответствовать следующему правилу "idx_{table_name}_{column_name}". Например, имя индекса BTree для столбца pizzeria_id в таблице menu— idx_menu_pizzeria_id.

# Task1
Прежде чем продолжить, пожалуйста, напишите SQL-выражение, которое возвращает пиццы и соответствующие названия пиццерий. Смотрите пример результата ниже (сортировка не требуется).

| pizza_name | pizzeria_name | 
| ------ | ------ |
| cheese pizza | Pizza Hut |
| ... | ... |

Давайте докажем, что ваши индексы работают для вашего SQL. Пример доказательства — вывод команды EXPLAIN ANALYZE. Пожалуйста, посмотрите на пример вывода команды.

    ...
    ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
    ...

# Task2
Создайте функциональный индекс B-Tree, названный idx_person_nameпо имени столбца таблицы person. Индекс должен содержать имена людей в верхнем регистре.
Напишите и предоставьте любой SQL-код с доказательством ( EXPLAIN ANALYZE), что индекс idx_person_name работает.

# Task3
Создайте лучший многостолбцовый индекс B-Tree, названный idx_person_order_multiв соответствии с приведенным ниже оператором SQL.

    SELECT person_id, menu_id,order_date
    FROM person_order
    WHERE person_id = 8 AND menu_id = 19;

Команда EXPLAIN ANALYZEдолжна вернуть следующий шаблон. Обратите внимание на сканирование "Index Only Scan"!

    Index Only Scan using idx_person_order_multi on person_order ...

Предоставьте любой SQL-код с доказательством ( EXPLAIN ANALYZE), что индекс idx_person_order_multiработает.

# Task4
Пожалуйста, создайте уникальный индекс BTree с именем idx_menu_uniqueв menuтаблице для   pizzeria_idи pizza_nameстолбцов. Напишите и предоставьте любой SQL с доказательством ( EXPLAIN ANALYZE), что индекс idx_menu_uniqueработает.

# Task5
Создайте частично уникальный индекс BTree с именем idx_person_order_order_dateв person_orderтаблице для person_idатрибутов menu_idи с частичной уникальностью для order_dateстолбца для даты «2022-01-01».
Команда EXPLAIN ANALYZEдолжна вернуть следующий шаблон.

    Index Only Scan using idx_person_order_order_date on person_order …

# Task6
Взгляните на приведенный ниже SQL-код с технической точки зрения (не обращайте внимания на логическую сторону этого SQL-выражения).

    SELECT
        m.pizza_name AS pizza_name,
        max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
    FROM  menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    ORDER BY 1,2;

Создайте новый индекс BTree с именем idx_1, который должен улучшить метрику "Время выполнения" этого SQL. Предоставьте доказательства ( EXPLAIN ANALYZE), что SQL был улучшен.