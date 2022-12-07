INSERT INTO person_discounts
SELECT row_number() over(),
        person_id,
        pizzeria_id,
        (CASE
            WHEN count(pizzeria_id) = 1 THEN 10.5
            WHEN count(pizzeria_id) = 2 THEN 22
            ELSE 30 END)
 FROM person_order 
          LEFT JOIN menu on menu.id = person_order.menu_id
 GROUP BY person_order.person_id, menu.pizzeria_id;
