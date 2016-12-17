/*

Dear Developer,

Welcome to Slash Webtasks - slack slash commands powered by Auth0 Webtasks (https://webtask.io).

Implement the logic of your slash command in the function below.
Then save and run with '/wt {name} [{param} {param} ...]' from slack.

If your code needs secrets (e.g. Twilio keys), add them using the key icon on the right -------->
You can then get them from code via ctx.secrets, e.g. ctx.secrets.TWILIO_KEY.
Never add secrets to your code directly.

The payload you receive from slack is available in ctx.body and may look like this:

{
 "team_id": "T025590N6",
 "team_domain": "auth0",
 "channel_id": "D1KFTMMTJ",
 "channel_name": "directmessage",
 "user_id": "U02FMKT1L",
 "user_name": "tomek",
 "command": "/wt run hello",
 "text": "foo bar baz",
 "response_url": "https://hooks.slack.com/commands/T025540N6/86862216608/4DNA0LVn6QG7xqfBhGSTIqoc"
}

Note that ctx.body.text contains the parameters to the Slash Webtask you typed in slack, 
e.g. "foo bar baz" if you typed "/wt hello foo bar baz" in slack.
Details of the payload are documented at https://api.slack.com/slash-commands#triggering_a_command.

The object you respond with will be passed back to Slack as JSON. 
Details of the response payload are documented at https://api.slack.com/slash-commands#responding_to_a_command.

Please file issues at https://github.com/auth0/slash-webtask/issues.

Enjoy!

The Auth0 Webtask Team
webtask@auth0.com
https://webtask.slack.com (join via http://chat.webtask.io)

*/

module.exports = function (ctx, cb) {
  var HashMap = require('hashmap');
  
  var urls = new HashMap();
  
  
  var response = 'Status Check:\n';
  
  var params = ["all"];
  if(!cb.body.text.trim()){
    params = cb.body.text.split("  ");
  }
  
  
  
  if(params.indexOf("all") > -1){
    
  }else{
    
  }
  
  cb(null, {
    response_type: 'in_channel', // uncomment to have the response visible to everyone on the channel
    text: response,
  });
};

