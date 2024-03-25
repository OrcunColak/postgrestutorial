See   
https://medium.com/@pawanpg0963/password-encryption-in-postgresql-61c9a19d693a

To see current encryption type

```sql
show password_encryption;
```

Output is

```
scram-sha-256
```

To change password encryption type

```sql
set password_encryption ='scram-sha-256';
```