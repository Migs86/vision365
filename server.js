'use strict'

/*
|--------------------------------------------------------------------------
| Http server
|--------------------------------------------------------------------------
|
| This file bootstrap Adonisjs to start the HTTP server. You are free to
| customize the process of booting the http server.
|
| """ Loading ace commands """
|     At times you may want to load ace commands when starting the HTTP server.
|     Same can be done by chaining `loadCommands()` method after
|
| """ Preloading files """
|     Also you can preload files by calling `preLoad('path/to/file')` method.
|     Make sure to pass relative path from the project root.
*/

const { Ignitor } = require('@adonisjs/ignitor')

new Ignitor(require('@adonisjs/fold'))
  .appRoot(__dirname)
  .fireHttpServer()
  .catch(console.error)

var express = require ('express');
var mysql = require('mysql');
var app = express();

var connection = mysql.createConnection({
  host: 'mfdb.cy2bqoqlz5w5.ca-central-1.rds.amazonaws.com',
  user: 'admin',
  password: 'miksangflipman99',
  database: 'mydb'
});

connection.connect(function (error) {
  if (!!error) {
    console.log('Error 1');
  } else {
    console.log ('Connection successful');
  }
});

app.get('/test', function(req, res) {
  //about mySQL db
  connection.query("SELECT * FROM USERS", function (error, rows, fields){
    //callback
    if (!!error) {
      console.log('Error in query');
    } else {
      console.log('Query successful');
      console.log(rows);
      console.log(fields);
    }
  });
})

app.listen(1337);
