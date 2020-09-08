/*
 Altering root user to use native password was required to work with mysql Node.js package
*/

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

flush privileges;
