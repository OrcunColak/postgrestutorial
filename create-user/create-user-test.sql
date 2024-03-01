-- See https://blog.devgenius.io/mastering-postgresql-essential-best-practices-for-optimal-performance-bbe43c7cd580
CREATE ROLE app_user LOGIN PASSWORD 'your_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE users TO app_user;
GRANT ALL ON SCHEMA public TO app_user;