DROP PROCEDURE IF EXISTS set_as_master;

DELIMITER $$
CREATE PROCEDURE set_as_primary ()
BEGIN
    SET @@GLOBAL.group_replication_bootstrap_group = ON;
    CREATE USER IF NOT EXISTS 'repl'@'%';
    GRANT REPLICATION SLAVE ON *.* TO repl@'%';
    FLUSH PRIVILEGES;
    CHANGE REPLICATION SOURCE TO master_user='repl' FOR CHANNEL 'group_replication_recovery';
    START GROUP_REPLICATION;
    -- SELECT * FROM performance_schema.replication_group_members;
END $$
DELIMITER ;