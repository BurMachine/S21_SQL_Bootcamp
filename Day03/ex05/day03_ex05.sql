WITH visited AS (SELECT pizzeria.name FROM person_visits JOIN person ON person_visits.person_id = person.id
			 JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
			 WHERE person.name = 'Andrey'), 
	 ordered AS (SELECT pizzeria.name FROM person_order JOIN person ON person.id = person_order.person_id
				JOIN menu ON menu.id = person_order.id JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
				WHERE person.name = 'Andrey'),
	 cut AS (SELECT * FROM visited INTERSECT SELECT * FROM ordered)
SELECT * FROM cut
ORDER BY 1;
