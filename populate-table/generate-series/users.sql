-- See https://medium.com/@mahmoud.mehisen/optimizing-data-retrieval-in-spring-boot-with-jpa-projection-a-practical-guide-39d62d099ba3
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(15),
    country VARCHAR(50),
    registration_date DATE
);

INSERT INTO users (id, first_name, last_name, email, phone_number, address, city, state, postal_code, country, registration_date)
SELECT
    gs AS id,
    'First Name ' || gs AS first_name,
    'Last Name ' || gs AS last_name,
    'email' || gs || '@example.com' AS email,
    '123-456-7890' AS phone_number,
    '123 Address St' AS address,
    CASE
        WHEN random() < 0.25 THEN 'Cairo'
        WHEN random() < 0.5 THEN 'Alexandria'
        WHEN random() < 0.75 THEN 'Luxor'
        ELSE 'Aswan'
    END AS city,
    'State ' || gs AS state,
    '12345' AS postal_code,
    'Egypt' AS country,
    CURRENT_DATE AS registration_date
FROM generate_series(1, 10000000) AS gs;