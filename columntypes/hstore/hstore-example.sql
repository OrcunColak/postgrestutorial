-- https://medium.com/@dudkamv/nosql-capabilities-in-postgresql-9eec822886d9
-- HStore is a key-value store within PostgreSQL, allowing it to handle schema-less data.

CREATE EXTENSION IF NOT EXISTS hstore;

CREATE TABLE products (
    id serial PRIMARY KEY,
    name text,
    attributes hstore
);

INSERT INTO products (name, attributes)
VALUES ('Smartphone', 'color=>"black", storage=>"64GB"');

SELECT name FROM products WHERE attributes @> 'storage=>"64GB"';