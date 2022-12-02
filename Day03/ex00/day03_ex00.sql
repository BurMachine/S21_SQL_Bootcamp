SELECT m.pizza_name, m.price, pz.name, pv.visit_date
FROM person p
         JOIN person_visits pv ON p.id = pv.person_id
         JOIN pizzeria pz ON pv.pizzeria_id = pz.id
         JOIN menu m ON pz.id = m.pizzeria_id
WHERE (m.price BETWEEN 800 AND 1000)
  AND p.name = 'Kate'
ORDER BY 1, 2, 3;
