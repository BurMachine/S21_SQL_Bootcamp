SELECT id FROM menu m
EXCEPT
SELECT menu_id FROM person_order po
ORDER BY 1;
