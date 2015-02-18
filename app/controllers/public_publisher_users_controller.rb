class PublicPublisherUsersController < ApplicationController


  layout 'public_publisher_user'  

  before_action :verify_id_public
  before_action :fill_left_directory_public

    
  def verify_id_public

    id_passed = params[:id]
    # render text: id_passed
    if !id_passed.nil?
        publisher_user = PublisherUser.friendly.find(id_passed) rescue nil
        if !publisher_user.nil?
            # This is a public view page. But if there is a signed in user, he gets signed-in options.
            # Else, the minimal public options apply.
            # signed_in = signed_in?
            # if signed_in?
              # @@signed_in_user_options = true
            # end        
        else
          redirect_to '/Signin'          
        end
    else
        redirect_to '/Signin'          
    end
    
  end    

  def fill_left_directory_public
    
    @signed_in_user_options = signed_in?
    
  end
  
  

  def index_demo

    id_passed = params[:id]
    @url_my_story_public = '/ppuid' + id_passed
    @url_my_story        = '/puid-demo' + id_passed
    
    # # @signed_in_user_options = @@signed_in_user_options
    # @signed_in_user_options = signed_in?
    # # @current_user_id = current_user.id
    # @b_signed_in = signed_in?
    # # @signed_in_user_options = false
    # id_passed = params[:id]
    # @friendly_id = id_passed
    # user = User.friendly.find(id_passed)
    # @user_name_first = user.name_first
    # @user_name_last = user.name_last
    # @user_id = user.id    
    # publisher_user = PublisherUser.where("user_id = ?", @user_id).first
    # @publisher_user_id = publisher_user.id
    # @publisher_id = publisher_user.publisher_id
    # # publisher = Publisher.find_by_id(@publisher_id)
    
  end

  
  def index
        
    # User        
    @name_first = ""
    @name_last = ""
    # PublisherUser
    @email = ""
    @location = ""
    @name_alias = ""
    @job_title = ""
    @name_company = ""
    @time_at_company = ""
    @website = ""
    @phone_company = ""

    @user = nil
    @publisher_user_image_primary = nil
    @publisher_user_logo_image = nil
    
    
    @signed_in_user_options = signed_in?
    @b_signed_in = signed_in?

    id_passed = params[:id]
    @url_my_story = '/puid' + id_passed

    @friendly_id = id_passed
    publisher_user = PublisherUser.friendly.find(id_passed) rescue nil
    if !publisher_user.nil?
        publisher_user_id = publisher_user.id
        @publisher_user_id = publisher_user_id

        # user = User.where("id = ?", publisher_user.user_id).first rescue nil
        user = publisher_user.user
        if !user.nil?
          @user = user
          # @publisher_user_image_primary = UserImage.where("user_id = ?", publisher_user.user.id).where( :primary => true ).first
          @publisher_user_image_primary = user.user_images.where( :primary => true ).first
          @name_first = user.name_first
          @name_last = user.name_last
        else
          #
        end




        @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", publisher_user_id).first
        @email = publisher_user.email
        @location = publisher_user.location
        @name_alias = publisher_user.name_alias
        @job_title = publisher_user.job_title
        @name_company = publisher_user.name_company
        @time_at_company = publisher_user.time_at_company
        @website = publisher_user.website
        @phone_company = publisher_user.phone_company
    else
        # Catch error, here, which shouldn't be necessary, as the passed id was already verified.
        redirect_to '/Signin'
    end

    
  end
  


end
