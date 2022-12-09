drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;
drop trigger trg_person_insert_audit on person;

drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_insert_audit();
drop function fnc_trg_person_delete_audit();

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $trg_person_audit$
BEGIN
	IF (TG_OP = 'DELETE') THEN 
		INSERT INTO person_audit SELECT NOW(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
		RETURN NULL;
	ELSIF TG_OP = 'UPDATE' THEN
		INSERT INTO person_audit SELECT NOW(), 'U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
		RETURN NULL;
	ELSEIF TG_OP = 'INSERT' THEN
		INSERT INTO person_audit SELECT NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
		RETURN NULL;
	END IF;
END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER DELETE OR INSERT OR UPDATE 
ON person FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_audit();
	
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
