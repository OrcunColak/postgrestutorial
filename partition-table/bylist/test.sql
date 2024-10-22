-- See https://ishansoninitj.medium.com/postgres-partitioning-and-spring-data-jpa-d71a19331643
create table orders (
 order_id varchar(255),
 user_id varchar(255),
 total numeric,
 order_items jsonb,
 status varchar(255),
 PRIMARY KEY (order_id, status), -- Include 'status' in the primary key
 UNIQUE (user_id, departments)  -- Include 'status' in the unique constraint
) partition by list (status);

create table active_orders partition of orders for values in ('CREATED', 'SHIPPED', 'DELIVERED', 'CANCELLED');

create table archived_orders partition of orders for values in ('ARCHIVED');

insert into orders values ('1', '1', 100, null, 'CREATED');
select * from orders;

update orders set status = 'ARCHIVED' where order_id = '1';