INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date) 
VALUES ((SELECT max(id) + 1 FROM person_visits) , (SELECT id FROM person WHERE name='Dmitriy'),
		4, date '2022-01-28')
		
		
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
