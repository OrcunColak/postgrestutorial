-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Sets a JSONB value at a specified path.

-- Table creation
CREATE TABLE my_table (
    id SERIAL PRIMARY KEY,
    data JSONB
);

-- Inserting a row with a JSONB value
INSERT INTO my_table (data) VALUES ('{"info": {"person": {"name": "John", "age": 25}}}');

-- Updating the age using jsonb_set
UPDATE my_table
SET data = jsonb_set(data, '{info, person, age}', '30'::jsonb)
WHERE id = 1;