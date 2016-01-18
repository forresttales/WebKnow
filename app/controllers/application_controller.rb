# require 'auto_load_i18n'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  include UsersIndexPublisherUserHelper
  include UsersIndexPublisherUserHomeHelper  
  include UsersIndexPublisherUserPublicHelper
  include UsersIndexPublisherUserSignedoutHelper

  include UsersIndexPublisherHelper
  include UsersIndexPublisherHomeHelper  
  include UsersIndexPublisherPublicHelper
  include UsersIndexPublisherSignedoutHelper

  # include User::UsersIndexPublisherUserHelper
  # include User::UsersIndexPublisherUserHomeHelper  
  # include User::UsersIndexPublisherUserPublicHelper
  # include User::UsersIndexPublisherUserSignedoutHelper
  # include User::UsersIndexPublisherHelper
  # include User::UsersIndexPublisherHomeHelper  
  # include User::UsersIndexPublisherPublicHelper
  # include User::UsersIndexPublisherSignedoutHelper
  
  def force_http
    if request.ssl? && Rails.env.production?
      redirect_to :protocol => 'http://', :status => :moved_permanently
    end
  end  


  # def user_profile_image_nav
#     
    # user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)     
# 
    # if user_profile_images.any?
      # user_profile_image = @user_profile_images[0]
    # else
      # user_profile_image = nil
    # end      
# 
    # return user_profile_image
  # end


  # private
    # def current_user
      # @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    # end
    # helper_method :current_user

  
  # protected
#   
  # def confirm_logged_in
    # unless session[:user_id]
      # flash[:notice] = "Please log in."
#       
      # redirect_to(:controller => 'access', :action => 'show')
      # #redirect_to(:controller => 'contacts', :action => 'list')
#       
#       
      # return false # halts the before_filter
    # else
      # return true
    # end
  # end
  
end
