-- See https://medium.com/the-table-sql-and-devtalk/exploring-postgresql-isnull-alternatives-a-quick-overview-77a626bded22
-- PostgreSQL doesn’t include the ISNULL function, common in other SQL dialects.
-- the COALESCE function returns the first non-NULL value from a list:
SELECT COALESCE(salary, 0) AS salary FROM employee;

--or
SELECT CASE WHEN salary IS NULL THEN 0 ELSE salary END AS salary
FROM employee;