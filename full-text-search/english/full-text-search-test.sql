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
-- Another way is
-- CREATE INDEX idx_user_search ON users USING gin(to_tsvector('english'::regconfig, first_name)) WHERE language = 'en';

-- :* operator enables prefix search. It can be useful to execute a full-text search while typing a word.
-- Returns John and Johnny. This is prefix search
SELECT * FROM users WHERE to_tsvector('english', first_name) @@ to_tsquery('english', 'John:*');

-- Show rank column too
SELECT
    *,
    ts_rank(to_tsvector('english', first_name), to_tsquery('english', 'John:*')) AS rank
FROM users
WHERE to_tsvector('english', first_name) @@ to_tsquery('english', 'John:*')
ORDER BY rank DESC;


-- Show rank column too. Use Common Table Expressions (CTEs)
WITH search_query AS (
    SELECT to_tsquery('english', 'John:*') AS query
)
SELECT
    users.*,
    ts_rank(to_tsvector('english', first_name), search_query.query) AS rank
FROM
    users,
    search_query
WHERE
    to_tsvector('english', first_name) @@ search_query.query
ORDER BY
    rank DESC;