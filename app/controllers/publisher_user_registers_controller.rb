class PublisherUserRegistersController < ApplicationController

  before_filter :force_http

  layout 'publisher_user_register'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  before_action :verify_signin, only: [:index]


  def verify_signin
    
      if !signed_in?
          redirect_to '/Signin'
      end
      
  end


  def register_1
    
  end


  def register_2
    
  end


  def register_3
    
  end


  def register_4
    
  end


  def register_5
    
  end


  # def render_index_publisher
      # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
  # end



end
