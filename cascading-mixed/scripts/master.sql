CREATE USER 'secondary1' @'%' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT REPLICATION SLAVE ON *.* TO 'secondary1' @'%';