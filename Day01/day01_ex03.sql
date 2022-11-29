(SELECT order_date AS date, person_id
FROM person_order)
INTERSECT
(SELECT visit_date AS date, person_id
FROM person_visits)
ORDER BY date, person_id DESC;
