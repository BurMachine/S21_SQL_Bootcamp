WITH ids AS (SELECT id FROM menu)
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
	VALUES ((SELECT max(id) FROM ids) + 1, 2, 'sicilian pizza', 900);
