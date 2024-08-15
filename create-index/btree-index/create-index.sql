-- See https://medium.com/@vedanshdwivedi0/understanding-indexes-in-postgresql-92e917d3136b
CREATE INDEX btree_index_name
ON your_table(your_column);

or

CREATE INDEX btree_index_name
ON your_table USING BTREE (your_column);