Select id, name,
(
	CASE 
		WHEN age >= 10 and age <= 20 THEN 'interval #1'
		WHEN age > 20 and age <= 30 THEN 'interval #2'
		ELSE 'interval #3'
	END
) as interval_info
from person;
