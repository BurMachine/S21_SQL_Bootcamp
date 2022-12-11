insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION names_proc(VARCHAR) RETURNS VARCHAR AS $$
  BEGIN
    IF $1 IS NULL
      THEN RETURN 'is not defined';
     ELSIF ($1 IS NOT NULL)
       THEN RETURN $1;  
    END IF;
  END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION currency_trans(NUMERIC, NUMERIC, NUMERIC) RETURNS NUMERIC AS $$
  BEGIN
    IF $1 IS NULL
      THEN RETURN $2 * $3;
    ELSIF $1 IS NOT NULL
      THEN RETURN $1 * $3;
    END IF;
  END;
$$ LANGUAGE plpgsql;

SELECT names_proc(u.name) as name,
  names_proc(u.lastname) as lastname,
  names_proc(c.name) as currency_name,
  (currency_trans((select rate_to_usd from currency as c
     where b.currency_id = c.id and c.updated < b.updated
     order by c.updated desc
     limit 1),
     (select rate_to_usd from currency as c
     where b.currency_id = c.id and c.updated > b.updated
     order by c.updated
     limit 1), money))::real as currency_in_usd
FROM balance as b 
join (select distinct c.id, c.name from currency as c) as c on c.id = b.currency_id
left join "user" as u on u.id = b.user_id
order by 1 desc, 2, 3;

