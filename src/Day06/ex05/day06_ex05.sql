COMMENT ON TABLE person_discounts
IS 'Таблица с персональными скидками';
COMMENT ON COLUMN person_discounts.id
IS 'Первичный ключ (однозначно идентифицирует каждую стро-
ку данных в таблице)';
COMMENT ON COLUMN person_discounts.person_id
IS 'Внешний ключ,который ссылается на первичный ключ в таблице person';
COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'Внешний ключ,который ссылается на первичный ключ в таблице pizzeria';
COMMENT ON COLUMN person_discounts.discount
IS 'Величина персональной скидки';