class PublisherPublicsController < ApplicationController
  
  prepend_view_path 'app/views/publisher/profile'
    
  layout 'publisher_publics_index'

  # layout 'publisher_public'  

  # before_action :signed_in_user
  before_action :verify_id_public
  before_action :fill_left_directory_public
    
  # @@signed_in_user_options = false    
    
  # ppcid-demo497219576
  # ppcid497219576    
  def verify_id_public

    id_passed = params[:id]
    if !id_passed.nil?
      publisher_passed = Publisher.friendly.find(id_passed) rescue nil
      if publisher_passed.nil?
        if signed_in?
          raise ActionController::RoutingError.new('Not Found')  
        else
          redirect_to '/Signin'
        end
      end
    else
      redirect_to '/'
    end
    
  end    

  def fill_left_directory_public
    
      if signed_in?
        @signed_in_user_options = signed_in?
      end        
    
  end
  
  

  def index_demo

    id_passed = params[:id]
    @friendly_id = id_passed
    publisher = Publisher.friendly.find(id_passed) rescue nil
    if !publisher.nil?
      @url_corporate_story = '/pcid-demo' + publisher.slug  
    else
      # catch error, here, which should not be necessary, as the passed id has already been verified. 
    end
    
  end

  
  def index
    
    @signed_in_user_options = signed_in?
    @b_signed_in = signed_in?

    id_passed = params[:id]
    @friendly_id = id_passed
    publisher = Publisher.friendly.find(id_passed) rescue nil
    if !publisher.nil?
      @publisher_id = publisher.id
      @publisher_name = publisher.name
      @publisher_profile_images = publisher.publisher_profile_images     
      @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ?", @publisher_id).where( :primary => true ).first
      
      @url_corporate_story = '/pcid' + publisher.slug            
    else
      # catch error, here, which should not be necessary, as the passed id has already been verified.
    end
    
  end
  
  
  def show
  end


  
end
