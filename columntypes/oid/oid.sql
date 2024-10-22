-- See https://blog.devops.dev/how-to-remove-orphan-large-objects-in-postgresql-35d343bb069b
-- Binary Large Objects (BLOBS) in PostgreSQL should be removed using the lo_unlink() function.
-- Simply deleting the related row without calling lo_unlink() will leave orphaned records behind.
-- In such cases, vacuumlo can come to the rescue to clean up these orphaned large objects.

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