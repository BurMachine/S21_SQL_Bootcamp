CREATE FUNCTION fnc_persons(IN pgender varchar default 'female') RETURNS SETOF text AS $$
	SELECT name FROM person WHERE gender=pgender;
$$ LANGUAGE SQL;
