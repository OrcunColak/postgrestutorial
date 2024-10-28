-- See https://levelup.gitconnected.com/offset-vs-cursor-pagination-essential-guide-for-backend-developers-f4d614a81a26
CREATE TABLE mytable (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
INSERT INTO mytable (name)
SELECT 'Name ' || gs
FROM generate_series(1, 11000000) AS gs;

-- offset examples
SELECT * FROM mytable WHERE name ILIKE '%name%' ORDER BY id ASC LIMIT 10 OFFSET 10000000;

SELECT * FROM mytable
ORDER BY id ASC
LIMIT 10 OFFSET (page_number - 1) * 10;

-- limit examples
SELECT * FROM mytable WHERE name ILIKE '%name%' AND id > 10000000 ORDER BY id ASC LIMIT 10;

SELECT * FROM mytable
WHERE (id, name) > (10000000, 'Name 9000000')
ORDER BY id ASC, name ASC
LIMIT 10;