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