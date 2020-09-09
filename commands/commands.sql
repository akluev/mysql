--- start/stop

-- The best approach on Windows to start/stop the service:

net start MySQL80
net stop MySQL80


"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"  "-uroot" "-p" 

-- start as "NT AUTHORITY\NetworkService"
cannot see C:/Program Files/MySQL/MySQL Server 8.0/DATA
C:\Program Files\MySQL\MySQL Server 8.0\Data

"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqld.exe" --defaults-file="C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" MySQL80

-- Database 

show databases;

create database  <db_name>

drop database [if exists ] <db_name>

use  <db_name>

select database();

-- Datatypes

INT
FLOAT
VARCHAR - up to 255
CHAR

-- Tables

show tables;
show columns from <tablename>;
desc <tablename>;
drop table <tablename>;

-- Insert
--just like in Oracle

--Multiple Insert 

INSERT INTO table_name 
            (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);
			
--Quotes 

-- Support both single and double quotes
	
"This text has \"quotes\" in it" or 
'This text has \'quotes\' in it' or	
"This text has 'quotes' in it" or 
'This text has "quotes" in it'


--- Warnings 

--- Strict mode
https://stackoverflow.com/questions/18459184/mysql-too-long-varchar-truncation-error-setting


show warnings;


--- set sql_mode='';