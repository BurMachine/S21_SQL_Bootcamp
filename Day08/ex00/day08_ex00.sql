BEGIN TRANSACTION;
UPDATE pizzeria SET rating=5.0 WHERE name='Pizza Hut';

-- sesson #1
select * from pizzeria;

-- sesson #2
select * from pizzeria;

-- sesson #1
COMMIT;

-- sesson #1
select * from pizzeria;

-- sesson #2
select * from pizzeria;
