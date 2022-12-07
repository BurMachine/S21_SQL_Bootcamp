WITH visit_names AS (SELECT person.name FROM person_order JOIN person ON person.id = person_order.person_id)
SELECT DISTINCT visit_names.name FROM person INNER JOIN visit_names ON visit_names.name = person.name
ORDER BY 1
