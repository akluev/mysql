/*
 Prevent inserting hotmail accounts into users table
*/

delimiter //

drop  trigger if exists trg_users_bi
//

create  trigger  trg_users_bi 
before insert on join_us.users for each row
begin
 declare err_msg varchar(255);
 -- new trigger 
  if new.email like '%@hotmail.com' then
  set err_msg := concat('E-mail ', new.email, ' cannot be registred because it belongs to hotmail.com domain');
  signal sqlstate '45000' 
   set message_text = err_msg; 
 end if;
end;
//



delimiter ;

