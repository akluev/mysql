
/*
Different insert flavors
*/

DROP TABLE IF EXISTS cats; 

CREATE TABLE IF NOT EXISTS cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100) , 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 

/* Mulpiple  Rows */

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);  

/* Insert Set */

INSERT INTO cats set name='Pussy', breed='New';

select * from cats;

/*Insert Ignore */

-- This will fail 
INSERT INTO cats(cat_id, name, breed, age) 
VALUES (1, 'Ringo', 'Tabby', 4);


/*
Fails 
mysql> INSERT INTO cats(cat_id, name, breed, age) VALUES (1, 'Ringo', 'Tabby', 4);
ERROR 1062 (23000): Duplicate entry '1' for key 'cats.PRIMARY'
*/

-- This STILL Does not insert a row. but gives a warning, not error  
INSERT IGNORE INTO cats(cat_id, name, breed, age) 
VALUES (1, 'Ringo', 'Tabby', 4);

show warnings;


