-- https://medium.com/@anujkhandelwal0411/how-to-check-auto-vacuum-setting-and-check-fragmentation-on-table-a7873a5c8d65
select * from pgstattuple('emp');
-[ RECORD 1 ]------+-----------
table_len          | 3011772416
tuple_count        | 49000051
tuple_len          | 2673328232
tuple_percent      | 88.76
dead_tuple_count   | 1000000
dead_tuple_len     | 54555370
dead_tuple_percent | 1.81
free_space         | 1477064
free_percent       | 0.05

--Explanation of columns
--Column                Type         Description
--table_len             bigint       Physical relation length in bytes
--tuple_count           bigint       Number of live tuples
--tuple_len             bigint       Total length of live tuples in bytes
--tuple_percent         float8       Percentage of live tuples
--dead_tuple_count      bigint       Number of dead tuples
--dead_tuple_len        bigint       Total length of dead tuples in bytes
--dead_tuple_percent    float8       Percentage of dead tuples
--free_space bigint     Total        free space in bytes
--free_percent          float8       Percentage of free space