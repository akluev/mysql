
/* analog of Oracle SQL%rowcount */
SELECT * FROM T1; 

 set @nrows :=0;
 
 delete from t1 where f1 != 'q';
 
 GET DIAGNOSTICS @nrows = ROW_COUNT;

select @nrows rows1;

 INSERT INTO t1 (f1) VALUES('1adasdasd'), ('1sadasdasdasdasd');
  
  -- Check whether the insert was successful
GET DIAGNOSTICS @nrows = ROW_COUNT;

select @nrows rows2;

TRUNCATE TABLE T1;

GET DIAGNOSTICS @nrows = ROW_COUNT;

select @nrows rows3;

