CREATE TABLE sample_jsonb (
  id serial NOT NULL PRIMARY KEY,
  data jsonb
);

-- Create an index named sample_jsonb_count_idx on the count property inside the data column.
-- The index is cast to an integer using ((data->'count')::int).
-- This would be useful for optimizing queries that involve searching or filtering based on the count property within the JSONB data.
CREATE INDEX sample_jsonb_count_idx ON sample_jsonb (((data->'count')::int));

INSERT INTO sample_jsonb (data) VALUES ('{"name": "First", "count": 12, "orderDate": "2022-03-03T12:14:01", "extra": "some text"}');
INSERT INTO sample_jsonb (data) values ('{"name": "Second", "count": 23, "orderDate": "2022-04-03T15:17:01"}');

SELECT data->>'name', data->>'orderDate' FROM sample_jsonb WHERE (data->'count')::int > 12

