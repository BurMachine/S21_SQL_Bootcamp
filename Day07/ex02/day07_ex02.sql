WITH visits AS (SELECT pizzeria.name, count(person_visits.pizzeria_id), 'visit' action_type FROM person_visits
			   	JOIN pizzeria ON pizzeria.id  = person_visits.pizzeria_id
			   	GROUP BY pizzeria.name
				ORDER BY 2 DESC
			    LIMIT 3),
	 orders AS (SELECT pizzeria.name, count(pizzeria.id), 'order' action_type FROM person_order
			  	JOIN menu ON menu.id = person_order.menu_id
			  	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
			 	GROUP BY pizzeria.name
				ORDER BY 2 DESC
			    LIMIT 3)
SELECT * FROM visits UNION SELECT * FROM orders
ORDER BY 3, 2 DESC;
