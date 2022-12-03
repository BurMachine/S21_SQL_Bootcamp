CREATE VIEW v_price_with_discount AS
	WITH table_disc AS (SELECT person.name , menu.pizza_name, menu.price, (menu.price - menu.price*0.1)::int discount_price
		FROM person 
		JOIN person_order ON person.id = person_order.person_id
		JOIN menu ON menu.id = person_order.menu_id
		ORDER BY 1,2)
	SELECT * FROM table_disc;
