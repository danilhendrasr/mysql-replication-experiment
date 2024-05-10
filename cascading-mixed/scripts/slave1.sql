CREATE USER 'slave2' @'%' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT REPLICATION SLAVE ON *.* TO 'slave2' @'%';