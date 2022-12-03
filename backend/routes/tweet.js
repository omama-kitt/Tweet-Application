const express = require('express');
const router = express.Router();
const db = require("../config/dbconfig");
const orderBy=require("lodash/orderBy");
router.post("/add",function (request, response){
    console.log("data recive from client", request.body);
    const options = {
        // schema is not passed here since it has been passed while creating client
        table: 'tweets',
        records: [request.body],
      };
      db.insert(options, (err, res) => {
        if(err) {
            console.log("error in insert operation ",err);
            response.status(500).send({"error":err});
        }
        else {
            console.log(res);
            response.send({"result":"Tweet added successfulley"});
        }
      });
});

router.get("/getAll",function (request, response){
    const options = {
        // schema is not passed here since it has been passed while creating client
        table: 'tweets',
        searchAttribute: "UserId",
        searchValue: "*",
        attributes: ['*'],
      };
      db.searchByValue(options, (err, res) => {
        if(err) {
            console.log("error occured while fetching data ",err);
            response.status(500).send({"Error": err});
        }
        else {
            console.log("result",res);
            const tweetsData = res.data;
            const sortedTweets = orderBy(tweetsData, ["__createdtime__"], [ 'desc']);
            response.send({result : sortedTweets});
        }
      });
   
});


module.exports = router;