/*
Use collate to define string comparison 
*/
drop table if exists t1;

create table if not exists t1
( f1 varchar(255) primary key,
  f2 varchar(255) unique key 
 );
 
 insert into t1 values ("a", "a");

-- match 
select * from t1 where f1 like 'A%';

-- CS no match 
select * from t1 where f1 COLLATE utf8mb4_0900_as_cs like 'A%';

-- CI match 
select * from t1 where f1 COLLATE utf8mb4_0900_as_ci like 'A%';

-- BIN no match 
select * from t1 where f1 COLLATE utf8mb4_bin like 'A%';

/*
 Diffrent rules for two columns :) 
 */ 

drop  table if  exists t2;


create table if not exists t2
( f1 varchar(255) COLLATE utf8mb4_0900_as_cs primary key,
  f2 varchar(255) COLLATE utf8mb4_0900_as_ci unique key 
 );

 insert into t2 values ("a", "a");

select * from t2 where f1 like 'A%';

select * from t2 where f2 like 'A%';
