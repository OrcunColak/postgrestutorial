-- See https://medium.com/@atarax/simplify-json-data-handling-in-postgresql-with-json-query-json-exists-and-json-value-0572d840dc3e
-- The JSON_VALUE() function extracts a scalar value from a JSON document based on a specified path expression.
-- It is designed to retrieve single scalar values such as strings, numbers, or booleans.
-- If the path expression results in multiple values or a non-scalar value (like an array or object), the function will throw an error.

-- JSON_VALUE (
-- context_item, path_expression
-- [ PASSING { value AS varname } [, ...]]
-- [ RETURNING data_type ]
-- [ { ERROR | NULL | DEFAULT expression } ON EMPTY ]
-- [ { ERROR | NULL | DEFAULT expression } ON ERROR ]) → text

-- PASSING Clause: Allows you to pass external values into the path expression using variables. This makes your queries dynamic and adaptable.
-- RETURNING Clause: Allows you to specify the data type of the result (e.g., int, float, text). If not specified, the result is returned as text.
-- ON EMPTY: Specifies what to return if the path expression yields no results.
-- ON ERROR: Specifies what to return if an error occurs during evaluation.


-- Get release_year of all the products
SELECT
  product_name,
  JSON_VALUE(
    data,
    'strict $.release_year'
    RETURNING int
  ) AS release_year
FROM products;

-- Get processor for each product and return NULL for products that don’t have a processor

   SELECT
     product_name,
     JSON_VALUE(
       data,
       'strict $.specifications.processor'
       RETURNING text
       NULL ON ERROR
     ) AS processor
   FROM products;

--Retrieve all products with release_year > 2021
--Note: We can use JSON_VALUE() function in where clause to filter data.

SELECT
  product_name,
  JSON_VALUE(
    data,
    'strict $.release_year'
    RETURNING text
  ) AS release_year
FROM products
WHERE
  JSON_VALUE(
    data,
    'strict $.release_year'
    RETURNING numeric
    ERROR ON ERROR
  ) > 2021;