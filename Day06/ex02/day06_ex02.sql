SELECT person.Name name, menu.pizza_name, menu.price, (menu.price - menu.price * person_discounts.discount/100) discount_price,
pizzeria.name
	FROM person	
	JOIN person_discounts ON person.id = person_discounts.person_id
	JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON menu.id = person_order.menu_id
WHERE person.id = person_order.person_id
ORDER BY person.name, pizza_name;
