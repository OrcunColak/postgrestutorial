-- See https://blog.devgenius.io/mastering-postgresql-essential-best-practices-for-optimal-performance-bbe43c7cd580
-- Create the users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

-- Insert some sample data
INSERT INTO users (first_name, last_name, email)
VALUES
    ('Ahmet', 'Yılmaz', 'ahmet.yilmaz@example.com'),
    ('Ayşe', 'Kaya', 'ayse.kaya@example.com'),
    ('Mustafa', 'Demir', 'mustafa.demir@example.com'),
    ('Ahmet', 'Yılmaz', 'ahmet.yilmaz2@example.com'),
    ('Ayşe', 'Kaya', 'ayse.kaya2@example.com'),
    ('Mustafa', 'Demir', 'mustafa.demir2@example.com');

   CREATE INDEX idx_users_turkish_search
      ON users USING gin(to_tsvector('turkish', first_name || ' ' || last_name));


SELECT *
FROM users
WHERE to_tsvector('turkish', first_name || ' ' || last_name) @@ to_tsquery('turkish', 'Ahmet');