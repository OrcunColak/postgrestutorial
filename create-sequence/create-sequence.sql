-- See https://kyle-evans.medium.com/designing-an-order-number-generation-system-in-spring-boot-4b05ee7916b4
CREATE SEQUENCE order_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE orders (
    order_id bigint NOT NULL DEFAULT nextval('order_id_seq'),
    order_data text
);