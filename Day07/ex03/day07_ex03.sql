WITH visits AS (SELECT pizzeria.name, count(person_visits.pizzeria_id), 'visit' action_type FROM person_visits
			   	JOIN pizzeria ON pizzeria.id  = person_visits.pizzeria_id
			   	GROUP BY pizzeria.name
				ORDER BY 2 DESC),
	 orders AS (SELECT pizzeria.name, count(pizzeria.id), 'order' action_type FROM person_order
			  	JOIN menu ON menu.id = person_order.menu_id
			  	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
			 	GROUP BY pizzeria.name
				ORDER BY 2 DESC)
SELECT visits.name, visits.count + orders.count total_count FROM visits JOIN orders ON orders.name = visits.name
ORDER BY  2 DESC;
