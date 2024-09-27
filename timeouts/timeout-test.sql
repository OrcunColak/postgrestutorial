-- See https://demirhuseyinn-94.medium.com/postgresql-configuration-chronicles-optimizing-timeout-settings-for-performance-excellence-b5ef1efd12be
select name,setting from pg_settings where name like '%timeout%';
                name                 | setting
-------------------------------------+---------
 archive_timeout                     | 0
 authentication_timeout              | 60
 checkpoint_timeout                  | 300
 deadlock_timeout                    | 1000
 idle_in_transaction_session_timeout | 0
 idle_session_timeout                | 0
 lock_timeout                        | 0
 statement_timeout                   | 0
 tcp_user_timeout                    | 0
 wal_receiver_timeout                | 60000
 wal_sender_timeout                  | 60000

 authentication_timeout :
 Defines the duration, in seconds, after which a client connection attempt will be terminated if authentication is not completed.
 It prevents idle connections from consuming server resources unnecessarily and helps mitigate certain types of denial-of-service attacks.

 deadlock_timeout :
 Specifies the duration, in milliseconds, for which a session will wait before giving up on resolving a deadlock situation.
 Deadlocks occur when two or more transactions are mutually blocked, and this parameter helps PostgreSQL to automatically break such deadlocks after
 the specified timeout.

 idle_in_transaction_session_timeout :
 Sets the maximum duration, in milliseconds, that an open transaction can remain idle before PostgreSQL automatically terminates the session to free up
 resources. This parameter helps prevent long-lived idle transactions from holding locks and impacting concurrency.

 idle_session_timeout :
 Defines the maximum duration, in seconds, that an idle session can persist before PostgreSQL terminates it to reclaim system resources.
 It helps manage the number of concurrent connections and prevents resources from being tied up by inactive sessions.

 lock_timeout:
 Specifies the maximum duration, in milliseconds, that a session will wait to acquire a lock on a resource before PostgreSQL raises an error and
 aborts the transaction. It helps prevent long waits for locks, which can lead to performance degradation and deadlock situations.

 statement_timeout:
 Sets the maximum duration, in milliseconds, that a single SQL statement can execute before PostgreSQL cancels its execution. It prevents runaway
 queries from monopolizing server resources and impacting the responsiveness of other sessions.

 tcp_user_timeout:
 Defines the timeout, in milliseconds, for idle TCP connections. This parameter is relevant when PostgreSQL is communicating over TCP/IP connections,
 allowing the operating system to reclaim idle connections and manage network resources efficiently.