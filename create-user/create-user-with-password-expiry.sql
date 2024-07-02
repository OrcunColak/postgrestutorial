-- See https://medium.com/towardsdev/how-to-set-user-password-expiry-in-postgresql-857c22d74915?source=explore---------0-83--------------------ff6c45d1_7646_4f55_ac88_219a37b3215c-------15
CREATE ROLE test PASSWORD '******' VALID UNTIL '2024-05-24 00:00:00+00';

alter user test VALID UNTIL '2024-05-29';