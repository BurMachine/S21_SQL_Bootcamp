SELECT pizzeria.name, count(menu.pizzeria_id), round(avg(menu.price), 2), max(menu.price), min(menu.price)
FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY 1;
