-- See https://medium.com/@vedanshdwivedi0/understanding-indexes-in-postgresql-92e917d3136b
-- Used for full text search
CREATE INDEX table_gist_index
ON tablename USING GIST (column_name);