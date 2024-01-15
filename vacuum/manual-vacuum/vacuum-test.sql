-- https://firattamur.medium.com/dead-tuples-in-focus-enhancing-postgresql-performance-94ebbd4b96c9
CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY,name TEXT NOT NULL) with (autovacuum_enabled = false);

INSERT INTO users (name) SELECT md5(random()::text) FROM generate_series(1, 100000);

-- Gives 0 dead tuples
SELECT relname, n_dead_tup FROM pg_stat_user_tables WHERE relname = 'users';

DELETE FROM users WHERE id % 10 = 0;

-- Gives some dead tuples
SELECT relname, n_dead_tup FROM pg_stat_user_tables WHERE relname = 'users';

VACUUM users;

-- Gives 0 dead tuples
SELECT relname, n_dead_tup FROM pg_stat_user_tables WHERE relname = 'users';
