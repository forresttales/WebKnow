class UserRegistersController < ApplicationController

  before_filter :force_http

  # layout 'publisher'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  before_action :verify_signin, only: [:index]


  def verify_signin
    
      if !signed_in?
          redirect_to '/Signin'
      end
      
  end


  def index
    
      case current_user.profile_type.to_s
        when "1"
            # student user
        when "2"
            # teacher user
        when "3"
            # publisher user
            # Rails.logger.info('called render_index_publisher_user')
            render_index_publisher
        when "4"
            # institute user
        when "5"
            # recruiter user
        else
            #
      end

    
  end

  def render_index_publisher
    
      render 'user_registers/index_publisher', :layout => 'index_register_publisher_user'
    
  end



end
