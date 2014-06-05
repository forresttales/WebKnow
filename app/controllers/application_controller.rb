class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper  


  def force_http
    if request.ssl? && Rails.env.production?
      redirect_to :protocol => 'http://', :status => :moved_permanently
    end
  end  

  
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
