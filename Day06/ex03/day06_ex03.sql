SET enable_seqscan=off; -- Нужны для того чтобы обращения осуществлялись по индексу
SET enable_bitmapscan = off;


CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts USING btree (person_id, pizzeria_id);

EXPLAIN ANALYSE 
	SELECT person_id, pizzeria_id FROM person_discounts;
