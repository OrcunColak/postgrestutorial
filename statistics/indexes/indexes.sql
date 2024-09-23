-- Unused indexes may lead to a higher number of operations. Database needs to update the table and also to update all the indexes.
-- You can see how indexes are used with the following query:

SELECT
    idstat.relname AS table_name,
    indexrelname AS index_name,
    idstat.idx_scan AS index_scans_count,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size,
    tabstat.idx_scan AS table_reads_index_count,
    tabstat.seq_scan AS table_reads_seq_count,
    tabstat.seq_scan + tabstat.idx_scan AS table_reads_count,
    n_tup_upd + n_tup_ins + n_tup_del AS table_writes_count,
    pg_size_pretty(pg_relation_size(idstat.relid)) AS table_size
FROM pg_stat_user_indexes AS idstat
JOIN pg_indexes ON idstat.indexrelname = pg_indexes.indexname AND idstat.schemaname = pg_indexes.schemaname
JOIN pg_stat_user_tables AS tabstat ON idstat.relid = tabstat.relid
WHERE indexdef !~* 'unique'
ORDER BY idstat.idx_scan DESC, pg_relation_size(indexrelid) DESC

--You may need to clear history of index usage to get meaningful results in case an index was used before but isn’t anymore. You can do that with the following query:

SELECT pg_stat_reset()