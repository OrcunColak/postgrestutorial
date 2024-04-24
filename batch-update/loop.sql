-- See https://medium.com/@siddarthpatil/strategies-for-efficiently-updating-millions-of-records-in-postgresql-46afe980cf6b
BEGIN; -- Start the transaction

DO $$
DECLARE
    batch_size INTEGER := 1000;
    offset INTEGER := 0;
BEGIN
    LOOP
        -- Perform batch update within the transaction
        UPDATE employees
        SET salary = 1
        WHERE employee_id = 1
        OFFSET offset
        LIMIT batch_size;

        -- Commit the changes made in each iteration
        COMMIT;

        offset := offset + batch_size;
        EXIT WHEN NOT FOUND;
    END LOOP;
EXCEPTION
    WHEN others THEN
        -- Rollback the transaction if any error occurs
        ROLLBACK;
        RAISE;
END $$;

COMMIT; -- Commit the transaction