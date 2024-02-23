-- https://medium.com/@anujkhandelwal0411/how-to-check-auto-vacuum-setting-and-check-fragmentation-on-table-a7873a5c8d65
select name, setting,unit from pg_settings where name like '%autovacuum%';

--                name                 |  setting  | unit
---------------------------------------+-----------+------
-- autovacuum                          | on        |
-- autovacuum_analyze_scale_factor     | 0.1       |
-- autovacuum_analyze_threshold        | 50        |
-- autovacuum_freeze_max_age           | 200000000 |
-- autovacuum_max_workers              | 3         |
-- autovacuum_multixact_freeze_max_age | 400000000 |
-- autovacuum_naptime                  | 60        | s
-- autovacuum_vacuum_cost_delay        | 2         | ms
-- autovacuum_vacuum_cost_limit        | -1        |
-- autovacuum_vacuum_scale_factor      | 0.2       |
-- autovacuum_vacuum_threshold         | 50        |
-- autovacuum_work_mem                 | -1        | kB
-- log_autovacuum_min_duration         | -1        | ms
--(13 rows)