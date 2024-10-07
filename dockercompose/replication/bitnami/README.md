There are two main types of PostgreSQL replication:

1. Physical (or streaming) replication: This replicates the entire database cluster by copying the write-ahead log (WAL)
   files from the primary to the standby server in real time.
2. Logical replication: This replicates data at the table or database level, using a publish-subscribe model where
   subscribers can receive specific data changes from publishers.

Connect to master with
jdbc:postgresql://localhost:5432/
user : postgres
password : postgres

CREATE TABLE words(name text);
INSERT INTO words VALUES ('Hour'), ('Island'), ('Knot'), ('Pneumonia'), ('Psychology'), ('Wrist');