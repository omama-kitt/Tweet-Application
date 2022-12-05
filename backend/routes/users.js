var express = require('express');
var router = express.Router();
const db = require("../config/dbconfig");
const orderBy=require("lodash/orderBy");
/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});


/////////////////////////////////////////////////////////////////////////////////
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "tweetapplication"
});

//con = require('./connection');


router.post("/adduser",function(request, response){

  var id =request.body.id;
  var Username =request.body.Username;
  var Fullname =request.body.Fullname;
  var Birthday =request.body.Birthday;
  var Password =request.body.Password;
  var Address =request.body.Address;

  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "INSERT INTO users (id,Username,Fullname,Birthday,Password,Address) VALUES ('"+id+"', '"+Username+"','"+Fullname+"','"+Birthday+"','"+Password+"','"+Address+"')";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("user added successfulley");
      response.send({"result":"user added successfulley"});
    });
  });
});
//////////////////////////////////////////////////////////////////////////
module.exports = router;
