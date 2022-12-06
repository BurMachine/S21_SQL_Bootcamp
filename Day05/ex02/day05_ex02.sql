CREATE INDEX idx_person_name ON person USING btree (UPPER(person.name));

EXPLAIN ANALYSE 
SELECT name FROM person
WHERE UPPER(name) IS NOT NULL;
