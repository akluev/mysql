/*
Looks like  data dictionary views equivalent to are ALL_TABLES,  ALL_VIEWS and etc. listed  in  INFORMATION_SCHEMA.tables
*/

SELECT * FROM INFORMATION_SCHEMA.tables where table_schema = 'INFORMATION_SCHEMA';

 select * from INFORMATION_SCHEMA.ROUTINES; 
 
 select * from INFORMATION_SCHEMA.parameters; 
 
 /*
 For example this show  all triggers in the current database
 */
 SELECT * FROM INFORMATION_SCHEMA.triggers t  where t.EVENT_OBJECT_SCHEMA = database() ;