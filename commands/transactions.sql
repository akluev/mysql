
/* Autocommt */ 

-- Disable 
SET autocommit=0;

select * from t1;

insert into t1 values ('c', 'c');

/* from the other session the same insert - wait */ 

commit;

/*
the other session 
ERROR 1062 (23000): Duplicate entry 'c' for key 't1.PRIMARY'
*/

SET autocommit=1;

insert into t1 values ('d', 'd');

/* visible from the other session right away */

START TRANSACTION;

insert into t1 values ('e', 'e');
/* the other session waits */ 

rollback;
