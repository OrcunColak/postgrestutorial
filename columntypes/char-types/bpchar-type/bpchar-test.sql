-- CHAR and BPCHAR are aliases.
-- They remove all blanks if possible during insertion. So they do not capture blanks and length() function may return a smaller number

CREATE TABLE student (id INT, name BPCHAR(10), faculty CHAR(10));

INSERT INTO student (id,name,faculty) VALUES (1, 'linux', 'linux');

-- char_length and length are the same
-- octet_length is different
SELECT id, name, length(name), octet_length(name), faculty, length(faculty), octet_length(faculty) FROM student;
SELECT id, name, length(name), octet_length(name), char_length(name), faculty, length(faculty), octet_length(faculty), char_length(faculty) FROM student;

SELECT id, name, length(name), octet_length(name), faculty, length(faculty), octet_length(faculty) FROM student;
 id |    name    | length | octet_length |  faculty   | length | octet_length
----+------------+--------+--------------+------------+--------+--------------
  1 | linux      |      5 |           10 | linux      |      5 |           10
(1 row)

INSERT INTO student (id,name,faculty) VALUES (2, 'linux          ', 'linux          ');

SELECT id, name, length(name), octet_length(name), char_length(name), faculty, length(faculty), octet_length(faculty), char_length(faculty) FROM student;
 id |    name    | length | octet_length | char_length |  faculty   | length | octet_length | char_length
----+------------+--------+--------------+-------------+------------+--------+--------------+-------------
  1 | linux      |      5 |           10 |           5 | linux      |      5 |           10 |           5
  2 | linux      |      5 |           10 |           5 | linux      |      5 |           10 |           5
(2 rows)