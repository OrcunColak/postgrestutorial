-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Converts a PostgreSQL row into a JSON object.
-- When you want to represent a row of data as a JSON object.

SELECT row_to_json(s.*) as student_records FROM students as s;