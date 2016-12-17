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
      
      var status = 'Status Check:\n';
      
      ctx.storage.get(function (error, data) {
        if (error) return cb(error);
      
        if(params.indexOf("all") > -1){
          Object.keys(data).forEach(function(key,index) {
            status += data[key]
          });
        }else{
          params.forEach(function(entry) {
            if(data.hasOwnProperty(entry)){  
              status += data[entry]
            }else{
              status += entry + " não identificado\n";
            }
          });
        }
    
        cb(null, {
          response_type: 'in_channel', // uncomment to have the response visible to everyone on the channel
          text: status,
        });
      });
    });
  }
};

function update_status(ctx) {
  console.log("Updating Status");
  
  var urls = {
    guaracrm_prd: 'https://guaracrm.com.br',
    guaracrm_stg: 'https://staging.guaracrm.com.br',
    f2f_unicef: 'http://unicef.byside.trackmobfr.com.br',
    f2f_irm: 'http://mcdonalds.byside.trackmobfr.com.br',
    f2f_aldeias: 'http://aldeias.appco.trackmobfr.com.br',
    f2f_posithivo: 'http://posithivo.trackmobfr.com.br',
    f2f_msf: 'http://msf.trackmobfr.com.br',
    f2f_habitat: 'http://habitat.trackmobfr.com.br'
  }
  
  ctx.storage.set({}, { force: 1 }, function (error) {});
  
  var keys = Object.keys(urls);
  var data = {};
  checkURL(ctx, data, urls, keys);
  
  return;
}

function checkURL(ctx, data, urls, keys){
  var request = require('request');
  
  var key = keys.shift();
  request.get({
      url : urls[key],
      time : true
  },function(error, response){
    var status = key + ": ";
    if (!error && response.statusCode == 200) {
      status +=  "OK";
    }else{
      status += "ERROR"
    }
    status += " in " + response.elapsedTime + " ms\n";
    console.log(status);
    data[key] = status;
    if(keys.length){
      checkURL(ctx, data, urls, keys);
    }else{
      console.log(data);
      ctx.storage.set(data, { force: 1 }, function (error) {});
    }
  });
}