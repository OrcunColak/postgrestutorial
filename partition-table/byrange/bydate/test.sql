-- See https://ishansoninitj.medium.com/postgres-partitioning-and-spring-data-jpa-d71a19331643
create table security_prices (
 id varchar(255),
 security_id varchar(255),
 price numeric,
 business_date date,
 PRIMARY KEY (id, business_date)
) partition by range (business_date);

-- Create partitioned tables. In postgres, this has to be done manually :(
-- Range (Inclusive, Exclusive)
create table security_prices_march_2024 partition of security_prices for values from ('2024-03-01') to ('2024-04-01');
create table security_prices_april_2024 partition of security_prices for values from ('2024-04-01') to ('2024-05-01');
create table security_prices_may_2024 partition of security_prices for values from ('2024-05-01') to ('2024-06-01');

insert into security_prices (id, security_id, price, business_date) values
('1', 'IBM', 191.42, '2024-03-19'),
('2', 'MSFT', 419.27, '2024-03-19'),
('3', 'AAPL', 174.85, '2024-03-19'),
('4', 'AMZN', 175.29, '2024-03-19'),
('5', 'NVDA', 1000, '2024-04-01'),
('6', 'NVDA', 1050, '2024-05-01'),
('7', 'AMD', 200, '2024-04-15'),
('8', 'AMD', 215, '2024-05-15')
-- no partition of relation "security_prices" found for row
--('9', 'AMD', 215, '2024-07-15'),
;