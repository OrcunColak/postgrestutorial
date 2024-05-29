CREATE SEQUENCE links_link_id_seq START WITH 100;

CREATE TABLE links(
   link_id integer NOT NULL DEFAULT nextval('links_link_id_seq'),
   link_key VARCHAR (10) NOT NULL,
   link VARCHAR (500) NOT NULL,
   click_count INT NOT NULL
);