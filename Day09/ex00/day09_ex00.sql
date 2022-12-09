CREATE TABLE person_audit
( 
	created timestamp with time zone DEFAULT NOW() NOT NULL,
  	type_event char(1) DEFAULT 'I' NOT NULL,
  	row_id bigint NOT NULL ,
  	name varchar not null,
  	age integer,
  	gender varchar,
  	address varchar
	constraint ch_type_event check (type_event = 'I' OR type_event = 'U' OR type_event = 'D')
);

-- NEW - это строки которые обрабатывает триггер, в случает инсерт - новвая строка

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
BEGIN
	IF (TG_OP = 'INSERT') THEN 
		INSERT INTO person_audit SELECT NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
	END IF;
	RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_insert_audit();
	
INSERT INTO person VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
