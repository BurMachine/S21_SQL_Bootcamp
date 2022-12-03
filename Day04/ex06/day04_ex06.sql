CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	SELECT pizzeria.name
FROM person_visits
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person.id = person_visits.person_id
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy' AND menu.price < 800 AND person_visits.visit_date = '2022-01-08';
