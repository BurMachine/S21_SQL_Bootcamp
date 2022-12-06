EXPLAIN ANALYSE
(SELECT pizza_name, pizzeria.name pizzeria_name FROM menu JOIN pizzeria ON pizzeria.id = menu.pizzeria_id);
