SELECT person_order.order_date AS action_date, format('%s (age:%L)',person.name, person.age) AS person_information
FROM person_order
JOIN person ON person.id = person_order.person_id
ORDER BY action_date, person_information;
