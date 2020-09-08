delimiter //

drop  function if exists   hello//

create  function  hello ( p_name varchar(100))
returns varchar(100) deterministic 
begin
 return concat ('Hello ,',p_name, '!' );
end;//

delimiter ;

select t1.* , hello(t1.f1) from t1 ;


