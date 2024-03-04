-- https://medium.com/@suffyan.asad1/an-introduction-to-working-with-json-data-in-postgresql-730aa889c5d3
create TABLE sales.sales_order_detail_demo (
	product_details jsonb NULL
);

insert into sales_order_detail_demo (product_details) values ('{
	"color": "Black",
	"list_price": 1349.6,
	"product_id": 745,
	"product_name": "HL Mountain Frame - Black, 48",
	"safety_stock": {
		"reorder_point": 375,
		"safety_stock_level": 500
	},
	"size_and_weight": ["48", "2.80"]
}')

-- 1. Select field
-- The -> operator pulls the value out as JSON (json if the field is of json type, jsonb if the field is of jsonb type),
-- whereas the ->> operator gets it as text:
-- select as Json object
select product_details -> 'color' as colorjson from sales_order_detail_demo;

-- select as text
select product_details ->> 'color' as color from sales_order_detail_demo;

-- 2. Select array field
select product_details -> 'size_and_weight' as size_and_weight_json, product_details ->> 'size_and_weight' as size_and_weight_txt
from sales_order_detail_demo;

-- json_agg : This function aggregates JSON values into a JSON array
-- Yani tek json nesnesi yerine json array döndürür
-- https://medium.com/@gunjit29/postgresql-and-json-lets-learn-how-to-use-json-data-in-postgresql-bf2431588406
SELECT json_agg(product_details) FROM sales_order_detail_demo;

-- jsonb_set : This function updates a JSON object field with a new value.
UPDATE sales_order_detail_demo SET product_details = jsonb_set(product_details, '{list_price}', '0.0')

-- JSONB_BUILD_OBJECT : JSONB_BUILD_OBJECT function converts a plain text record to JSON data.
-- https://medium.com/@gunjit29/postgresql-and-json-lets-learn-how-to-use-json-data-in-postgresql-bf2431588406
INSERT INTO sales_order_detail_demo (product_details) VALUES(JSONB_BUILD_OBJECT('Tired','Everybody is annoying today', 'Hungry','Cannot wait to go home'));

