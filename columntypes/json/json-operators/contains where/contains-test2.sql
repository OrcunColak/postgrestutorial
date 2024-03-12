-- https://medium.com/@dudkamv/nosql-capabilities-in-postgresql-9eec822886d9
CREATE TABLE users (
    id serial PRIMARY KEY,
    profile JSONB
);

SELECT profile->>'name' AS name FROM users WHERE profile @> '{"country": "USA"}';
