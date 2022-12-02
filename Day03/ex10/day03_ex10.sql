INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES(
(SELECT max(id) FROM person_order) + 1, (SELECT id FROM person WHERE name = 'Denis'), 
	(SELECT id FROM menu WHERE menu.pizza_name='sicilian pizza'), date '2022-02-24'),
((SELECT max(id) FROM person_order) + 2, (SELECT id FROM person WHERE name = 'Irina'), 
	(SELECT id FROM menu WHERE menu.pizza_name='sicilian pizza'), date '2022-02-24');
