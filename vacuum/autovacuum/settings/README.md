**autovacuum_vacuum_scale_factor (floating point)**   
“ Specifies a fraction of the table size to add to autovacuum_vacuum_threshold when deciding whether to trigger a VACUUM.   
The default is **0.2** (20% of table size).  
This parameter can only be set in the **postgresql.conf** file or on the server command line; but the setting can be overridden for individual tables by changing table storage parameters”.

**autovacuum_analyze_threshold (integer)**   
“Specifies the minimum number of inserted, updated or deleted tuples needed to trigger an ANALYZE in any one table.   
The default is **50** tuples.   
This parameter can only be set in the **postgresql.conf** file or on the server command line; but the setting can be overridden for individual tables by changing table storage parameters.”