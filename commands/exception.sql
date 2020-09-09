/*
 Prevent inserting hotmail accounts into users table
*/

delimiter //

drop  procedure  if exists pne
//

-- NO HANDLER 

create procedure pne ( value int)
BEGIN
  -- Declare variables to hold diagnostics area information
  DECLARE code CHAR(5) DEFAULT '00000';
  DECLARE msg TEXT;
  DECLARE nrows INT;
  DECLARE result TEXT;
  -- No handler 
  -- Perform the insert
  INSERT INTO t1 (f1) VALUES(value);
  -- Check whether the insert was successful
    GET DIAGNOSTICS nrows = ROW_COUNT;
    SET result = CONCAT('insert succeeded, row count = ',nrows);
  -- Say what happened
  SELECT result;
END;
//

delimiter ;


--  call
call pne('8888');

call pne('asdasasd@hotmail.com');

-- continue handler 

delimiter //

drop procedure if exists pec 
//


create procedure pec ( value int)
BEGIN
  -- Declare variables to hold diagnostics area information
  DECLARE code CHAR(5) DEFAULT '00000';
  DECLARE msg TEXT;
  DECLARE nrows INT;
  DECLARE result TEXT;
  -- Declare exception handler for failed insert
  DECLARE  CONTINUE 
  HANDLER FOR SQLEXCEPTION
    BEGIN
      GET DIAGNOSTICS CONDITION 1
        code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
    END;
  -- Perform the insert
  INSERT INTO t1 (f1) VALUES(value);
  -- Check whether the insert was successful
  IF code = '00000' THEN
    GET DIAGNOSTICS nrows = ROW_COUNT;
    SET result = CONCAT('insert succeeded, row count = ',nrows);
  ELSE
    SET result = CONCAT('insert failed, error = ',code,', message = ',msg);
  END IF;
  -- Say what happened
  SELECT result;
END;
//

delimiter ;


desc t1;

call pec (12);

-- exit handler 


delimiter //

drop  procedure if exists pex
//


create procedure pex ( value int)
BEGIN
  -- Declare variables to hold diagnostics area information
  DECLARE code CHAR(5) DEFAULT '00000';
  DECLARE msg TEXT;
  DECLARE nrows INT;
  DECLARE result TEXT;
  -- Declare exception handler for failed insert
  DECLARE  exit 
  HANDLER FOR SQLEXCEPTION
    BEGIN
      GET DIAGNOSTICS CONDITION 1
        code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
       select concat( 'exiting with an error', msg) errmsg;
    END;
  -- Perform the insert
  INSERT INTO t1 (f1) VALUES(value);
  -- Check whether the insert was successful
  IF code = '00000' THEN
    GET DIAGNOSTICS nrows = ROW_COUNT;
    SET result = CONCAT('insert succeeded, row count = ',nrows);
  ELSE
    SET result = CONCAT('insert failed, error = ',code,', message = ',msg);
  END IF;
  -- Say what happened
  SELECT result;
END;
//

delimiter ;

call pex (18);

call pex (28);

select * from t1;