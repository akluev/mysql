# Learning  MySQL  and Node.JS
This repository keeps track of my leaning of MySQL database and Node.JS.
The content is based on this Udemy course:  
[The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert](https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/ "The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert")

and   [MySQL Reference Guide](https://dev.mysql.com/doc/refman/8.0/en "MySQL Reference Guide")

## Join US Application 

This is a Node.js application that I built as  part of the course ( useful if you plan to start your own cult)
I changed a lot of JavaScript there, for example added **POST** handler:

```javascript
app.post("/register", function(req, res){
 //console.log("Request", req.body);
  var q="insert into users set ?";
  var newuser = {email: req.body.email};
  connection.query(q, newuser,  function(err, result, fields) {
  if (err) {
    console.log(`Registration Error for ${newuser.email}\n `, err);
	res.render("register_error" , {email : req.body.email, error: err});
	return 0;
  }
  res.render("register" , {email : req.body.email});
  console.log(`Registration Success for ${newuser.email}`);
 }); 
})

```
## Other scripts under [Join Us folder](https://github.com/akluev/mysql/tree/master/JoinUs "Join Us folder") 

-  Node.JS Hello World
- Exampe of mysql package usage
- Exanple of  faker package usage


## Differences between MySQL and  Oracle  

My notes how MySQL is different from Oracle

#commands  folder
MySQL concepts  I learned :)  One concept per file, for example, file [commands\bind_var.sql](https://github.com/akluev/mysql/blob/master/commands/bind_var.sql "commands\bind_var.sql") describes how to use bind variables: 

```sql
/*
Bind variable are prefixed by @
SELECT INTO … @bind_var does not have to be inside begin … end 
*/

set @num_users := 0;

select @num_users;

select count(*) into @num_users from users;

select @num_users;

```
