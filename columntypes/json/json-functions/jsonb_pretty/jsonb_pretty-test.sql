-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Formats a JSONB value for human-readable display.

-- Table creation
CREATE TABLE my_table (
    id SERIAL PRIMARY KEY,
    data JSONB
);

-- Inserting a row with a JSONB value
INSERT INTO my_table (data) VALUES ('{"info": {"person": {"name": "John", "age": 25}}}');

SELECT id, jsonb_pretty(data) as pretty_data
FROM my_table;