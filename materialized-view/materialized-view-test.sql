-- See https://medium.com/the-table-sql-and-devtalk/postgresql-materialized-views-a-beginners-guide-9a73b9d4d875

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    task_name VARCHAR(255),
    user_id INT REFERENCES users(user_id)
);

-- Insert some sample data
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO tasks (task_name, user_id) VALUES
('Task 1', 1),
('Task 2', 1),
('Task 3', 2);

-- Create MV
CREATE MATERIALIZED VIEW user_tasks_summary_mv AS
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(t.task_id) AS task_count
FROM
    users u
LEFT JOIN
    tasks t ON u.user_id = t.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name, u.email;

-- Select Mv but the
select * from user_tasks_summary_mv

-- Insert additional users
INSERT INTO users (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Williams', 'bob.williams@example.com'),
('Eva', 'Miller', 'eva.miller@example.com');

-- Insert additional tasks
INSERT INTO tasks (task_name, user_id) VALUES
('Task 4', 1),
('Task 5', 2),
('Task 6', 3),
('Task 7', 2),
('Task 8', 1);

-- We need to refresh the MV
REFRESH MATERIALIZED VIEW user_tasks_summary_mv;

-- Select MV after the refresh
select * from user_tasks_summary_mv

-- Drop the existing materialized view if it exists
DROP MATERIALIZED VIEW IF EXISTS user_tasks_summary_mv;

-- Create the materialized view with ORDER BY user_id
CREATE MATERIALIZED VIEW user_tasks_summary_mv AS
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(t.task_id) AS task_count
FROM
    users u
LEFT JOIN
    tasks t ON u.user_id = t.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY
    u.user_id;

-- Select MV after the ORDER BY
select * from user_tasks_summary_mv