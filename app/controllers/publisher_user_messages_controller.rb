class PublisherUserMessagesController < ApplicationController
  
  include TorqueBox::Injectors
  
  def index
  	Thread.new do
  		listen
  	end
  end

  def listen 

  	sleep 5

  	TorqueBox::Messaging::Topic.list.each do |topic|
	    Rails.logger.info topic.name
	end

  	username = current_user.name_first + " " + current_user.name_last
  	message = username + ", joined conversation"

  	fetch( '/topics/chat' ).publish( message, 
                                      :properties=>{ 
                                        :recipient=>"PublisherUserMessagesController", 
                                        :sender=>'system',
                                        :user_image=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrEyVlaWx0_FK_sz86j-CnUC_pfEqw_Xq_xZUm5CMIyEI_-X2hRUpx1BHL",
                                        :dialog_id=>"1"
                                       } )
  	topic = TorqueBox::Messaging::Topic.new('/topics/chat')
  	Thread.new {
  		while true
  			smth = topic.receive({:decode => false})
  			properties = ""
  			smth.getPropertyNames.each do |propertyName|
  				# Rails.logger.info propertyName.to_s
  				properties += propertyName.to_s + ": " + smth.getStringProperty( propertyName.to_s ) + "\n"
  			end
  			Rails.logger.info properties
  			Rails.logger.info smth.to_yaml
  			Rails.logger.info smth.toString
  			Rails.logger.info smth.getCoreMessage.to_s
  			Rails.logger.info smth.getCoreMessage.to_yaml
  			# Errors here:
  			# Rails.logger.info smth.readUTF
  			# Rails.logger.info smth.getCoreMessage.getBodyBuffer.readString
  			# Receives next message:
  			# Rails.logger.info "smth2: " + topic.receive
  		end
  	}

  	# listener = subscribe("/queue/demo")
  	# Rails.logger.info "Listener " + listener.to_yaml
  	# listener = fetch( '/topics/chat' ).subscribe("/queue/demo")
  	# Rails.logger.info "Listener with fetch" + listener.to_yaml 
  	# subscribe "/queue/demo" do |message|
  	# 	Rails.logger.info "Message"
  	# 	Rails.logger.info message.to_s
  	# end
  	# fetch( '/topics/chat' ).subscribe "/queue/demo" do |msg|
  	# 	Rails.logger.info "Message2"
  	# 	Rails.logger.info msg.to_s
  	# end

  	# listener = subscribe("/topics/chat")
  	# Rails.logger.info "Listener2 " + listener.to_yaml
  	# listener = fetch( '/topics/chat' ).subscribe("/topics/chat")
  	# Rails.logger.info "Listener2 with fetch" + listener.to_yaml 
  	# subscribe "/topics/chat" do |message|
  	# 	Rails.logger.info "Message3"
  	# 	Rails.logger.info message.to_s
  	# end

  	# subscribe("/topics/chat", {}, received)


 #  	Rails.logger.info "Starting connection"
	# Rails.logger.info "----------------------------"
	# client = OnStomp::Client.new("stomp://127.0.0.1:8675")
	# client.connect

	# Rails.logger.info "Connected to broker using protocol #{client.connection.version}"

	# Rails.logger.info "----------------------------"
	# Rails.logger.info "Starting subscription"

	# client.subscribe("/queue/demo") do |message|
	# # # client.subscribe("jms.topic.chat") do |message|
	#   Rails.logger.info "Received: '#{message.body}'"
	# end

	# Rails.logger.info client.to_yaml

	# # client.send("jms.topics.chat", "hello world1")
	# client.send("/queue/demo", "hello world2")
	# client.send("/queue/demo", "hello world2.2", :persistent => true )
	# # client.send("/jms/topics/chat/queue/demo", "hello world3")
	# # client.send("/topics/chat/queue/demo", "hello world4")
	# # client.send("/topics/queue/demo", "hello world5")
	# # client.send("/chat/queue/demo", "hello world6")
	# # client.send("", "hello world7")

	# Rails.logger.info "----------------------------"
	# Rails.logger.info "Subscription end"

	# client.disconnect

	# while true
	# 	sleep 5
	# 	Rails.logger.info "Listening"
	# end
  end

  def received
  	Rails.logger.info "Received"
  	Rails.logger.info msg
  end

end
