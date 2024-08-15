-- See https://medium.com/@vedanshdwivedi0/understanding-indexes-in-postgresql-92e917d3136b
-- GIN is a Generalised Inverted Index.
-- Used for documents and arrays
CREATE INDEX gin_index_name
ON your_table USING GIN (your_column);