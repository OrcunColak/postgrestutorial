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
('Johnny', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

CREATE INDEX idx_user_search ON users USING gin(to_tsvector('english', first_name));

-- Returns John and Johnny
SELECT * FROM users WHERE to_tsvector('english', first_name) @@ to_tsquery('english', 'John:*');
