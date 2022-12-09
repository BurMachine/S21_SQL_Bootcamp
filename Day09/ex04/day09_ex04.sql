CREATE FUNCTION fnc_persons_female() RETURNS SETOF text AS $$
	SELECT name FROM person WHERE gender='female';
$$ LANGUAGE SQL;

CREATE FUNCTION fnc_persons_male() RETURNS SETOF text AS $$
	SELECT name FROM person WHERE gender='male';
$$ LANGUAGE SQL;


