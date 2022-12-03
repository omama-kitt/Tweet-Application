var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
/*
router.post("/adduser",function (request, response){
  console.log("data recive from client", request.body);
  const options = {
      // schema is not passed here since it has been passed while creating client
      table: 'users',
      records: [request.body],
    };
    db.insert(options, (err, res) => {
      if(err) {
          console.log("error in add user operation ",err);
          response.status(500).send({"error":err});
      }
      else {
          console.log(res);
          response.send({"result":"User added successfulley"});
      }
    });
});
*/
module.exports = router;
