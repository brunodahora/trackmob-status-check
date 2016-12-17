module.exports = function (ctx, cb) {
  var params = ["all"];
  if(ctx.body.text.trim()){
    params = ctx.body.text.split("  ");
  }
  
  if(params.indexOf("update") > -1){
    update_status(ctx);
    cb(null, {
      text: "Updating status",
    });
  }else{
    console.log("Returning status")
    ctx.storage.get(function (error, data) {
        console.log(data);
        if (error) return cb(error);
        cb(null, {
          response_type: 'in_channel', // uncomment to have the response visible to everyone on the channel
          text: data,
        });
    });
  }
};

function update_status(ctx) {
  var request = require('request');
  
  console.log("Updating Status");
  
  var urls = {
    guaracrm_prd: 'https://guaracrm.com.br',
    guaracrm_stg: 'https://staging.guaracrm.com.br'
  }

  var status = 'Status Check:\n';
  
  request.get({
    url : 'https://staging.guaracrm.com.br',
    time : true
  },function(error, response){
    status += "guaracrm-stg" + ": ";
    if (!error && response.statusCode == 200) {
      status +=  "OK";
    }else{
      status += "ERROR"
    }
    status += " em " + response.elapsedTime + " ms\n";
    console.log(status)
  
    ctx.storage.set(status, { force: 1 }, function (error) {});
  });
  
  return;
}