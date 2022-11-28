select distinct person_id from  person_visits where (visit_date between date '2022-01-06' and date '2022-01-09') 
or pizzeria_id=2
order by person_id desc;
