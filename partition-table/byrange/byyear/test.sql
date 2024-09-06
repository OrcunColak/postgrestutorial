-- Partition an existing table and drop the original table
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    date DATE,
    product VARCHAR(255),
    quantity INTEGER,
    price DECIMAL(10,2)
);


INSERT INTO sales (date, product, quantity, price) VALUES ('2022-01-15', 'Product A', 10, 25.50);
INSERT INTO sales (date, product, quantity, price) VALUES ('2023-01-20', 'Product B', 15, 30.75);
INSERT INTO sales (date, product, quantity, price) VALUES ('2024-02-05', 'Product A', 8, 22.80);
INSERT INTO sales (date, product, quantity, price) VALUES ('2025-02-10', 'Product C', 12, 18.90);
INSERT INTO sales (date, product, quantity, price) VALUES ('2026-03-08', 'Product B', 20, 35.25);


CREATE TABLE Sales_Partitioned (
    id SERIAL,
    date DATE,
    product VARCHAR(255),
    quantity INTEGER,
    price DECIMAL(10,2)
) PARTITION BY RANGE (EXTRACT(YEAR FROM date));

CREATE TABLE sales_2022 PARTITION OF Sales_Partitioned FOR VALUES FROM (2022) TO (2023);
CREATE TABLE sales_2023 PARTITION OF Sales_Partitioned FOR VALUES FROM (2023) TO (2024);
CREATE TABLE sales_2024 PARTITION OF Sales_Partitioned FOR VALUES FROM (2024) TO (2025);
CREATE TABLE sales_2025 PARTITION OF Sales_Partitioned FOR VALUES FROM (2025) TO (2026);
CREATE TABLE sales_2026 PARTITION OF Sales_Partitioned FOR VALUES FROM (2026) TO (2027);

INSERT INTO Sales_Partitioned SELECT * FROM Sales;

DROP TABLE sales;

select * from sales_partitioned


