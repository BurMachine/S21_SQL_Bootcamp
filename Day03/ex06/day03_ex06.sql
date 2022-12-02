WITH pizzeria1 AS (SELECT pizzeria.name, menu.pizza_name, menu.price FROM pizzeria JOIN menu ON menu.pizzeria_id = pizzeria.id),
	pizzeria2 AS (SELECT pizzeria.name, menu.pizza_name, menu.price FROM pizzeria JOIN menu ON menu.pizzeria_id = pizzeria.id)

SELECT pizzeria1.pizza_name, pizzeria1.name, pizzeria2.name, pizzeria1.price FROM pizzeria1 JOIN pizzeria2 ON pizzeria1.pizza_name = pizzeria2.pizza_name
WHERE pizzeria1.price=pizzeria2.price AND pizzeria1.name != pizzeria2.name
ORDER BY 1;

