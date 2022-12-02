WITH CTE_1 AS (SELECT pz.name FROM pizzeria pz
JOIN person_visits pv ON pz.id = pv.pizzeria_id
JOIN person p ON pv.person_id = p.id
WHERE p.gender = 'female'),
CTE_2 AS (SELECT pz.name FROM pizzeria pz
JOIN person_visits pv ON pz.id = pv.pizzeria_id
JOIN person p ON pv.person_id = p.id
WHERE p.gender = 'male'),
CTE_3 AS (SELECT * FROM CTE_1 EXCEPT ALL SELECT * FROM CTE_2),
CTE_4 AS (SELECT * FROM CTE_2 EXCEPT ALL SELECT * FROM CTE_1)
SELECT * FROM CTE_3 UNION ALL SELECT * FROM CTE_4
ORDER BY 1;
