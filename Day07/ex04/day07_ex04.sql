WITH visits AS (SELECT person.name, count(person_visits.person_id) count_of_visits FROM person_visits
	JOIN person ON person.id = person_visits.person_id
GROUP BY person.name)

SELECT visits.name, visits.count_of_visits FROM visits JOIN person ON person.name = visits.name AND count_of_visits > 3
ORDER BY 2 DESC;
