var mysql = require('mysql');
var faker = require('faker');


var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'join_us'
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

/*
desc users 
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| email      | varchar(255) | NO   | PRI | NULL              |                   |
| created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+------------+--------------+------+-----+-------------------+-------------------+
*/

var person = {};
person.email = faker.internet.email();

var q = 'insert into users set ?';
var sql_stmt;
  
connection.query(q, person,  function(err, result, fields) {
console.log(`insert email ${person.email}`);
  if (err) throw err;
  console.log(result);
});

// Two fields 

person.email = faker.internet.email();
person.created_at = faker.date.past();


sql_stmt = connection.query(q, person,  function(err, result, fields) {
  console.log(`insert email ${person.email} and bd ${person.created_at} `);
  if (err) throw err;
  console.log(result);
});

console.log ("Generated SQL statement 1 is:"+sql_stmt.sql);

//Values 


 q = 'insert into users (email, created_at ) values ( ? ) ';

person.email = faker.internet.email();
person.created_at = faker.date.past();
 
sql_stmt = connection.query(q, [[ person.email, person.created_at]] ,  function(err, result, fields) {
console.log(`insert VALUES email ${person.email} and bd ${person.created_at}`);
  if (err) throw err;
  console.log(result);
});

console.log ("Generated SQL statement 2 is:"+sql_stmt.sql);


 q = 'insert into users (email, created_at ) values  ?  ';

person.email = faker.internet.email();
person.created_at = faker.date.past();
 
sql_stmt = connection.query(q, [[[ person.email, person.created_at]]] ,  function(err, result, fields) {
console.log(`insert VALUES email ${person.email} and bd ${person.created_at}`);
  if (err) throw err;
  console.log(result);
});

console.log ("Generated SQL statement 3 is:"+sql_stmt.sql);

/// Disconnect 

connection.end( function(err) {
  if (err) throw err;
  console.log("Disconnected!");
});


