-- See https://readmedium.com/select-from-table-to-json-31e1a97c58f2
-- Sets a JSONB value at a specified path.

-- Table creation
CREATE TABLE my_table (
    id SERIAL PRIMARY KEY,
    data JSONB
);

-- Inserting a row with a JSONB value
INSERT INTO my_table (data) VALUES ('{"info": {"person": {"name": "John", "age": 25}}}');

-- Updating the age using jsonb_set
UPDATE my_table
SET data = jsonb_set(data, '{info, person, age}', '30'::jsonb)
WHERE id = 1;

-----------------------------
-- input
-- [{"src": 1, "type": "revive", "position": "center_left"}]

-- add append
UPDATE promotion_banners
SET items = items || '{"status": 1}'::jsonb
WHERE id = 2;

-- result
--[{"src": 1, "type": "revive", "position": "center_left"}, {"status": 1}]


-- OR add append after index 2
UPDATE promotion_banners
SET items = jsonb_set(items, '{2}', '{"status":1}'::jsonb, true)
WHERE id = 3;

-- result
-- [{"src": 1, "type": "revive", "position": "center_left"}, {"status": 1}]

-------------------
--input
--[{"src": 1, "type": "revive", "position": "center_left"}, {"src": 2, "type": "revive", "position": "center_right"}]

--OR add append new Element between Old Value json
UPDATE promotion_banners
SET items = (
    SELECT jsonb_agg(
                   jsonb_set(
                           elem,
                           '{status}',
                           '1',
                           true
                   )
           )
    FROM jsonb_array_elements(items) AS elem
);

--result
--[{"src": 1, "type": "revive", "status": 1, "position": "center_left"}, {"src": 2, "type": "revive", "status": 1, "position": "center_right"}]