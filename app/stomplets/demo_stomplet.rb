require 'torquebox-stomp'

class DemoStomplet < TorqueBox::Stomp::JmsStomplet
  # include SessionsHelper

  # def initialize() 
  #   super 
  #   @subscribers = [] 
  # end 

  # def configure(stomplet_config) 
  # end 

  # def on_message(stomp_message, session)
  #   remember_token = session[:remember_token]

  #   # Rails.logger.info session.to_yaml
  #   # Rails.logger.info session[:remember_token].to_yaml
    
  #   if signed_in?( remember_token )
  #     user = current_user( remember_token )   

  #     # send the message to each subscriber 
  #     @subscribers.each do |subscriber| 
  #       stomp_message.headers['sender'] = user.name_first + " " + user.name_last
  #       stomp_message.headers['sender_id'] = user.id.to_s
  #       stomp_message.headers['sender_slug'] = user.slug.to_s
  #       # stomp_message.headers['session'] = session.to_s
  #       # Rails.logger.info "Stomplet cookies: " + cookies.to_yaml

  #       subscriber.send( stomp_message ) 
  #     end 
  #   end
  # end

  # def on_subscribe(subscriber)
  #   remember_token = subscriber.session[:remember_token]

  #   if signed_in?( remember_token )
  #     Rails.logger.info "Subscribed: " + subscriber.to_s
  #     # add a new subscriber 
  #     @subscribers << subscriber
  #   end
  # end 

  # def on_unsubscribe(subscriber)
  #   remember_token = subscriber.session[:remember_token]

  #   if signed_in?( remember_token ) 
  #     # remove subscriber 
  #     @subscribers.delete( subscriber )
  #   end
  # end

  include TorqueBox::Injectors

  def initialize()
    super
    @destination = fetch( '/topics/chat' )
    
    Rails.logger.info "initialize(): " + @destination.to_s
  end

  def on_message(stomp_message, session)
    remember_token = session[:remember_token]
    
    if signed_in?( remember_token )
      user = current_user( remember_token ) 

      stomp_message.headers['sender'] = user.name_first + " " + user.name_last
      stomp_message.headers['sender_id'] = user.id.to_s
      stomp_message.headers['sender_slug'] = user.slug.to_s
      
      case user.profile_type.to_s  
          when "1"
              user_image = user.user_images.where( :primary => true ).first.image_url(:image_50_50) rescue "/images_avatar/avatar-gen-person-w50-h50.png"
          when "2"
              user_image = user.user_images.where( :primary => true ).first.image_url(:image_50_50) rescue "/images_avatar/avatar-gen-person-w50-h50.png"
          when "3"
              user_image = user.publisher_user.publisher_user_images.where( :primary => true ).first.image_url(:image_50_50) rescue "/images_avatar/avatar-gen-person-w50-h50.png"
          when "4"
              user_image = user.user_images.where( :primary => true ).first.image_url(:image_50_50) rescue "/images_avatar/avatar-gen-person-w50-h50.png"
          when "5"
              user_image = user.user_images.where( :primary => true ).first.image_url(:image_50_50) rescue "/images_avatar/avatar-gen-person-w50-h50.png"
          else
      end
      
      # user_image = user.user_images.where( :primary => true ).first.image_url(:image_200_200) rescue "/images_avatar/avatar-gen-person-w200-h200.png"
      stomp_message.headers['sender_image'] = user_image
      # stomp_message.headers['dialog_id'] = 1.to_s

      send_to( @destination, stomp_message )
    end
  end

  def on_subscribe(subscriber)
    remember_token = subscriber.session[:remember_token]

    if signed_in?( remember_token )
      dialogs = get_dialogs( remember_token )

      Rails.logger.info "dialogs: " + dialogs

      subscribe_to( subscriber, 
                  @destination, 
                  dialogs )
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

  def get_dialogs(token)
    user = current_user( token )

    dialogs = ""

      for dialog in user.conversations
        Rails.logger.info "user.conversations: " + dialog.to_yaml
        dialogs += "dialog_id='" + dialog.dialog_id.to_s + "' OR "
      end

      dialogs += "dialog_id='0' OR recipient='" + user.id.to_s + "'";
  end
end