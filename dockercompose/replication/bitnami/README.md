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

# Logical replication

Logical Replication was introduced by Postgres 10.

- Logical replication (abbrev. LR) is a method of replicating data objects and their changes based on their replication
  identity (usually a primary key).
- The data format used in transmission is independent of database’s data storage format.
- LR events may not contain all columns of a row. 
- Handling WAL file discarding due to insufficient disk capacity is another crucial problem.