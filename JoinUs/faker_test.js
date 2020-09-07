// Check if faker is installed 
var faker = require('faker');



//generate data 

var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}


console.log(data);

