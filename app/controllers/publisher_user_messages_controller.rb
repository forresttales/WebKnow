class PublisherUserMessagesController < ApplicationController
  
  include TorqueBox::Injectors

  before_action :signed_in_user
  
  def index
  	# Thread.new do
  	# 	listen
  	# end
  	@last_dialog = current_user.conversations.last
  end

  def send_message
  	@smth = "send_message"
  	Rails.logger.info @smth
  	# Get dialog_id and message body from ajax
  	dialog_id = params[:dialog_id]
  	message = params[:new_message]
  	Rails.logger.info dialog_id
  	Rails.logger.info message
  	# Save to database
  	entry = Message.new(:dialog_id => dialog_id, :user_id => current_user.id, :body => message)
	entry.save
	Rails.logger.info "Saved"

  	# Publish message to existing channel
  	user_image = current_user.user_images.where( :primary => true ).first.image_url(:image_200_200) rescue "/images_avatar/avatar-gen-person-w200-h200.png"
	fetch( '/topics/chat' ).publish( message.to_s, 
                            	:properties=>{ 
                                :sender => current_user.name_first + " " + current_user.name_last,
                                :sender_id => current_user.id.to_s,
                                :sender_slug => current_user.slug.to_s,
                                :sender_image => user_image,
                                :dialog_id => dialog_id.to_s
                               } )
  end

  def open_conversation
  	sender_user_id = params[:sender_user_id]
  	recipient_user_id = params[:recipient_user_id]
  	@messages = nil

  	# Check if conversation exists
  	if sender_user_id != recipient_user_id
	  	@dialog_id = get_private_dialog(sender_user_id, recipient_user_id)
	  	if @dialog_id == -1
	  		# Get maximum dialog_id from Conversation model
			dialog_id_new = Conversation.maximum("dialog_id") + 1
	  		
	  		user_image = current_user.user_images.where( :primary => true ).first.image_url(:image_200_200) rescue "/images_avatar/avatar-gen-person-w200-h200.png"
	  		fetch( '/topics/chat' ).publish( "Need to create! Possible dialog_id: " + dialog_id_new.to_s, 
	                                    	:properties=>{ 
	                                        :sender => current_user.name_first + " " + current_user.name_last,
	                                        :sender_id => current_user.id.to_s,
	                                        :sender_slug => current_user.slug.to_s,
	                                        :sender_image => user_image,
	                                        :dialog_id => "0"
	                                       } )
		  	# Add two new entries for sender and recipient
		  	# entry = Conversation.new(:dialog_id => dialog_id_new, :user_id => sender_user_id, :owner => true)
			# entry.save

			# entry = Conversation.new(:dialog_id => dialog_id_new, :user_id => recipient_user_id)
			# entry.save

		  	# Send resubscribe message to sender and recipient personal channels
	  	else
	  		# Publish message to existing channel
	  		# user_image = current_user.user_images.where( :primary => true ).first.image_url(:image_200_200) rescue "/images_avatar/avatar-gen-person-w200-h200.png"
	  		# fetch( '/topics/chat' ).publish( "Exists!", 
	    #                                 	:properties=>{ 
	    #                                     :sender => current_user.name_first + " " + current_user.name_last,
	    #                                     :sender_id => current_user.id.to_s,
	    #                                     :sender_slug => current_user.slug.to_s,
	    #                                     :sender_image => user_image,
	    #                                     :dialog_id => dialog_id.to_s
	    #                                    } )
	  		@messages = Message.where(:dialog_id => @dialog_id)
	  	end
	end

  end

  def get_private_dialog(sender_user_id, recipient_user_id)
  	Conversation.all.each do |dialog|
  		users = Conversation.where(:dialog_id => dialog.dialog_id)
  		# Rails.logger.info "users.conversations: " + users.to_yaml
  		# Rails.logger.info "users.size.conversations: " + users.size.to_s
  		# Rails.logger.info "users.exists(sender_user).conversations: " + users.exists?(:user_id => sender_user_id).to_s
  		# Rails.logger.info "users.exists(recipient_user).conversations: " + users.exists?(:user_id => recipient_user_id).to_s

  		if ( users.size == 2 && users.exists?(:user_id => sender_user_id) && users.exists?(:user_id => recipient_user_id) )
  			return dialog.dialog_id
  		end
  	end

  	return -1
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
