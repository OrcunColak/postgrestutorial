From https://medium.com/@raminorujov/flyway-9-and-postgresql-15-upgrade-troubleshooting-story-00f503acaff2

When CREATE/DROP INDEX CONCURRENTLY, is used, PostgreSQL will build the index without taking any locks that prevent
concurrent inserts, updates, or deletes on the table;
whereas a standard index build locks out writes (but not reads) on the table until it’s done.