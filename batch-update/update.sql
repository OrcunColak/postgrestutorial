-- See https://medium.com/@siddarthpatil/strategies-for-efficiently-updating-millions-of-records-in-postgresql-46afe980cf6b

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, salary)
VALUES (1, 50000.00),
       (2, 60000.00),
       (3, 70000.00);

-- The straightforward UPDATE statement is suitable for scenarios where the database is not heavily used for a set period,
-- such as during off-peak hours.
UPDATE employees SET salary = 9000 WHERE employee_id = 1;

-- Common Table Expressions allow for more complex update operations while maintaining readability.
-- They are particularly useful when updates depend on subqueries or multiple conditions.
WITH updated_rows AS (
    SELECT employee_id, salary * 2 as newsalary
    FROM employees
    WHERE employee_id = 1
)

UPDATE employees
  SET salary = updated_rows.newsalary FROM updated_rows
  WHERE employees.employee_id = updated_rows.employee_id;

