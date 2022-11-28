select
	(select name from person where id=person_order.person_id) as username,
	(select name = 'Denis' from  person where id=person_order.person_id) as user_check

	from person_order
	where (menu_id=13 or menu_id=18 or menu_id=14) and order_date= date '2022-01-07';
