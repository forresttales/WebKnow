class PublisherRegistersController < ApplicationController

  # before_filter :force_http

  layout 'publisher_register'
  
  respond_to :html, :js, :json  

  # helper_method :sort_column, :sort_direction, :yesno

  # before_action :signed_in_user, only: [:index, :index_demo]  


  def index
    
  end


end
