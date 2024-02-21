-- https://levelup.gitconnected.com/auto-vacuuming-in-postgresql-e13b89d28a34
create TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY,name TEXT NOT NULL);

-- one hundred thousand
insert into users (name) select md5(random()::text) FROM generate_series(1, 100000);

-- n_dead_tup is 0, last_vacuum and last_autovacuum is null
select
    relname,
    n_dead_tup,
    last_vacuum,
    last_autovacuum
from pg_stat_all_tables
where schemaname = 'public'
order by n_dead_tup desc;

-- Auto-vacuum should be triggered after
--50 + 0.2*100000 = 20050 dead tuples are created.

DELETE FROM users WHERE id IN (SELECT id FROM users LIMIT 20050);
DELETE FROM users WHERE id IN (SELECT id FROM users LIMIT 20050);

-- n_dead_tup is 0, last_vacuum is null, last_autovacuum is 2024-02-21 11:42:47.140 +0300
select
    relname,
    n_dead_tup,
    last_vacuum,
    last_autovacuum
from pg_stat_all_tables
where schemaname = 'public'
order by n_dead_tup desc;
