var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');

//load express
var app = express();

//register ejs
app.set ("view engine", "ejs");

// register body parser
app.use (bodyParser.urlencoded({extended: true}) );

// register static folder 
app.use(express.static(__dirname + "/static"));


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


app.get("/", function(req, res){
 //console.log(req);
	var q = 'select count(*) cnt from users';
	connection.query(q,  function(err, result, fields) {
	  if (err) {
          res.send(`<b>Error:</b> ${err.sqlMessage} `);
    //Looks like unhandled exception exists the process  
	//	   throw err;
	     return;
	  }	   
//	  console.log(result);
      var cnt = result[0].cnt;
	  console.log(`User Count ${cnt}` );
      res.render("home", { count: cnt, count2: cnt+1});
	});
});

//Try SQL Error

app.get("/wrong", function(req, res){
 //console.log(req);
 //Try SQL Error
	var q = 'select count(*) cnt from users1';
	connection.query(q,  function(err, result, fields) {
	  if (err) {
          res.send(`<b>Error:</b> ${err.sqlMessage} `);
    //Looks like unhandled exception exists the process  
	//	   throw err;
	     return;
	  }	   
//	  console.log(result);
      var cnt = result[0].cnt;
	  console.log(`User Count ${cnt}` );
      res.render("home", { count: cnt, count2: cnt+1});
	});
});

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


app.listen(8080, function(){
    console.log("Server running on 8080!");
});