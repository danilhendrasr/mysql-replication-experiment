CREATE USER 'slave' @'%' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT REPLICATION SLAVE ON *.* TO 'slave' @'%';