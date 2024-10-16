-- See https://lazypro.medium.com/postgresql-17s-json-table-isn-t-particularly-powerful-f2531c9994ac

-- Use JSONB to find an order with an item by name
SELECT
  item->>'name' AS item_name,
  item->>'price' AS item_price,
  item->'details'->>'warranty' AS warranty
FROM
  orders,
  jsonb_array_elements(order_data->'order'->'items') AS item
WHERE
  item->'details'->>'color' = 'blue';

-- Use JSON_TABLE counterpart
SELECT
  jt.item_name,
  jt.item_price,
  jt.warranty
FROM orders o,
  json_table(o.order_data, '$.order.items[*]'
  COLUMNS (
    item_name TEXT PATH '$.name',
    item_price NUMERIC PATH '$.price',
    warranty TEXT PATH '$.details.warranty',
    color TEXT PATH '$.details.color'
  )) AS jt
WHERE jt.color = 'blue';
