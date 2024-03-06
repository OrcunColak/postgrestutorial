-- See https://medium.com/@magda7817/row-columns-that-the-select-statement-hides-from-you-1c613cbc2aae

CREATE TABLE table1 (key INT, value CHAR);
INSERT INTO table1 VALUES (1, 'a'),(2,'b'),(3,'c');

-- The xmin field stores the ID of a transaction that added a record to the database.
-- It's consistent across all the records in our example because we used a multi-insert statement that is executed within a single transaction.
select xmin,* from table1;