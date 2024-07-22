-- See https://medium.com/redis-with-raphael-de-lio/can-postgres-replace-redis-as-a-cache-f6cba13386dc
CREATE UNLOGGED TABLE cache (
    id serial PRIMARY KEY,
    key text UNIQUE NOT NULL,
    value jsonb,
    inserted_at timestamp);

CREATE INDEX idx_cache_key ON cache (key);