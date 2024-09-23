-- See https://medium.com/@adamf_64691/troubleshooting-postgresql-high-cpu-usage-part-2-8a1173739339

-- Number of connections
WITH connections AS (
    SELECT
     COUNT(*) AS total_connections,
     SUM(CASE WHEN state != 'idle' THEN 1 ELSE 0 END) AS non_idle_connections
    FROM pg_stat_activity
),
max_connections AS (
    SELECT setting AS max_connections
    FROM pg_settings
    WHERE name = 'max_connections'
)
SELECT
    C.total_connections,
    C.non_idle_connections,
    MC.max_connections,
    ROUND((100 * C.total_connections::NUMERIC / MC.max_connections::NUMERIC), 2) AS connections_utilization_percentage
FROM connections AS C
CROSS JOIN max_connections AS MC

-- Max connections
show max_connections;

-- Connections per database
SELECT
    datname AS database_name,
    COUNT(*) AS non_idle_connections
FROM pg_stat_activity
WHERE state != 'idle'
GROUP BY datname
ORDER BY 2

-- Connections and query per database
SELECT
    datname AS database_name,
    query,
    COUNT(*) AS non_idle_connections
FROM pg_stat_activity
WHERE state != 'idle'
GROUP BY datname, query
ORDER BY 3 DESC

-- Long running query
SELECT
    datname AS database_name,
    query,
    now() - query_start AS runtime
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY 3 DESC

-- Connections waiting for a lock
SELECT A.pid, A.query
FROM pg_stat_activity AS A
JOIN pg_locks AS L on L.pid = A.pid
WHERE L.granted = false
GROUP BY 1, 2

-- Queries that run often
SELECT SUBSTR(query, 1, 100) AS query, calls, total_exec_time, total_exec_time / calls AS call_time
FROM pg_stat_statements
ORDER BY 4 DESC

-- Long transactions
SELECT now() - xact_start AS transaction_time, query
FROM pg_stat_activity
WHERE state IN ('idle in transaction','active')
ORDER BY 1 DESC

