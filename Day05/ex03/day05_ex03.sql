CREATE INDEX idx_person_order_multi ON person_order USING btree (person_id, menu_id, order_date);

EXPLAIN ANALYSE 
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

