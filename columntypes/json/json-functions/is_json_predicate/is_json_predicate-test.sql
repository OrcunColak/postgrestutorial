-- This predicate checks if a given value is a valid JSON entity. With IS JSON, we can confirm that the input is one of the following: VALUE, SCALAR, OBJECT, or ARRAY.
-- Moreover, we can verify if the JSON has a UNIQUE key set or a non-`UNIQUE` key set.
-- returns t or f

-- Basic validation where we verify whether the given JSON is valid or not
db1=> SELECT ($$ {"name": "John Doe", "age": 30,"isMarried": true,"children": ["Jane", "Joe"]} $$::JSON IS JSON) as is_json;
 is_json
---------
 t

-- JSON VALUE
 db1=> SELECT ($${"name": "John Doe", "age": 30,"isMarried": true,"children": ["Jane", "Joe"]} $$::JSON)->'age' IS JSON VALUE as is_json;
  is_json
  ---------
  t

 -- JSON ARRAY
  db1=> SELECT ($${"name": "John Doe", "age": 30,"isMarried": true,"children": ["Jane", "Joe"]} $$::JSON)->'children' IS JSON ARRAY as is_json;
  is_json
  ---------
   t

--   JSON WITH UNIQUE KEYS
 db1=> SELECT $${"name": "John Doe", "age": 30,"isMarried": true,"children": ["Jane", "Joe"], "name": "James Doe"}$$::JSON IS JSON WITH UNIQUE KEYS as is_unique;
  is_unique
  -----------
  f