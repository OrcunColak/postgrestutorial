-- Find Dead rows

SELECT
    schemaname,
    relname,
    n_dead_tup,
    DATE_TRUNC('minute', last_vacuum) last_vacuum,
    DATE_TRUNC('minute', last_autovacuum) last_autovacuum
FROM pg_stat_all_tables
WHERE schemaname = 'bookings'
ORDER BY n_dead_tup desc;

-- Then
VACUUM TABLE_NAME