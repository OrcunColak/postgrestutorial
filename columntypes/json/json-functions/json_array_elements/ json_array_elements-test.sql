-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Expands a JSON array to a set of JSON elements.

-- Sample table with a JSON array column
CREATE TABLE example_table (
    id serial PRIMARY KEY,
    data json
);

-- Inserting data with a JSON array
INSERT INTO example_table (data) VALUES
    ('{"numbers": [1, 2, 3]}'),
    ('{"numbers": [4, 5, 6]}');

-- Using json_array_elements to extract elements from the array
SELECT id, json_array_elements(data->'numbers') AS number
FROM example_table;