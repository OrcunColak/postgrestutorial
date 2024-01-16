create database shipments;

\c shipments;

CREATE TABLE deliveries (
    id UUID PRIMARY KEY,
    customer_id UUID,
    sender_name VARCHAR(255),
    sender_phone VARCHAR(20),
    origin_address VARCHAR(255),
    origin_city VARCHAR(100),
    origin_state VARCHAR(50),
    destination_address VARCHAR(255),
    destination_city VARCHAR(100),
    destination_state VARCHAR(50),
    recipient_name VARCHAR(255),
    recipient_phone VARCHAR(20),
    weight int,
    height int,
    width int,
    length int,
    fee MONEY,
    created_at TIMESTAMP
);

insert into deliveries (id, customer_id, sender_name, sender_phone, origin_address, origin_city, origin_state, destination_address, destination_city, destination_state, recipient_name, recipient_phone, weight, height, width, length, fee, created_at) values ('ac964a41-0ed4-4b95-b68c-5a2a78352f27', 'a29df28a-974d-4df6-ba02-3f773bf37439', 'Kaylyn Heinzler', '+1 619 819 2131', '40 Bonner Plaza', 'San Diego', 'California', '0 Katie Alley', 'Saint Petersburg', 'Florida', 'Frasquito McCullum', '+1 727 218 8520', 52, 39, 50, 42, '$26.52', '2023-01-03 18:21:50');
insert into deliveries (id, customer_id, sender_name, sender_phone, origin_address, origin_city, origin_state, destination_address, destination_city, destination_state, recipient_name, recipient_phone, weight, height, width, length, fee, created_at) values ('8a617852-3b69-4519-b426-0edc0ee894b3', 'b1ec3a8d-9d7e-404b-8cc6-22e6c874dc1c', 'Diannne Ruston', '+1 801 924 8311', '4 Esch Avenue', 'Ogden', 'Utah', '6117 Southridge Street', 'Sacramento', 'California', 'Alfie Churchley', '+1 916 429 0359', 64, 34, 29, 44, '$83.75', '2023-01-17 18:13:14');
