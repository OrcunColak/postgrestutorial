-- The json_array constructor helps to build a JSON array using the provided values.
db1=> SELECT json_array(json_object('id':1), json_object('id':2));
        json_array
--------------------------
 [{"id" : 1}, {"id" : 2}]

--  We construct a JSON array using JSON objects.
 db1=> SELECT json_array('a', ARRAY[1,2,3], now(), json '{"id": 1}', null ABSENT ON null);
                           json_array
 --------------------------------------------------------------
  ["a", [1,2,3], "2024-01-12T23:32:16.35455+00:00", {"id": 1}]

