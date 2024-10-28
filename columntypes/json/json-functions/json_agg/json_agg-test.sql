-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Aggregates values into a JSON array.

select
    json_agg(address) as address
    from students
    group by(address);