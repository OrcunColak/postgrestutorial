-- Outdated statistics can cause high CPU usage as well.
-- The query planner may generate non-efficient query plans that lead to much longer execution.
-- You can find tables that have outdated statistics with this query (change the schema name for your needs)
SELECT
    schemaname,
    relname,
    DATE_TRUNC('minute', last_analyze) last_analyze,
    DATE_TRUNC('minute', last_autoanalyze) last_autoanalyze
FROM pg_stat_all_tables
WHERE schemaname = 'bookings'
ORDER BY last_analyze DESC NULLS FIRST, last_autoanalyze DESC NULLS FIRST;

--You can update your statistics manually with this query:

ANALYZE TABLE_NAME