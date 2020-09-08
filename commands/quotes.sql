-- quotes in data 
drop  table if exists t3;
 
create table t3
( 
 name varchar(100)
); 

insert into t3 (name)
values ('single quites') ;

insert into t3 (name)
values ("double quites") ;

insert into t3 (name)
values 
("single 'quote' inside double"), 
('double "quote" inside single'),
('single \'quote\' inside single'),
("double \"quote\" inside double")
 ;

select * from t3;

-- metadata quotes

 drop table if exists `table  with space`;


 create table if not exists `table  with space`
 ( `col with space` varchar(100));
 
 insert into `table  with space` ( `col with space`)
 select name  from t3;

select distinct `col with space`  from  `table  with space`;

