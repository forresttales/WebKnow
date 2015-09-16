require 'torquebox-stomp'

class DemoStomplet
	# include SessionsHelper

	def initialize() 
		super 
		@subscribers = [] 
	end 

	def configure(stomplet_config) 
	end 

	def on_message(stomp_message, session)
		remember_token = session[:remember_token]

		# Rails.logger.info session.to_yaml
		# Rails.logger.info session[:remember_token].to_yaml
		
		if signed_in?( remember_token )
			user = current_user( remember_token )		

			# send the message to each subscriber 
			@subscribers.each do |subscriber| 
				stomp_message.headers['sender'] = user.name_first + " " + user.name_last
				stomp_message.headers['sender_id'] = user.id.to_s
				stomp_message.headers['sender_slug'] = user.slug.to_s
				# stomp_message.headers['session'] = session.to_s
				# Rails.logger.info "Stomplet cookies: " + cookies.to_yaml

				subscriber.send( stomp_message ) 
			end 
		end
	end

	def on_subscribe(subscriber)
		remember_token = subscriber.session[:remember_token]

		if signed_in?( remember_token ) 
			# add a new subscriber 
			@subscribers << subscriber
		end
	end 

	def on_unsubscribe(subscriber)
		remember_token = subscriber.session[:remember_token]

		if signed_in?( remember_token ) 
			# remove subscriber 
			@subscribers.delete( subscriber )
		end
	end


	def current_user(token)
		remember_token = User.encrypt(token)
		current_user ||= User.find_by(remember_token: remember_token)
	end

	def signed_in?(token)
		remember_token = User.encrypt(token)
		User.where( remember_token: remember_token ).exists?
	end
end