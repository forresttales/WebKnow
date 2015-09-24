
if (!window.TorqueBox) {
  window.TorqueBox = {};
  window.TorqueBox.Events = {};
}

$( function() {
	
  var chatView = new TorqueBox.ChatView();
  chatView.initialize();
	
  var client = Stomp.client(stomp_url);
  client.connect( null, null, function() {
	
	alert("client.connect");
			
    $(TorqueBox.Events).bind('TorqueBox.Chat.Close', 
                              function() { client.disconnect });

    $(TorqueBox.Events).bind('TorqueBox.Chat.NewMessage', 
                              onNewMessage);

    client.subscribe( '/public', function(message) {
      $(TorqueBox.Events).trigger('TorqueBox.Chat.NewPublicMessage', 
                                  [message]);
    });

    client.subscribe( '/private', function(message) {
      $(TorqueBox.Events).trigger('TorqueBox.Chat.NewPrivateMessage', 
                                  [message]);
    } );

    $(TorqueBox.Events).trigger('TorqueBox.Chat.Connect');
  });

  var onNewMessage = function(event, message, recipient) {
    if ( recipient == 'public' ) {
      client.send( '/public',
                   {}, 
                   message );
    } else {
      client.send( '/private', 
                   { recipient: recipient }, 
                   message );
    }
  };


});

