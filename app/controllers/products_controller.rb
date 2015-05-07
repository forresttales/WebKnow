class ProductsController < ApplicationController

  # include ActiveModel::Conversion
  
  layout 'product'

  respond_to :html, :js, :json  

  # before_action :already_signed_in, only: [:new]
  before_action :signed_in_user
  before_action :fill_left_directory

  def fill_left_directory

    slug = current_user.slug
    @url_user_story  = '/' + current_user.slug
    @url_profile_story = '/' + current_user.publisher.slug
        
  end

  
  def index

      @publisher_products = PublisherProduct.all

    # respond_to do |format|
      # format.html
      # format.js
      # # format.json { render :json => { :msg => msg,
                                      # # :user_age_range_1 => user_age_range_1,
                                      # # :user_age_range_2 => user_age_range_2
                  # # }                 }      
     # end
    
  end



  def return_products_1
    
  end

  def return_products_2
    
  end


  # def return_profile_users
    # profile_user_type = params[:profile_user_type]
    # @public_users = nil
    # case profile_user_type.to_s   
      # when "0"
        # @public_users = PublicUser.all
      # when "1"
        # # @public_users = PublicUser.all
      # when "2"
        # # @public_users = PublicPublisherUser.all
      # when "3"
        # # @public_users = PublicUser.all
      # when "4"
        # # @public_users = PublicUser.all
      # when "5"
        # # @public_users = PublicUser.all
      # when "6"
        # # @public_users = PublicUser.all
      # else
        # #        
    # end
    # @profile_user_type = profile_user_type
  # end


  
end
