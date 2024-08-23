See https://medium.com/safetycultureengineering/solving-latency-spikes-locking-in-a-distributed-postgresql-query-91991764e1de

Advisory locks are not system imposed locks and are locks that an application or database user makes use of directly.

```
-- Acquire an advisory lock
SELECT pg_advisory_lock(12345);

-- Perform some operation that should be synchronized
-- For example, update a shared resource
UPDATE shared_table SET value = value + 1 WHERE id = 1;

-- Release the advisory lock
SELECT pg_advisory_unlock(12345);
```