-- @> is contains operator
-- select all rows where the name property is equal to "First" a

SELECT * FROM sample_jsonb WHERE data @> '{"name":"First"}'::jsonb
