WITH data AS (SELECT person.address, 
		round(max(cast(age as numeric(7,2))) - min(cast(age as numeric(7,2)))/max(cast(age as numeric(7,2))), 2) formula, 
		round(avg(age), 2) average
		FROM person
		GROUP BY address
		ORDER BY 1)
SELECT data.address, formula, average, 
		(CASE WHEN formula >  average THEN true
			  WHEN formula < average THEN false
	   		  END) comprasion
FROM data;
