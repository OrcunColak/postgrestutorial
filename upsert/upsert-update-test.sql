-- See https://medium.com/codex/postgresql-upsert-4e6f20b337ba
-- Syntax
-- INSERT INTO table_name (column1, column2, ...) VALUES (col1_value, col2_value, ...)
-- ON CONFLICT (conflict_column)
-- DO NOTHING | DO UPDATE SET
--     column1 = col1_value,
--     column2 = col2_value, ...;

CREATE TABLE test_user(
   id INT PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   age INT not NULL
);

INSERT INTO public.test_user (id, "name", age)
values
 (0, 'itsuki0', 100000),
 (1, 'itsuki1', 100000),
 (2, 'itsuki2', 100000),
 (3, 'itsuki3', 100000),
 (4, 'itsuki4', 100000),
 (5, 'itsuki5', 100000);

-- UPSERT For Single Row

-- In the case of a non-existing row, no conflict occurs and the row is inserted!
INSERT INTO public.test_user (id, "name", age) values (6, 'itsuki6', 100001)
ON CONFLICT(id)
DO UPDATE SET
age = 100001;

-- For an existing row, the age is updated to its new value.

INSERT INTO public.test_user (id, "name", age) values (0, 'itsuki0', 1000000000)
ON CONFLICT(id)
DO UPDATE SET
 age = 1000000000;

-- UPSERT For Multiple Rows
-- If you think about the syntax we have above carefully, you will realize that it will NOT work if we try to insert multiple
-- rows where each row has a different target value!

-- We cannot DO UPDATE SET multiple rows by specifying the value like we did above, ie: age = someNumber, or name = someName.
-- Here is where the EXCLUDE comes in handy. I think of it as a special table that keeps a reference to the values we attempted to insert!
INSERT INTO public.test_user (id, "name", age)
values
 (0, 'itsuki0', 1),
 (1, 'itsuki1', 2),
 (2, 'itsuki2', 3),
 (3, 'itsuki3', 4),
 (100, 'itsuki100', 100),
 (101, 'itsuki101', 101)
ON CONFLICT(id)
DO UPDATE SET
  age = EXCLUDED.age;