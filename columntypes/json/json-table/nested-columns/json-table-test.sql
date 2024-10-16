-- See https://lazypro.medium.com/postgresql-17s-json-table-isn-t-particularly-powerful-f2531c9994ac

-- Use JSONB to find an order with an item by name
SELECT
  item->>'name' AS item_name,
  item->>'price' AS item_price,
  order_data -- whole order including Laptop
FROM
  orders,
  jsonb_array_elements(order_data->'items') AS item
WHERE
  item->>'name' = 'Laptop';

-- Use JSON_TABLE counterpart
SELECT
  jt.item_name,
  jt.item_price,
  order_data
FROM orders o,
  json_table(o.order_data, '$.items[*]'
  COLUMNS (
    item_name TEXT PATH '$.name',
    item_price NUMERIC PATH '$.price'
  )) AS jt
WHERE jt.item_name = 'Laptop';

-- Use JSONB to find an order with an item price less than 100
SELECT
  item->>'name' AS item_name,
  item->>'price' AS item_price,
  order_data
FROM
  orders,
  jsonb_array_elements(order_data->'items') AS item
WHERE
  (item->>'price')::numeric < 100;

-- Use JSON_TABLE counterpart
SELECT
  jt.item_name,
  jt.item_price,
  order_data
FROM orders o,
  json_table(o.order_data, '$.items[*]'
  COLUMNS (
    item_name TEXT PATH '$.name',
    item_price NUMERIC PATH '$.price'
  )) AS jt
WHERE jt.item_price < 100;