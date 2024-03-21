-- See https://medium.com/@maheshshelke/setting-up-postgresql-server-in-docker-container-on-ubuntu-a-step-by-step-guide-f21f8973d6d7

CREATE DATABASE bettertrack;
CREATE ROLE stage LOGIN PASSWORD 'strongpassword';

-- Allows the stage role to connect to the bettertrack database.
GRANT CONNECT ON DATABASE bettertrack TO stage;

-- Permits the stage role to access the public schema, which is the default schema for most operations.
GRANT USAGE ON SCHEMA public TO stage;

-- Gives the stage role permission to read, create, modify, and delete records in all tables within the public schema.
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO stage;

--  Ensures that any future tables created within the public schema will automatically grant the specified privileges to the stage role.
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO stage;

--  Allows the stage role to use all sequences. Sequences are often used for generating unique identifiers for table rows.
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO stage;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO stage;

-- Gives the stage role the ability to create new tables or other objects within the public schema.
GRANT CREATE ON SCHEMA public TO stage;