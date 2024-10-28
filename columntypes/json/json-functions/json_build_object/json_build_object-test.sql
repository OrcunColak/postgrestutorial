-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Constructs a JSON object dynamically by specifying key-value pairs.
select json_build_object(
   'first_name', first_name,
   'last_name', last_name,
   'age',age,
   'address',address
) as student_details from students;