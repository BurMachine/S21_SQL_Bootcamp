CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $trg_person_update_audit$
BEGIN
	IF (TG_OP = 'UPDATE') THEN 
		INSERT INTO person_audit SELECT NOW(), 'U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
	END IF;
	RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_update_audit();
	
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
