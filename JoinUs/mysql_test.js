var mysql = require('mysql');


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

var q = 'select now() as sysdate';

connection.query(q,  function(err, result, fields) {
  if (err) throw err;
  console.log(result);
  console.log("sysdate", result[0].sysdate);
});

connection.end();