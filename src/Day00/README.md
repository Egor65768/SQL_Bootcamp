# Task 0
Создайте оператор select, который возвращает все имена и возрасты людей из города «Казань».

# Task 1
Пожалуйста, сделайте запрос select, который возвращает имена, возрасты всех женщин из города 'Казань'. Да, и пожалуйста, отсортируйте результат по имени.

# Task2 
Создайте 2 различных по синтаксису оператора select, которые возвращают список пиццерий (название пиццерии и рейтинг) с рейтингом от 3,5 до 5 баллов (включая предельные баллы), упорядоченных по рейтингу пиццерии.
первый оператор select должен содержать знаки сравнения (<=, >=);
Второй оператор select должен содержать BETWEENключевое слово.

# Task3
Создайте оператор select, который возвращает идентификаторы лиц (без дубликатов), которые посетили пиццерии в период с 6 января 2022 г. по 9 января 2022 г. (включая все дни) или посетили пиццерии с идентификатором 2. Также включите условие упорядочивания по идентификатору лица в порядке убывания.

# Task4
Создайте оператор select, который возвращает одно вычисляемое поле с именем «person_information» в одной строке, как описано в следующем примере:
Anna (age:16,gender:'female',address:'Moscow') Наконец, пожалуйста, добавьте пункт упорядочивания по вычисляемому столбцу в восходящем режиме. Пожалуйста, обратите внимание на кавычки в вашей формуле!

# Task5 
Напишите оператор select, который возвращает имена людей (на основе внутреннего запроса в SELECTпредложении), которые оформили заказы на меню с идентификаторами 13, 14 и 18, а дата заказов должна быть 7 января 2022 года. Будьте осторожны с «Отклоненным разделом» перед началом работы.

# Task6 
Используйте конструкцию SQL из упражнения 05 и добавьте в предложение новый вычисляемый столбец (используйте имя столбца «check_name») с оператором проверки (псевдокод для этой проверки приведен ниже) SELECT.

# Task7
Давайте применим интервалы данных к personтаблице. Пожалуйста, создайте SQL-выражение, которое возвращает идентификаторы человека, имена человека и интервал возраста человека (задайте имя нового вычисляемого столбца как 'interval_info') на основе псевдокода ниже.
```
if (age >= 10 and age <= 20) then return 'interval #1'
else if (age > 20 and age < 24) then return 'interval #2'
else return 'interval #3'
```
И да... пожалуйста, отсортируйте результат по столбцу «interval_info» в порядке возрастания.

# Task8
Создайте SQL-оператор, который возвращает все столбцы из person_orderтаблицы со строками, идентификатор которых является четным числом. Результат должен быть упорядочен по возвращаемому идентификатору.

# Task9
Создайте оператор select, который возвращает имена людей и названия пиццерий на основе person_visitsтаблицы с датой посещения в период с 7 по 9 января 2022 г. (включая все дни) (на основе внутреннего запроса в предложении `FROM').
Пожалуйста, взгляните на шаблон окончательного запроса.
```
SELECT (...) AS person_name ,  -- this is an internal query in a main SELECT clause
        (...) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT … FROM person_visits WHERE …) AS pv -- this is an internal query in a main FROM clause
ORDER BY ...
```
Пожалуйста, добавьте пункт упорядочивания по имени человека в порядке возрастания и по названию пиццерии в порядке убывания.