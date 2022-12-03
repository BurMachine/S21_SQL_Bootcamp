CREATE VIEW v_symmetric_union AS 
	WITH R_1 AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'),
	S_1 AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06'),
	R_S AS (SELECT * FROM R_1 EXCEPT SELECT * FROM S_1)
	SELECT * FROM R_S UNION ALL SELECT * FROM S_1;
