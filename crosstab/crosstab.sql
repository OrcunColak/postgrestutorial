-- see https://medium.com/@deepika87k/crosstab-in-postgresql-a5bf563f5d22
-- See math, science, history grades for each student
SELECT *
FROM crosstab(
 'SELECT DISTINCT(student),subject,grade FROM custom_table ORDER BY student'
 ) as ct(student VARCHAR ,math CHAR ,science CHAR , history CHAR)

--------
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab(
  'SELECT product_id, month, sales FROM sales ORDER BY product_id, month',
  'SELECT DISTINCT month FROM sales ORDER BY month'
) AS ct (product_id int, "Jan" int, "Feb" int);

Output:
product_id  Jan     Feb
1           100     150
2           200     250