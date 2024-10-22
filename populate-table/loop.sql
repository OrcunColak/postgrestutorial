CREATE TABLE transactions (
  transaction_id serial PRIMARY KEY,
  user_id int NOT NULL,
  transaction_date date NOT NULL,
  amount decimal(10,2) NOT NULL
);

-- This script inserts 1 billion transaction records, simulating a real-world, large-scale database.
DO $$
BEGIN
    FOR i IN 1..1000000 LOOP
        INSERT INTO transactions (user_id, transaction_date, amount)
        SELECT
            trunc(random() * 10000 + 1),
            '2020-01-01'::date + trunc(random() * 1000),
            trunc(random() * 1000 + 1)::decimal(10,2)
        FROM generate_series(1, 1000);
    END LOOP;
END $$;