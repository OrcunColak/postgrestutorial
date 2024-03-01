-- See https://blog.devgenius.io/mastering-postgresql-essential-best-practices-for-optimal-performance-bbe43c7cd580
-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

-- Insert some sample data
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

-- Create or replace the function
CREATE OR REPLACE FUNCTION get_user_by_id(user_id INT) RETURNS SETOF users AS $$
  SELECT * FROM users WHERE user_id = $1;
$$ LANGUAGE SQL;

-- Call the function with user_id = 1
SELECT * FROM get_user_by_id(1);

DROP FUNCTION get_user_by_id;