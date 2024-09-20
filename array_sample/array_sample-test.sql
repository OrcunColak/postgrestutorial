-- This particular function operates by randomly selecting a predetermined number of elements from an array.
-- The function accepts two arguments. The first argument that the function accepts is an array.
-- This array can be of any length, and it is from this array that the elements will be selected.
-- The second argument accepted by the function is an integer.
-- This integer represents the number of elements that the function will select from the array.

db1=> SELECT array_sample(ARRAY['head','tail',NULL], 1);
array_sample
-------------
{head}

db1=> SELECT array_sample(ARRAY['head','tail',NULL], 1);
array_sample
-------------
{tail}

db1=> SELECT array_sample( ARRAY[ARRAY['trail #1', 'head'], ARRAY['trail #2','tail']], 1);
array_sample
--------------------
{{"trail #1",head}}

db1=> SELECT array_sample( ARRAY[ARRAY['trail #1', 'head'], ARRAY['trail #2','tail']], 1);
array_sample
--------------------
{{"trail #2",tail}}