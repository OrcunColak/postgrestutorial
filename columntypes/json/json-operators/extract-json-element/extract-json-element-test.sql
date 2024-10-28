-- See https://medium.com/@mohammad.roshandelpoor/the-power-of-jsonb-in-postgresql-c249d6fdef4b
-- ->: Extracts a JSON element by key or array index.

-- Access the first element in the 'ids' array within 'params'
SELECT params->'ids'->0 FROM events;