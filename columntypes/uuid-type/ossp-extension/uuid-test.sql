-- https://medium.com/@sjksingh/postgresql-primary-key-dilemma-uuid-vs-bigint-52008685b744
-- Make sure the uuid-ossp extension is available
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- V1
-- Create a table with a UUID column using the uuid-ossp extension
CREATE TABLE uuid_osspv1_table (
    id UUID DEFAULT uuid_generate_v1mc() PRIMARY KEY,
    varchar_column VARCHAR(255)
);

-- Insert a row with a generated UUID
INSERT INTO uuid_osspv1_table (varchar_column) VALUES ('value1');

-- Query the table
SELECT * FROM uuid_osspv1_table;

-- V4
-- Create a table with a UUID column using the uuid-ossp extension
CREATE TABLE uuid_osspv4_table (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    varchar_column VARCHAR(255)
);

-- Insert a row with a generated UUID
INSERT INTO uuid_osspv4_table (varchar_column) VALUES ('value1');

-- Query the table
SELECT * FROM uuid_osspv4_table;


