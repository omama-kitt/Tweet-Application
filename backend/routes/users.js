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


//  Login.
router.post("/loginuser",function(request, response){

  var Username =request.body.Username;
  var Password =request.body.Password;

  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    con.query('SELECT * FROM users WHERE Username =? AND Password =?' , [Username, Password], function (err, result) {
      if (err) throw err;
      if(result && result.length){
      console.log("user is exist");
      response.send({result});
      }
      else {
        console.log("user not exist");
        response.send("user not exist");
      }
    });
  });
});

// Signup.
router.post("/adduser",function(request, response){

  var Username =request.body.Username;
  var Fullname =request.body.Fullname;
  var Birthday =request.body.Birthday;
  var Password =request.body.Password;
  var Address =request.body.Address;

  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "INSERT INTO users (Username,Fullname,Birthday,Password,Address) VALUES ( '"+Username+"','"+Fullname+"','"+Birthday+"','"+Password+"','"+Address+"')";
    con.query(sql, function (err,result) {
      if (err) throw err;
        console.log("user added successfulley");
        response.send({"result":"user added successfulley"});
    });
  });
});
//////////////////////////////////////////////////////////////////////////

// Retrieve tweet comments (use paging)
router.post("/Retweetscomment/:page/:limit",function (request, response){
  var UserId =request.body.UserId;
  var TweetID =request.body.TweetID;
  
  var page =request.params.page;
  var limit =request.params.limit;

  const startIndex = (page -1)* limit;
  const endIndex = page * limit;

  con.connect(function(err) {
    if (err) throw err;
    var sql = "SELECT * FROM comments WHERE UserId = '"+UserId+"' AND TweetID ='"+TweetID+"' ";
    con.query(sql, function (err, result) {
  /*   
      Object.keys(result).forEach(function(key) {
        var row = result[key];
        console.log(row.id)
        var sql = "SELECT * FROM comments WHERE id = '"+row.id+"'  ";
      });
   */   
      if (err) throw err;
      console.log("Retrieve all tweets successfulley");
      const resultusers = result.slice(startIndex , endIndex)
      response.json(resultusers)
      //response.send({result});
    });
  });
  
});
//Delete a tweet comment
router.delete("/deletecomment/:id/:TweetId/:UserId",function (request, response){

  var TweetId =request.params.TweetId;
  var UserId =request.params.UserId;
  var id =request.params.id;

  con.connect(function(err) {
    if (err) throw err;
    var sql = "DELETE FROM comments WHERE TweetId = '"+TweetId+"' AND UserId = '"+UserId+"' AND id = '"+id+"' ";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("comment delete successfulley ");
      response.send({"result":"comment delete successfulley"});
    });
  });
  
});

// . Comment on a tweet
router.post("/addcommentONtweet",function(request, response){

  var UserId =request.body.UserId;
  var Description =request.body.Description;
  var TweetId =request.body.TweetId;
  var Date =request.body.Date;
  console.log(TweetId);
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "INSERT INTO comments ( UserId,Description,TweetId,Date) VALUES ( '"+UserId+"','"+Description+"','"+TweetId+"','"+Date+"')";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Comment added successfulley");
      response.send({"result":"Comment added successfulley"});
    });
  });
});
module.exports = router;
