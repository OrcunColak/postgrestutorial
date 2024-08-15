-- See https://medium.com/@dmitry.romanoff/postgresql-b1f58a1486ba

-- delete all records except for the first and last
DELETE FROM your_table
WHERE id NOT IN (
 (SELECT MIN(id) FROM your_table),
 (SELECT MAX(id) FROM your_table)
);

-- If the table is very large, consider deleting data in phases to minimize the load on the system.
-- Common Table Expression
WITH rows_to_delete AS (
 SELECT id FROM your_table
   WHERE id NOT IN (
     (SELECT MIN(id) FROM your_table),
     (SELECT MAX(id) FROM your_table)
   )
 LIMIT 100000
)

DELETE FROM your_table WHERE id IN (SELECT id FROM rows_to_delete);