CREATE USER 'secondary2' @'%' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT REPLICATION SLAVE ON *.* TO 'secondary2' @'%';