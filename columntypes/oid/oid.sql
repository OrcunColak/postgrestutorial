-- See https://blog.devops.dev/how-to-remove-orphan-large-objects-in-postgresql-35d343bb069b

-- Create table to store large object references
CREATE TABLE files (id SERIAL PRIMARY KEY,filename TEXT, file_oid OID );

-- Insert a large object and get its OID
INSERT INTO files (filename, file_oid) VALUES ('insanedba.txt',lo_import('/Downloads/insanedba.txt'));

-- Retrieve the OID for deletion
SELECT file_oid FROM files WHERE filename = 'insanedba.txt';

-- The correct method for unlinking is shown, but we will not do it correctly, thus leaving orphaned large objects behind.
-- SELECT lo_unlink(19023);

-- Delete the record from the table
DELETE FROM files WHERE filename = 'insanedba.txt';

-- Then after some time delete orphan files
vacuumlo mydb -v