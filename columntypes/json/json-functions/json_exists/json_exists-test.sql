-- See https://medium.com/@atarax/simplify-json-data-handling-in-postgresql-with-json-query-json-exists-and-json-value-0572d840dc3e
-- The JSON_EXISTS() function can be used to check if certain data exists within your JSON structure. The function returns a Boolean value: true if the path expression matches any items, and false otherwise.
-- JSON_EXISTS (
-- context_item, path_expression
-- [ PASSING { value AS varname } [, ...]]
-- [{ TRUE | FALSE | UNKNOWN | ERROR } ON ERROR ]) → boolean

-- SQL/JSON path expression:
-- At the core, SQL/JSON path expressions function similarly to file system paths or XPath expressions for XML. It allows you to specify the location of data within a JSON structure using a combination of symbols and notation:

-- Dollar Sign ($): Represents the context item or the root of the JSON document you're querying. The first element of a path must always be $ .
-- Dot Notation (.): Used to access keys within JSON objects.
-- Bracket Notation ([ ]): Used to access elements within JSON arrays, either by index or by applying conditions.
-- Asterisk (*): Acts as a wildcard to select all elements of an array or all members of an object.
-- Filters and Predicates (?): Allow you to apply conditions to elements, enabling more complex queries.
-- For example, the path expression '$.product.features[*].rating' would navigate to the product object, access the features array within it, select all elements (*), and then retrieve the rating key from each features object.

-- ON ERROR Clause: Determines the function’s behavior when an error occurs during path expression evaluation. Options include:
-- ERROR: Throws an error
-- TRUE: Returns true.
-- FALSE: Returns false.
-- UNKNOWN: Returns an SQL NULL.


CREATE TABLE IF NOT EXISTS public.products (
 id integer NOT NULL,
 product_name varchar NOT NULL,
 data jsonb
 );

 INSERT INTO public.products (id, product_name, data)
 VALUES
  (1, 'iPhone 16', jsonb_build_object(
  'brand', 'Apple',
  'model', '16',
  'release_year', 2024,
  'specifications', jsonb_build_object(
   'screen_size', '6.7 inches',
   'processor', 'Apple A18 Bionic',
   'ram', '8 GB',
   'storage', '256 GB',
   'battery', '4500 mAh',
   'camera', jsonb_build_object(
    'rear', jsonb_build_array(
     jsonb_build_object('type', 'Wide', 'megapixels', 108),
     jsonb_build_object('type', 'Ultra-wide', 'megapixels', 12),
     jsonb_build_object('type', 'Telephoto', 'megapixels', 12)
    ),
    'front', jsonb_build_object('type', 'Wide', 'megapixels', 32)
   )
  ),
  'features', jsonb_build_array(
   '5G capable',
   'Water-resistant (IP68)',
   'Wireless charging',
   'Fast charging support',
   'Face ID',
   'ProMotion 120Hz display'
  ),
  'warranty', '2 years',
  'price', 1199.99
  )),
  (2, 'Macbook Pro 2023', jsonb_build_object(
   'brand', 'Apple',
   'model', 'Pro 2023',
   'release_year', 2023,
   'specifications', jsonb_build_object(
    'screen_size', '15.6 inches',
    'processor', 'M3 pro',
    'ram', '16 GB',
    'storage', '512 GB SSD',
    'graphics_card', 'M3 pro',
    'battery', 'Up to 14 hours'
   ),
   'features', jsonb_build_array(
    'Backlit keyboard',
    'Fingerprint reader',
    'Thunderbolt 4 ports',
    'Retina display'
   ),
   'warranty', '1 year',
   'price', 1499.99
  )),
  (3, 'Sony Headphones Pro', jsonb_build_object(
   'brand', 'AudioSound',
   'model', 'Sony WH-CH720n',
   'release_year', 2021,
   'specifications', jsonb_build_object(
    'connectivity', 'Bluetooth 5.0',
    'battery_life', '35 hours',
    'driver_size', '40mm',
    'weight', '250 grams'
   ),
   'features', jsonb_build_array(
    'Active noise cancellation',
    'Button controls',
    'Voice assistant integration',
    'Water-resistant design'
   ),
   'warranty', '1 year',
   'price', 299.99
  ));

-- Search for products with Wireless charging
SELECT
  product_name,
  JSON_EXISTS(
    data,
    'strict $.features[*] ? (@ == $feature)'
    PASSING 'Wireless charging' AS feature
  ) AS has_wireless_charging
FROM products;

-- Querying an invalid path expression (With ERROR ON ERROR)
SELECT
  product_name,
  JSON_EXISTS(
    data,
    'strict $.specifications.resale_value'
    ERROR ON ERROR
  ) AS resale_value
FROM products;

-- Querying an invalid path expression (With FALSE ON ERROR)
SELECT
  product_name,
  JSON_EXISTS(
    data,
    'strict $.specifications.resale_value'
    FALSE ON ERROR
  ) AS resale_value
FROM products;