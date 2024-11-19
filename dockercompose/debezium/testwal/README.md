Create a replication slot for testing:

```
SELECT * FROM pg_create_logical_replication_slot('test_slot_1', 'test_decoding');
```

Insert data into a test table:

```
CREATE TABLE wal_test (id SERIAL PRIMARY KEY, data TEXT);
INSERT INTO wal_test (data) VALUES ('test1'), ('test2'), ('test3');
```

Verify WAL activity by querying the replication slot:

```
SELECT * FROM pg_logical_slot_get_changes('test_slot_1', NULL, NULL, 'include-xids', '0');
```

Run again and you should see empty result set

```
SELECT * FROM pg_logical_slot_get_changes('test_slot_1', NULL, NULL, 'include-xids', '0');
```