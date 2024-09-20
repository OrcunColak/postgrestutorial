CREATE TABLE words(name text);
INSERT INTO words VALUES ('Hour'), ('Island'), ('Knot'), ('Pneumonia'), ('Psychology'), ('Wrist');

-- sort  words based on pronunciation, we need to create a custom collation and configure the rules accordingly.
-- we stated that Is is less than Ho. This is due to the general English pronunciation where Island is pronounced as Iland and Hour as our.
CREATE COLLATION pronounce (provider = icu, locale = 'en', rules = '& Is < Kn < Pn < Ho < Wr < Ps');