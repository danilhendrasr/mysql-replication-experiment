DROP PROCEDURE IF EXISTS set_as_slave;

DELIMITER $$
CREATE PROCEDURE set_as_slave ()
BEGIN
    CHANGE REPLICATION SOURCE TO master_user='repl' FOR CHANNEL 'group_replication_recovery';
    START GROUP_REPLICATION;
    SET @@global.read_only = 1;
    -- SELECT * FROM performance_schema.replication_group_members;
END $$
DELIMITER ;