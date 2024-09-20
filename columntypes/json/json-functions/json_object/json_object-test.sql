--  exclude products with a NULL price
db1=> SELECT json_object(product_name VALUE price ABSENT ON NULL) FROM goods LIMIT 3;
    json_object
--------------------
 {"Product #1" : 1}
 {"Product #2" : 2}
 {}

-- construct json object
db1=> SELECT json_object('id':1, 'nested':json_object('id':1));
            json_object
-----------------------------------
 {"id" : 1, "nested" : {"id" : 1}}
