-- See https://medium.com/@vedanshdwivedi0/understanding-indexes-in-postgresql-92e917d3136b
CREATE INDEX hash_index_name
ON your_table USING HASH (your_column);