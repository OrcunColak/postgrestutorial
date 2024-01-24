-- VARCHAR captures all characters and all blanks up to its size. So it captures blanks
-- CHAR removes all blanks if possible during insertion. So it does not capture blanks and length() function may return a smaller number

CREATE TABLE student (id INT, name BPCHAR(10), faculty CHAR(10));

INSERT INTO student (id,name,faculty) VALUES (1, 'linux', 'linux');

SELECT id, name, length(name), faculty, length(faculty) FROM student;

-------------------- Insert too long strings --------------------
-- Error for both CHAR and VARCHAR
-- Error, value too long for type character(10)
INSERT INTO student (id,name,faculty) VALUES (2, 'linuxlinuxlinux', 'faculty1');

-- Error, value too long for character varying(10)
INSERT INTO student (id,name,faculty) VALUES (2, 'linux', 'faculty1faculty1faculty1');

-------------------- Insert only blanks, succeeds even if it is too long--------------------
-- VARCHAR accepts with 10 length
-- CHAR accepts with 0 length
-- for VARCHAR
-- Success, captures 10 characters
INSERT INTO student (id,name,faculty) VALUES (2, 'linux', '               ');

SELECT id, name, length(name), faculty, length(faculty) FROM student;
 id |    name    | length |  faculty   | length
----+------------+--------+------------+--------
  1 | linux      |      5 | faculty1   |      8
  2 | linux      |      5 |            |     10
(2 rows)

-- for BPCHAR
-- Success, but name is CHAR with 0 length
INSERT INTO student (id,name,faculty) VALUES (3, '               ', 'faculty1');

SELECT id, name, length(name), faculty, length(faculty) FROM student;
 id |    name    | length |  faculty   | length
----+------------+--------+------------+--------
  1 | linux      |      5 | faculty1   |      8
  2 | linux      |      5 |            |     10
  3 |            |      0 | faculty1   |      8
(3 rows)

-------------------- Insert right side blanks--------------------
INSERT INTO student (id,name,faculty) VALUES (4, 'li n           ', 'fa u           ');

SELECT id, name, length(name), faculty, length(faculty) FROM student;
 id |    name    | length |  faculty   | length
----+------------+--------+------------+--------
  1 | linux      |      5 | faculty1   |      8
  2 | linux      |      5 |            |     10
  3 |            |      0 | faculty1   |      8
  4 | li n       |      4 | fa u       |     10
(4 rows)