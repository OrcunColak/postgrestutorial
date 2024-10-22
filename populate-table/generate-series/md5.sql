CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY,name TEXT NOT NULL);

-- one hundred thousand
INSERT INTO users (name) SELECT md5(random()::text) FROM generate_series(1, 100000);