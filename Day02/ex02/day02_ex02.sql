SELECT COALESCE(person.name, '-') AS person_name, p.visit_date, COALESCE(pizzeria.name, '-')
FROM person
FULL JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN date '2022-01-01' AND date '2022-01-03') AS p
	ON p.person_id = person.id
FULL JOIN pizzeria
	ON pizzeria.id=p.pizzeria_id
ORDER BY 1,2,3;