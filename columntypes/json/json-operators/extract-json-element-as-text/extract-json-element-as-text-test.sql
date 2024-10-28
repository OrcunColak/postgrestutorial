-- See https://medium.com/@mohammad.roshandelpoor/the-power-of-jsonb-in-postgresql-c249d6fdef4b
-- ->>: Extracts a JSON element as text.

-- Select the 'name' field from the 'params' JSON column
SELECT params->>'name' FROM events;

-- Filter rows where the 'name' field in 'params' is 'Click Button'
SELECT * FROM events WHERE params->>'name' = 'Click Button';