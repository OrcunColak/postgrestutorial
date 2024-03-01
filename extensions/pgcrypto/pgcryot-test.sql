-- See https://blog.devgenius.io/mastering-postgresql-essential-best-practices-for-optimal-performance-bbe43c7cd580
-- Enable the pgcrypto extension if not already enabled
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

-- Insert data into the users table with a hashed email
INSERT INTO users (first_name, last_name, email)
VALUES
    ('John', 'Doe', crypt('john.doe@example.com', gen_salt('bf'))),
    ('Jane', 'Smith', crypt('jane.smith@example.com', gen_salt('bf')));

-- Check if an email exists in the users table
SELECT *
FROM users
WHERE crypt('jane.smith@example.com', email) = email;
