-- https://medium.com/@dudkamv/nosql-capabilities-in-postgresql-9eec822886d9
CREATE TABLE users (
    id serial PRIMARY KEY,
    profile JSONB
);

-- This query extracts the email address from a nested contact object and filters users who have 'English' in their language preferences.
SELECT id, profile->'contact'->>'email' AS email FROM users WHERE profile->'preferences'->'languages' ? 'English';