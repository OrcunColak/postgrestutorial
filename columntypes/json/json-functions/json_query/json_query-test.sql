-- See https://medium.com/@atarax/simplify-json-data-handling-in-postgresql-with-json-query-json-exists-and-json-value-0572d840dc3e
-- The JSON_QUERY() function extracts JSON data from a JSON document based on a specified path expression.
-- It is designed to retrieve objects or arrays and returns the result as jsonb by default, though you can specify a different return type using the RETURNING clause.

--JSON_QUERY (
--context_item, path_expression
--[ PASSING { value AS varname } [, ...]]
--[ RETURNING data_type [ FORMAT JSON [ ENCODING UTF8 ] ] ]
--[ { WITHOUT | WITH { CONDITIONAL | [UNCONDITIONAL] } } [ ARRAY ] WRAPPER ]
--[ { KEEP | OMIT } QUOTES [ ON SCALAR STRING ] ]
--[ { ERROR | NULL | EMPTY { [ ARRAY ] | OBJECT } | DEFAULT expression } ON EMPTY ]
--[ { ERROR | NULL | EMPTY { [ ARRAY ] | OBJECT } | DEFAULT expression } ON ERROR ]) → jsonb

--RETURNING Clause: Specifies the data type of the result. If not specified, the result is returned as jsonb.
--Wrapper Options:
--— WITHOUT WRAPPER: Returns the result as it is. If multiple values are returned and this option is specified, an error will occur because the result won’t be valid JSON.
--— WITH WRAPPER: Wraps the result in a JSON array or object to ensure it’s valid JSON.
--— WITH CONDITIONAL WRAPPER: Wraps the result only if multiple values are returned.
--— WITH UNCONDITIONAL WRAPPER: Always wraps the result, even if only a single value is returned.
--Quotes Handling:
--— KEEP QUOTES: Retains quotes around scalar strings, ensuring they remain valid JSON strings.
--— OMIT QUOTES: Removes quotes from scalar strings. This option cannot be used with WITH WRAPPER to maintain JSON validity.
--ON EMPTY: Specifies what to return if the path expression yields no results. Options include ERROR, NULL, EMPTY ARRAY, EMPTY OBJECT, or a DEFAULT expression.
--ON ERROR: Specifies what to return if an error occurs during evaluation. Options are similar to ON EMPTY.

--Retrieve the features array for products with exactly 4 features (wrapped in an array)
 SELECT
  product_name,
  JSON_QUERY(
    data,
    'strict $.features'
    WITH WRAPPER
  ) AS features_list
FROM products
WHERE
  JSONB_ARRAY_LENGTH(JSON_QUERY(data, 'lax $.features')) = 4;

-- Retrieve the features array for products with exactly 4 features (not wrapped in an array)
SELECT
  product_name,
  JSON_QUERY(
    data,
    'strict $.features'
    WITHOUT WRAPPER
  ) AS features_list
  FROM products
  WHERE
    JSONB_ARRAY_LENGTH(JSON_QUERY(data, 'lax $.features')) = 4;

-- KEEP QUOTE vs OMIT QUOTE
SELECT
JSON_QUERY(jsonb '{"a": "[1, 2]"}', 'strict $.a' OMIT QUOTES) AS omit_quotes,
JSON_QUERY(jsonb '{"a": "[1, 2]"}', 'strict $.a' KEEP QUOTES) AS keep_quotes;
Output: