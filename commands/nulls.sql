drop  table if exists n1;

create table n1
 ( f1 varchar(100),
   cmt varchar(100)
 ); 

insert into n1 values ( '', 'emptry string'), ( null, 'NULL');

select * from n1; 

select * from n1 where f1 is null;
 
select * from n1 where f1 = "";

select * from n1 where ifnull(f1,"") = "";

