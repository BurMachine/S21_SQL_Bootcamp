WITH woman AS (SELECT name FROM v_persons_female),
	 man AS (SELECT name FROM v_persons_male)
SELECT * FROM woman UNION ALL SELECT * FROM man
ORDER BY name;
	
