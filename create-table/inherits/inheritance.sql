-- See https://ishansoninitj.medium.com/postgres-partitioning-and-spring-data-jpa-d71a19331643
create table cities (
 name varchar(100),
 country_iso_code varchar(10),
 population bigserial,
 primary key (name)
);

create table capitals (
 -- You can define additional columns here if you want to
) inherits (cities);

insert into cities (name, country_iso_code, population) values
('Pune', 'IN', 3124458),
('Almaty', 'KZ', 1977011);


insert into capitals (name, country_iso_code, population) values
('New Delhi', 'IN', 10927986),
('Bangkok', 'TH', 5104476),
('Stockholm', 'SE', 1515017),
('Washington, D.C.', 'US', 689545);

-- A select * from cities returns data from all tables (base + inherited).
explain select * from cities