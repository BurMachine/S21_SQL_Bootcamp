SELECT missing_date.date 
FROM generate_series(date '2022-01-01', date '2022-01-10', '1 day') AS missing_date
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id=1 OR person_id=2) AS tmp
ON missing_date.date = tmp.visit_date
WHERE tmp.visit_date IS NULL;