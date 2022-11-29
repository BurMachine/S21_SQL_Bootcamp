SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person.id = person_visits.person_id  AND person_visits.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name;
