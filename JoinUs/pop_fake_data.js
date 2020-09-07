var mysql = require('mysql');
var faker = require('faker');


//Populate fake data
/*

Nore that 
	INSERT INTO users (email, created_at) VALUES ?'
Inserts all rows in data 

But
	INSERT INTO users (email, created_at) VALUES (?)

Inserts only one EVEN THOUGH 500 records were passed 

*/
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



var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}

//  console.log(data);

//Values ?

var q = 'INSERT INTO users (email, created_at) VALUES ?';

var sql_stmt = connection.query(q, [data], function(err, result) {
  if (err) throw err;
  console.log(result);
});

//Values (?)

data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}

q = 'INSERT INTO users (email, created_at) VALUES (?)';

sql_stmt = connection.query(q, data, function(err, result) {
  if (err) throw err;
  console.log(result);
});

connection.end( function(err) {
//shows statement 
  console.log ("Generated SQL statement  is:\n"+sql_stmt.sql);
  if (err) throw err;
  console.log("Disconnected!");
});

