# Task0 
Мы хотим быть сильнее с данными, и мы не хотим терять никаких событий изменения. Давайте реализуем функцию аудита для входящих изменений INSERT. Пожалуйста, создайте таблицу person_auditс той же структурой, что и таблица person, но, пожалуйста, добавьте некоторые дополнительные изменения. Взгляните на таблицу ниже с описаниями для каждого столбца.

| Column | Type | Description |
| ------ | ------ | ------ |
| created | timestamp with time zone | timestamp when a new event has been created.  Default value is a current timestamp and NOT NULL |
| type_event | char(1) | possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL. Add check constraint `ch_type_event` with possible values ‘I’, ‘U’ and ‘D’ |
| row_id |bigint | copy of person.id. NOT NULL |
| name |varchar | copy of person.name (no any constraints) |
| age |integer | copy of person.age (no any constraints) |
| gender |varchar | copy of person.gender (no any constraints) |
| address |varchar | copy of person.address (no any constraints) |

На самом деле, давайте создадим функцию триггера базы данных с именем fnc_trg_person_insert_audit, которая должна обрабатывать INSERTтрафик DML и создавать копию новой строки в таблице person_audit.
Просто подсказка: если вы хотите реализовать триггер PostgreSQL (подробнее см. в документации PostgreSQL), вам необходимо создать 2 объекта: функцию триггера базы данных и триггер базы данных.
Поэтому, пожалуйста, определите триггер базы данных с именем trg_person_insert_auditи следующими параметрами:

триггер с опцией «ДЛЯ КАЖДОЙ СТРОКИ»;
триггер с "AFTER INSERT";
триггер вызывает функцию триггера fnc_trg_person_insert_audit.

Когда вы закончите с объектами-триггерами, пожалуйста, введите оператор INSERTв таблицу person.
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

# Task1
Давайте продолжим реализацию нашего шаблона аудита для таблицы person. Просто определим триггер trg_person_update_auditи соответствующую функцию триггера fnc_trg_person_update_auditдля обработки всего UPDATEтрафика в таблице person. Нам следует сохранить СТАРЫЕ состояния всех значений атрибутов.
Когда вы будете готовы, примените приведенные ниже операторы ОБНОВЛЕНИЯ.
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

# Task2
Наконец, нам нужно обработать DELETEутверждения и сделать копию СТАРЫХ состояний для всех значений атрибута. Пожалуйста, создайте триггер trg_person_delete_auditи соответствующую функцию триггера fnc_trg_person_delete_audit.
Когда будете готовы, используйте приведенный ниже оператор SQL.
DELETE FROM person WHERE id = 10;

# Task3
На самом деле, есть 3 триггера для одной personтаблицы. Давайте объединим всю нашу логику в один основной триггер с названием trg_person_auditи новую соответствующую функцию триггера fnc_trg_person_audit.
Другими словами, весь трафик DML ( INSERT, UPDATE, DELETE) должен обрабатываться одним функциональным блоком. Пожалуйста, явно определите отдельный блок IF-ELSE для каждого события (I, U, D)!
Кроме того, пожалуйста, следуйте инструкциям ниже.

удалить 3 старых триггера из таблицы персон;
удалить 3 старые функции триггера;
для выполнения a TRUNCATE(или DELETE) всех строк в нашей person_auditтаблице.

Когда вы будете готовы, повторно примените набор операторов DML.
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

# Task4
Как вы помните, мы создали 2 представления базы данных для разделения данных из таблиц person по признаку пола. Пожалуйста, определите 2 функции SQL (обратите внимание, не функции pl/pgsql) с именами:


fnc_persons_female(следует вернуть лиц женского пола),

fnc_persons_male(следует вернуть лиц мужского пола).

Чтобы проверить себя и вызвать функцию, вы можете сделать следующее выражение (Удивительно! Вы можете работать с функцией как с виртуальной таблицей!):

    SELECT *
    FROM fnc_persons_male();

    SELECT *
    FROM fnc_persons_female();

# Task5
Похоже, что 2 функции из упражнения 04 требуют более общего подхода. Пожалуйста, удалите эти функции из базы данных перед продолжением. Напишите общую функцию SQL (обратите внимание, не pl/pgsql-function) с именем fnc_persons. Эта функция должна иметь INпараметр pgender со значением по умолчанию = 'female'.
Чтобы проверить себя и вызвать функцию, вы можете сделать такое выражение (Ух ты! С функцией можно работать как с виртуальной таблицей, но с большей гибкостью!):

    select *
    from fnc_persons(pgender := 'male');

    select *
    from fnc_persons();

# Task6
Теперь давайте рассмотрим функции pl/pgsql.
Создайте функцию pl/pgsql fnc_person_visits_and_eats_on_dateна основе оператора SQL, которая найдет названия пиццерий, которые INпосетил человек (параметр pperson со значением по умолчанию «Дмитрий») и где он мог купить пиццу по цене ниже указанной суммы в рублях ( INпараметр pprice со значением по умолчанию 500) на указанную дату ( INпараметр pdate со значением по умолчанию 8 января 2022 г.).
Чтобы проверить себя и вызвать функцию, вы можете сделать следующее выражение.

    select *
    from fnc_person_visits_and_eats_on_date(pprice := 800);

    select *
    from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

# Task7
Напишите функцию SQL или pl/pgsql func_minimum(на ваше усмотрение), которая имеет входной параметр, представляющий собой массив чисел, и функция должна возвращать минимальное значение.
Чтобы проверить себя и вызвать функцию, вы можете сделать следующее выражение.

    SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

# Task8
Напишите функцию SQL или pl/pgsql fnc_fibonacci(на ваше усмотрение), которая имеет входной параметр pstop типа integer (по умолчанию 10), а выход функции представляет собой таблицу всех чисел Фибоначчи, меньших pstop.
Чтобы проверить себя и вызвать функцию, вы можете сделать следующее выражение.

    select * from fnc_fibonacci(100);
    select * from fnc_fibonacci();
