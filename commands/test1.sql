
create database test1;

use database test1;

select database();

create table t1
( 
 name varchar(100)
); 

insert into t1 (name)
values ('single quites') ;

insert into t1 (name)
values ("double quites") ;

insert into t1 (name)
values 
("single 'quote' inside double"), 
('double "quote" inside single'),
('single \'quote\' inside single'),
("double \"quote\" inside double")
 ;

select * from t1;

alter table t1 modify  name varchar (30);

-- value too big

insert into t1 (name)
values ("1234567890123456789012345678901") ;

/*
ERROR 1406 (22001): Data too long for column 'name' at row 1

mysql> show warnings;
+-------+------+------------------------------------------+
| Level | Code | Message                                  |
+-------+------+------------------------------------------+
| Error | 1406 | Data too long for column 'name' at row 1 |
+-------+------+------------------------------------------+

mysql> SELECT @@sql_mode;
+--------------------------------------------+
| @@sql_mode                                 |
+--------------------------------------------+
| STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION |
+--------------------------------------------+
1 row in set (0.00 sec)

*/

-- Insert Ignore - Truncares 

insert ignore into t1 (name) values ("1234567890123456789012345678901") ;

/*
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> show warnings;
+---------+------+-------------------------------------------+
| Level   | Code | Message                                   |
+---------+------+-------------------------------------------+
| Warning | 1265 | Data truncated for column 'name' at row 1 |
+---------+------+-------------------------------------------+
1 row in set (0.00 sec)

*/

--- Not null

alter table t1 modify  name varchar (30) not null;


/*
mysql> alter table t1 modify  name varchar (30) not null;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc t1
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(30) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> insert into t1 values ( null);
ERROR 1048 (23000): Column 'name' cannot be null
mysql> insert ignore into t1 values ( null);
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> show warnings;
+---------+------+------------------------------+
| Level   | Code | Message                      |
+---------+------+------------------------------+
| Warning | 1048 | Column 'name' cannot be null |
+---------+------+------------------------------+
1 row in set (0.00 sec)

*/

-- DEFAULT

alter table t1 modify  name varchar(30) not null default 'alex';


-- Primary KEY

alter table t1 add primary key (name);


---- Auto Inc 

CREATE TABLE cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) not null default 'Alex',
    age INT not null,
    PRIMARY KEY (cat_id)
);

OR

CREATE TABLE cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) not null default 'Alex',
    age INT not null
);

INSERT INTO cats2(name, age) VALUES('Skippy', 4);

--- 

CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100) , 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);  
  

-- Column Alias 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

SELECT name AS "cat name", breed AS "kitty breed" FROM cats;





--- String functions

--- concat 
SELECT
  CONCAT(author_fname, ' ', author_lname)
  AS 'full name',
  CONCAT_WS(' ', author_fname,  author_lname)
FROM books;


SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;

select reverse(12);

select substr(12+34, 1,2);

SELECT author_lname, CHAR_LENGTH(author_lname),  length(author_lname) FROM books;


INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
 
 
SELECT title FROM books;

--- Limit 

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 100,2;

-- LIKE is NOT Case Sensative
 
 SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';


SELECT title FROM books a WHERE title LIKE '%d%' order by a.author_fname limit 3;

SELECT title FROM books WHERE title LIKE '%\_%';

select count(pages) , a.author_lname, a.title from books a 
group by a.author_lname;

-- Date and Time

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
SELECT   a.* , a.birthdt +1  FROM people a order by birthdt desc;

-- sysdate

select curdate(), curtime(), now();

-- Date formating

 
 
 
SELECT name, 
birthdate, 
DAYNAME(birthdate) , 
DAY(birthdate),
DAYOFWEEK(birthdate),
DAYOFYEAR(birthdate),
MONTH(birthdt) ,
MONTHNAME(birthdt),
HOUR(birthtime) ,
1
FROM people;
 
 SELECT DATEDIFF(NOW(), birthdate) ,
 DATEDIFF( birthdate, NOW()) 
 FROM people;
 
SELECT name, birthdt, MONTH(birthdt) FROM people;
 
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
 
SELECT name, birthtime, HOUR(birthtime) FROM people;
 
SELECT name, birthtime, MINUTE(birthtime) FROM people;
 
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

select current_timestamp(), now();

-- Operators

select * from people p where p.birthdt > '1900-01-01' ;

select cast('2000-01-01'  as datetime);

select p.*, cast(p.birthtime as datetime) + interval 1 day from people p ;

SELECT CAST('2017-05-02' AS DATETIME);

-- --- Joins


SELECT first_name, last_name, order_date, amount 
FROM customers
left outer JOIN orders
ON customers.id = orders.customer_id;

SELECT IFNULL(NULL, 25);

SELECT 
    first_name, 
    -- last_name,
    SUM(IFNULL(amount, 0)) AS total_spent
FROM customers
LEFT outer JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

use ig_clone;

select now() as sysdate;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

flush privileges;

select 1=0 f,  1=1 t 1=null n ;

create table t1 ( f1 text(4000));

create table t2( f1 text);

insert into t1 set f1='qwert';


select * from t1;

select count(*) from users;

delete from users;

insert into t1
SELECT length(LPAD('hi',4001, 'xx'));


insert into t1
SELECT LPAD('hi',4001, 'alex ');

select t1.*, length(f1), substr(f1, -10) from t1;

select binary ("alex");

 insert into users set `email` = 'E11114@gmail.com', `created_at` = '2020-08-30 19:38:27.004';
 
 create table `table  with space`
 ( `col with space` int);
 
 select * from `table  with space`;
 
 drop table t1;

create table t1
( f1 varchar(255) primary key,
  f2 varchar(255) unique key 
 );
 
 insert into t1 values ("a", "a");
 
 insert into t1 values ("A", "b");

 insert into t1 values ("b", "A");

 insert into t1 values ("b", "b");

select * from users where email like 'akluev%hotmail.com';

select * from t1; 

show triggers;

select * from mysql.triggers;

insert into users (email) values ('a@.b.com');

-- Bind 
set @num_users := 0;

select @num_users;

select count(*) into @num_users from users;

select @num_users;

# sysdate() vs. now()

SELECT NOW(), SLEEP(2), NOW();

SELECT SYSDATE(), SLEEP(2), SYSDATE();


-- dictionary 
select 'a'='A' ;

SELECT name, schema_id, hidden, type FROM mysql.tables;

SELECT * FROM INFORMATION_SCHEMA.SCHEMATA;

SELECT * FROM INFORMATION_SCHEMA.tables where table_schema = 'INFORMATION_SCHEMA';

SELECT * FROM INFORMATION_SCHEMA.triggers t  where t.EVENT_OBJECT_SCHEMA = database() ; 

SELECT * FROM INFORMATION_SCHEMA.COLLATIONS;

-- now vs sysdate 
SELECT NOW(), SLEEP(2), NOW();

SELECT SYSDATE(), SLEEP(2), SYSDATE();