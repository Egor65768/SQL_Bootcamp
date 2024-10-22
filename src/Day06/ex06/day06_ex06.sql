CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
AS BIGINT START WITH 1
OWNED BY person_discounts.id;
ALTER TABLE person_discounts 
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT SETVAL('seq_person_discounts', 
	(SELECT MAX(id) FROM person_discounts) + 1);
