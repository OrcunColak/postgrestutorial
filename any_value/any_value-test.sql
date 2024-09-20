-- The any_value() in PostgreSQL 16 provides a handy utility by returning a single value from a specified group of values.
-- This function doesn’t guarantee to return a specific value, rather it arbitrarily picks any value from the group.
--  This can be particularly beneficial in scenarios where you don’t need a specific value, but any representative value from a group will suffice.

db1=> SELECT any_value(column1) FROM (VALUES (1), (6), (NULL));
 any_value
-----------
         1

db1=> SELECT any_value(column1) FROM (VALUES (NULL), (6), (NULL));
 any_value
-----------
         6

-- it’s evident that any_value() returns a non-null value from the group.
--  This function is similar to the COALESCE function but operates on a group of values.
--  It is particularly useful for replacing aggregate functions such as MIN, MAX, and AVG when the application doesn’t require the aggregated output value, but instead needs any non-null entry from that group.
db1=> SELECT any_value(column1) FROM (VALUES (NULL), (NULL), (NULL));
 any_value
-----------