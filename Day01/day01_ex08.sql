SELECT person_info.order_date AS action_date, format('%s (age:%L)',person.name, person.age) AS person_information
FROM person
NATURAL JOIN (SELECT order_date, person_id AS id FROM person_order) as person_info
ORDER BY action_date, person_information;
