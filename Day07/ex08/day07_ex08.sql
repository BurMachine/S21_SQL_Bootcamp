SELECT person.address, pizzeria.name, count(pizzeria_id) count_of_orders FROM person_order
	JOIN person ON person.id= person_order.person_id
	JOIN menu ON menu.id= person_order.menu_id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY 1, 2;

