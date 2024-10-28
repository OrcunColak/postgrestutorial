-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Converts a PostgreSQL value into its corresponding JSON representation.
-- It is useful when you want to convert individual values (integers, strings, dates) into JSON format.

select
    to_json(first_name) as first_name,
from students;
