-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Converts a PostgreSQL array into a JSON array.

CREATE TABLE sal_emp (
    name            text,
    pay_by_quarter  integer[],
    schedule        text[][]
);


-- Inserting records to table

INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"meeting", "lunch"}, {"training", "presentation"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');

select
  name,
  array_to_json(pay_by_quarter) as pay_by_quarter,
  array_to_json(schedule) as pay_by_quarter
from sal_emp;