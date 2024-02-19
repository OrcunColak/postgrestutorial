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