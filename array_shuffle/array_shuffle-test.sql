-- it randomly shuffles the elements within an array.
db1=> SELECT array_shuffle(ARRAY[1,NULL,2]);
 array_shuffle
---------------
 {1,2,NULL}

db1=> SELECT array_shuffle(ARRAY[1,NULL,2]);
 array_shuffle
---------------
 {2,NULL,1}

 db1=> SELECT array_shuffle(ARRAY[ARRAY[1,2,3], ARRAY[4,5,6]]);
    array_shuffle
 -------------------
  {{4,5,6},{1,2,3}}

  db1=> SELECT array_shuffle(ARRAY[ARRAY[1,2,3], ARRAY[4,5,6]]);
     array_shuffle
  -------------------
   {{1,2,3},{4,5,6}}