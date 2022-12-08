-- session #1
BEGIN TRANSACTION;

-- session #2
BEGIN TRANSACTION;

-- session #1
SELECT rating FROM pizzeria WHERE name='Pizza Hut';

-- session #2
SELECT rating FROM pizzeria WHERE name='Pizza Hut';

-- session #1
UPDATE pizzeria SET rating=4.0 WHERE name='Pizza Hut';

-- session #2
UPDATE pizzeria SET rating=4.0 WHERE name='Pizza Hut';

-- session #1
COMMIT;

-- session #2
COMMIT;

-- session #1
SELECT rating FROM pizzeria WHERE name='Pizza Hut';

-- session #2
SELECT rating FROM pizzeria WHERE name='Pizza Hut';
