CREATE INDEX idx_1 ON pizzeria USING btree (rating);
EXPLAIN ANALYZE SELECT pizza_name                                                                                        AS pizza_name,
       max(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu 
         INNER JOIN pizzeria pz ON pizzeria_id = pz.id
ORDER BY 1, 2;
