/*
schema management 
*/

show databases;

create database if not exists test;

use test;

select database();

create table t1 
as
select * from join_us.t1;

select * from test.t1;
 
drop database if  exists test;

-- back 
use join_us ;

