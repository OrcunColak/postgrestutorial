-- See https://medium.com/@vedanshdwivedi0/understanding-indexes-in-postgresql-92e917d3136b
-- Block Range Index is called BRIN index.
CREATE INDEX brin_index_name
ON your_table USING BRIN (your_column);