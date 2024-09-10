-- See https://medium.com/@vishalbarvaliya/left-join-vs-not-exists-vs-not-in-in-sql-filtering-data-with-no-matching-records-3da633b63b71
CREATE TABLE STUDENTS (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO STUDENTS (student_id, name, age) VALUES
(1, 'Arjun', 21),
(2, 'Riya', 22),
(3, 'Kiran', 23),
(4, 'Sanjay', 21),
(5, 'Priya', 24);

CREATE TABLE COURSES (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id)
);

INSERT INTO COURSES (course_id, student_id, course_name) VALUES
(101, 1, 'Mathematics'),
(102, 3, 'Physics'),
(103, 2, 'Chemistry'),
(104, 4, 'Biology');


-- LEFT JOIN IS NULL
--  Situations where the `students` table is small or well-indexed.
SELECT s.name FROM students s
LEFT JOIN courses c ON s.student_id = c.student_id
WHERE c.student_id IS NULL;

-- NOT EXISTS
-- Typically performs better with large datasets, especially when there are many matches in the subquery.
-- The database can stop searching as soon as it finds a match, making it more efficient.
SELECT s.name FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM courses c
    WHERE c.student_id = s.student_id
);

-- NOT IN
-- Small datasets where `NULL` values are not present in the subquery.
SELECT name
FROM students
WHERE student_id NOT IN (
    SELECT student_id
    FROM courses
);