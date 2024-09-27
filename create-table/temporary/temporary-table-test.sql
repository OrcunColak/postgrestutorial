-- See https://blog.stackademic.com/temporary-tables-in-sql-and-how-i-used-it-to-improve-performance-96a79997b47b
In PostgreSQL, a temporary table is a table that exists only during a database session. It is created and used within a single database
session and is automatically dropped at the end of the session.

CREATE TEMPORARY TABLE IF NOT EXISTS temp_student(
	name VARCHAR(250),
	phone VARCHAR(250),
	score INT
);

DELETE FROM temp_student;

INSERT INTO temp_student(name, phone, score)
VALUES
('Nirjal Paudel', '+9779863948081', 93),
('Nirja Paude', '+977986394808', 94),
('Nirj Paud', '+97798639480', 90);

UPDATE temp_student
SET score = 100
WHERE score::int > 93;


SELECT * FROM temp_student;