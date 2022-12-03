SELECT date missing_date FROM person_visits 
RIGHT JOIN v_generated_dates ON person_visits.visit_date = v_generated_dates.date
	WHERE visit_date IS NULL;
