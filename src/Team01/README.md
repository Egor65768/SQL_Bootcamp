# Представлением нашей модели базы данных.

![D08_06](img/schema.png) 

Скрипт для создания БД

```sql
create table "user"
(id bigint primary key ,
 name varchar,
 lastname varchar);

insert into "user" values (1,'Иван', 'Иванов');
insert into "user" values (2,'Петр', null);
insert into "user" values (3, null, 'Сидоров');

create table currency(
    id bigint not null ,
    name varchar not null ,
    rate_to_usd numeric,
    updated timestamp
);

insert into currency values (100, 'EUR', 0.9, '2022-03-03 13:31');
insert into currency values (100, 'EUR', 0.89, '2022-03-02 12:31');
insert into currency values (100, 'EUR', 0.87, '2022-03-02 08:00');
insert into currency values (100, 'EUR', 0.9, '2022-03-01 15:36');
insert into currency values (200, 'USD', 1, '2022-03-03 13:31');
insert into currency values (200, 'USD', 1, '2022-03-02 12:31');
insert into currency values (300, 'JPY', 0.0087, '2022-03-03 13:31');
insert into currency values (300, 'JPY', 0.0079, '2022-03-01 13:31');

create table balance
(user_id bigint,
 money numeric,
 type integer,
 currency_id integer,
 updated timestamp);

insert into balance values (4, 120,1, 200, '2022-01-01 01:31');
insert into balance values (4, 120,0, 300, '2022-01-01 01:31');
insert into balance values (1, 20,1, 100, '2022-01-01 13:31');
insert into balance values (1, 200,1, 100, '2022-01-09 13:31');
insert into balance values (1, 190,1, 100, '2022-01-10 13:31');
insert into balance values (2, 100,2, 210, '2022-01-09 13:31');
insert into balance values (2, 103,2, 210, '2022-01-10 13:31');
insert into balance values (3, 50,0, 100, '2022-01-09 13:31');
insert into balance values (3, 500,1, 200, '2022-01-09 13:31');
insert into balance values (3, 500,2, 300, '2022-01-09 13:31');

```

# Task0

Давайте рассмотрим источники данных и первый логический уровень данных (ODS — Operational Data Store) в DWH.

![D08_06](img/T01_05.png) 

Напишите SQL-выражение, которое возвращает общий объем (сумму всех денег) транзакций с баланса пользователя, агрегированного по пользователю и типу баланса. Обратите внимание, что все данные должны быть обработаны, включая данные с аномалиями. Ниже приведена таблица столбцов результатов и соответствующая формула расчета.

| Output Column | Formula (pseudocode) |
| ------ | ------ |
| name | source: user.name if user.name is NULL then return `not defined` value |
| lastname | source: user.lastname if user.lastname is NULL then return `not defined` value |
| type | source: balance.type | 
| volume | source: balance.money need to summarize all money “movements” | 
| currency_name | source: currency.name if currency.name is NULL then return `not defined` value | 
| last_rate_to_usd | source: currency.rate_to_usd. take a last currency.rate_to_usd for corresponding currency if currency.rate_to_usd is NULL then return 1 | 
| total_volume_in_usd | source: volume , last_rate_to_usd. make a multiplication between volume and last_rate_to_usd |

Ниже приведен пример выходных данных. Сортируйте результат по имени пользователя в порядке убывания, а затем по фамилии пользователя и типу баланса в порядке возрастания.

| name | lastname | type | volume | currency_name | last_rate_to_usd | total_volume_in_usd |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| Петр | not defined | 2 | 203 | not defined | 1 | 203 |
| Иван | Иванов | 1 | 410 | EUR | 0.9 | 369 |
| ... | ... | ... | ... | ... | ... | ... |

# Task1

Прежде чем углубляться в эту задачу, примените следующие операторы INSERT.
insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
Напишите SQL-оператор, который возвращает всех пользователей, все транзакции по балансу (в этой задаче, пожалуйста, игнорируйте валюты, у которых нет ключа в Currencyтаблице) с названием валюты и рассчитанным значением валюты в долларах США на следующий день.
Ниже приведена таблица столбцов результатов и соответствующая формула расчета.

| Output Column | Formula (pseudocode) |
| ------ | ------ |
| name | source: user.name if user.name is NULL then return `not defined` value |
| lastname | source: user.lastname if user.lastname is NULL then return `not defined` value |
| currency_name | source: currency.name | 
| currency_in_usd | involved sources: currency.rate_to_usd, currency.updated, balance.updated.Take a look at a graphical interpretation of the formula below.| 

![D08_06](img/T01_06.png) 

Вам необходимо найти ближайший курс валюты к доллару США в прошлом (t1).
Если t1 пуст (то есть в прошлом курсы отсутствовали), то находим ближайший rate_to_usd валюты в будущем (t2).
Используйте курс t1 ИЛИ t2 для расчета валюты в формате USD.

См. пример вывода ниже. Сортируйте результат по имени пользователя в порядке убывания, а затем по фамилии пользователя и названию валюты в порядке возрастания.

| name | lastname | currency_name | currency_in_usd |
| ------ | ------ | ------ | ------ |
| Иван | Иванов | EUR | 150.1 |
| Иван | Иванов | EUR | 17 |
| ... | ... | ... | ... |
