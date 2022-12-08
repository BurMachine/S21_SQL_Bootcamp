-- session #1
BEGIN TRANSACTION;

-- session #2
BEGIN TRANSACTION;

-- session #1
SELECT sum(rating) FROM pizzeria;


-- session #2
UPDATE pizzeria SET rating=1.0 WHERE name='Pizza Hut';

-- session #2
COMMIT;

-- session #1
SELECT sum(rating) FROM pizzeria;

-- session #1
COMMIT;

-- session #1
SELECT sum(rating) FROM pizzeria;


-- session #2
SELECT sum(rating) FROM pizzeria;

