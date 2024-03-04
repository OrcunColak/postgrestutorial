-- See https://medium.com/deutsche-telekom-gurgaon/understanding-postgresqls-jsonb-0570489d620d
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  isbn VARCHAR(13) UNIQUE NOT NULL,
  title VARCHAR(255) NOT NULL,
  price DECIMAL(5,2),
  book_data JSONB,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO books (isbn, title, price, book_data, created_at, updated_at)
VALUES (
  '9780987654321',
  'Journey to the Center of the Earth',
  29.99,
  '{"book_id":"12345","title":"Journey to the Center of Earth","author":{"first_name":"Jules","last_name":"Verne","bio":"A novelist, poet, and a playwright known for adventure novels and his influence on the literary genre of science fiction."},"published_date":"1864-01-01","genres":["Adventure","Science Fiction"],"ratings":{"average_rating":4.5,"reviews":[{"reviewer":"John Doe","comment":"A thrilling journey!","stars":5},{"reviewer":"Jane Smith","comment":"A classic that never gets old.","stars":4}]},"availability":{"in_stock":true,"number_of_copies":12,"ebook_available":true,"audiobook_available":false},"price":{"paperback":7.99,"ebook":2.99}}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);
-- Extract field as jsonb : "Journey to the Center of Earth"
select book_data->'title' as book_title from books;

-- Extract field as string : Journey to the Center of Earth
select book_data->'title' as book_title from books;

-- Extracting from a nested JSON object as string: Jules
select book_data->'author'->>'first_name' as author_firstname from books;

-- Where conditions
select * from books where book_data->>'title' = 'Journey to the Center of the Earth';
select * from books where book_data->'author'->>'first_name' = 'Jules';
select * from books where jsonb_extract_path(book_data,'title')::text = '"Journey to the Center of the Earth"';
select * FROM books WHERE jsonb_extract_path(book_data, 'author', 'first_name')::text = '"Jules"';

-- Extracting value from an array of JSON object:
-- reviews is an array. Here we want all reviewer names
-- John Doe
-- Jane Smith
select jsonb_array_elements(book_data->'ratings'->'reviews')->>'reviewer' as reviewers from books b;

--@> contains
select * from books where book_data @> '{"title": "Journey to the Center of Earth"}';
select * from books where book_data @> '{"author": {"first_name": "Jules"}}';
select * from books where book_data->'author' @> '{"first_name": "Jules"}';

-- Conditions for Arrays check
-- Simple arrays of strings
select * from books where book_data->>'genres' like '%Adventure%';
select * from books where book_data @> '{"genres":["Adventure"]}';

-- Arrays with nested objects
select * from books where book_data @> '{"ratings": {"reviews": [{"reviewer":"John Doe"}]}}';
select * from books where book_data->'ratings'->'reviews' @> '[{"reviewer":"John Doe"}]';
select * from books where exists (select 1 from jsonb_array_elements(book_data->'ratings'->'reviews') as reviews where reviews->>'reviewer' like '%ohn Doe');
select * from books where exists (select 1 from jsonb_array_elements(book_data->'ratings'->'reviews') as reviews where reviews->>'reviewer' = 'John Doe');