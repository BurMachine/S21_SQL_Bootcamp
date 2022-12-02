INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT gen AS id, pid.id AS person_id,
(SELECT id FROM menu WHERE pizza_name = 'greek pizza') menu_id, '2022-02-25' AS order_date
FROM generate_series((SELECT max(id) + 1 from person_order),
(SELECT max(id) FROM person) + (SELECT max(id) from person_order)) AS gen
JOIN person pid ON pid.id + (SELECT max(id) FROM person_order) = gen;
