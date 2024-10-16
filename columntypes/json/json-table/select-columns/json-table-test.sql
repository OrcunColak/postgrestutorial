-- See https://medium.com/@atarax/finally-json-table-is-here-postgres-17-a9b5245649bd
-- extract information from the JSON structure in the data column of the products table:
-- JSON_TABLE(data, ‘$’ …) : This specifies that we are querying the entire data JSON object.
-- COLUMNS clause: extract as given tpe
-- There are other intricacies like using
--   PASSING parameters to filter the JSON_TABLE at the time of creation and get relevant rows only,
--   NESTED PATH for populating certain rows and normalizing the table.
SELECT jt.*
FROM public.products,
     JSON_TABLE(
         data,
         '$'
         COLUMNS (
             brand text PATH '$.brand',
             model text PATH '$.model',
             release_year integer PATH '$.release_year',
             specifications jsonb PATH '$.specifications',
             features jsonb PATH '$.features',
             warranty text PATH '$.warranty',
             price numeric PATH '$.price'
         )
     ) AS jt;