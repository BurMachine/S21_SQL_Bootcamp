WITH woman AS (SELECT pizzeria.name FROM person_order JOIN  menu ON menu.id = person_order.menu_id
		   JOIN pizzeria ON pizzeria.id = menu.pizzeria_id JOIN person ON person.id = person_order.person_id
			  WHERE person.gender= 'female'),
	man  AS (SELECT pizzeria.name FROM person_order JOIN  menu ON menu.id = person_order.menu_id
		   JOIN pizzeria ON pizzeria.id = menu.pizzeria_id JOIN person ON person.id = person_order.person_id
			  WHERE person.gender= 'male'),
	cte_1 AS (SELECT * FROM woman EXCEPT SELECT * FROM man),
	cte_2 AS (SELECT * FROM man EXCEPT SELECT * FROM woman)				  
SELECT * FROM cte_1 UNION SELECT * FROM cte_2
ORDER BY 1;
