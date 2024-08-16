-- See https://medium.com/@tadeaspetak/explaining-indexes-in-postgres-93943621b0db
-- utility function for returning a random string of the given length
CREATE OR REPLACE FUNCTION random_string (string_length integer DEFAULT 10)
RETURNS varchar AS $$
  SELECT array_to_string(
    ARRAY(
      SELECT chr((65 + round(random() * 25))::integer)
      FROM generate_series(1, string_length)
    ), '') $$
LANGUAGE SQL;

-- create our sample users table
CREATE TABLE users (
  id serial PRIMARY KEY,
  email varchar NOT NULL,
  name varchar NOT NULL,
  about varchar
);

-- populate it with plenty of random data
INSERT INTO users (name, email, about)
SELECT
  'email-' || random_string (5),
  'name-' || random_string (5),
  'about-' || random_string (30)
FROM generate_series(1, 100000);