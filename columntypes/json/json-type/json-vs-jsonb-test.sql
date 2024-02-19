select '{"a":1, "c": ["a","b","c"], "d":2, "b":false, "b":true}' :: json as ex1;
-- The data has remained the same, the order of the keys, and the fact that there are multiple values present for the same key made no difference.
--  {"a":1, "c": ["a","b","c"], "d":2, "b":false, "b":true}|

select '{"a":1, "c": ["a","b","c"], "d":2, "b":false, "b":true}' :: jsonb as ex1;
-- The keys have been re-arranged. The key b had two values, false and true. It has been collapsed to it last value i.e. true.
--{"a": 1, "b": true, "c": ["a", "b", "c"], "d": 2}|

