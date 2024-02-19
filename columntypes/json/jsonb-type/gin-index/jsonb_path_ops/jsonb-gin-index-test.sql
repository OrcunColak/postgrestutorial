CREATE TABLE sample_jsonb (
  id serial NOT NULL PRIMARY KEY,
  data jsonb
);

--A set of GIN-specific operators that can be used in a query depends on the operator class specified at index creation.
--For JSONB, supported classes are:
--
--jsonb_ops — the default operator class, which provides two categories of operators:
--checking the existence of keys and checking the existence of values based on JSONPath expressions or key-value pairs.

--jsonb_path_ops — provides only the latter category and offers better performance for these operators.

CREATE INDEX sample_jsonb_path_ops_idx ON sample_jsonb USING GIN (data jsonb_path_ops);

INSERT INTO sample_jsonb (data) VALUES ('{"name": "First", "count": 12, "orderDate": "2022-03-03T12:14:01", "extra": "some text"}');
INSERT INTO sample_jsonb (data) values ('{"name": "Second", "count": 23, "orderDate": "2022-04-03T15:17:01"}');

-- @> is contains operator
-- select all rows where the name property is equal to "First" a

SELECT * FROM sample_jsonb WHERE data @> '{"name":"First"}'::jsonb

-- @@ is full text search operator
-- select all rows where count is greater than 15
SELECT * FROM sample_jsonb WHERE data @@ '$.count > 15'

