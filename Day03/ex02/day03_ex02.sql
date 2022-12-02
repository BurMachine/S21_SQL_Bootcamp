SELECT p.pizza_name, p.price, pz.name AS pizzeria_name FROM menu p
FULL JOIN person_order pv ON p.id = pv.menu_id
FULL JOIN pizzeria pz ON p.pizzeria_id = pz.id
WHERE pv.person_id IS NULL
ORDER BY 1, 2, 3;
