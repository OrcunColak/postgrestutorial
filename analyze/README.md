See https://towardsdev.com/how-to-boost-speed-of-queries-in-stored-procedures-by-huge-margin-in-postgresql-cdc1e9c62460

Postgres does not optimize its execution path based on new data inserted or updated in a procedure which leads to long
query times.

So after large number of inserts and updates, run ANALYZE, helping the query planner make informed decisions.

For example run

```
ANALYZE student;
```