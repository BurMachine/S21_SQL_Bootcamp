SELECT person.name, count(pizzeria_id)
FROM person_visits
	JOIN person ON person.id = person_visits.person_id
GROUP BY person.name
ORDER BY 2 DESC, 1
LIMIT 4;
