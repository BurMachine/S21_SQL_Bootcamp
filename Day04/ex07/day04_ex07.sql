INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id) FROM person_visits) + 1, (SELECT id FROM person WHERE name = 'Dmitriy'), (SELECT piz.id FROM menu m
    LEFT JOIN pizzeria piz ON m.pizzeria_id = piz.id
    LEFT JOIN mv_dmitriy_visits_and_eats mv ON TRUE WHERE m.price < 800 AND mv.name != piz.name LIMIT 1), '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
		
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
