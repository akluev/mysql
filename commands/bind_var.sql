set @num_users := 0;

select @num_users;

select count(*) into @num_users from users;

select @num_users;

