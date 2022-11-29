(SELECT order_date AS date, (SELECT name FROM person WHERE id = person_id) AS person_name
FROM person_order)
INTERSECT
(SELECT visit_date AS date, (SELECT name FROM person WHERE id = person_id) AS person_name
FROM person_visits)
ORDER BY date, person_name DESC;
