-- See https://towardsdev.com/how-to-build-a-postgresql-full-text-search-engine-in-any-language-60ec415f0b1d
-- trigram can speed up ilike query.
CREATE EXTENSION pg_trgm;

select show_trgm('fielded');
--                show_trgm
-----------------------------------------
-- {"  f"," fi",ded,"ed ",eld,fie,iel,lde}

-- Create a sample table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

-- Insert some sample data
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Williams', 'bob.williams@example.com');

-- Create a trigram index on the first_name column
CREATE INDEX idx_users_first_name_trigram ON users USING gin(first_name gin_trgm_ops);

-- Search for users whose first names contain 'jo' (case-insensitive)
SELECT * FROM users WHERE first_name ILIKE '%jo%';