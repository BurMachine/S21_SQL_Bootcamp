SELECT name FROM pizzeria
LEFT JOIN person_visits
ON person_visits.pizzeria_id = pizzeria.id
WHERE visit_date IS NULL;