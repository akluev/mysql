# Leaning  MySQL 
This repository keeps track of my leaning of MySQL database.
The content is based on this Udemy course:  
[The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert](https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/ "The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert")

and   [MySQL Reference Guide](https://dev.mysql.com/doc/refman/8.0/en "MySQL Reference Guide")

## Join US Application 

Node.js application I built as  part of the course ( useful if you plan to start your own cult)
I changed a lof of Javascript there, for example added **POST** handler:
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


## Difference with Oracle  

My notes how NySQL is different from Oracle

#*commands*  folder
MySQL concepts  I learned :)  One concept per file, for example:

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