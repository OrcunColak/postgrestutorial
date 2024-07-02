# Read me

The original idea is from  
https://medium.com/@bumurzaqov2/data-synchronization-in-microservices-with-postgresql-debezium-and-nats-a-practical-guide-0953694b6c20

1. Start docker compose
2. Connect to postgres
3. Execute

```sql
CREATE TABLE accounts (
    user_id serial PRIMARY KEY,
    username VARCHAR ( 50 ) UNIQUE NOT NULL,
    password VARCHAR ( 50 ) NOT NULL,
    email VARCHAR ( 255 ) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
  last_login TIMESTAMP 
);
```

and then

```sql
INSERT INTO "public"."accounts" ("username", "password", "email", "created_on")
               VALUES ('user2', 'beseeingya', 'user2@email.com', NOW());
```