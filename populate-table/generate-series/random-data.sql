CREATE TABLE emp (
  emp_id SERIAL PRIMARY KEY,
  emp_name VARCHAR(50),
  emp_salary DECIMAL(10, 2)
);

-- 50 million
INSERT INTO emp (emp_name, emp_salary)
  SELECT
  'Employee ' || CAST(generate_series AS VARCHAR),
   CAST(RANDOM() * 100000 AS DECIMAL(10, 2)) AS emp_salary
FROM generate_series(1, 50000000);