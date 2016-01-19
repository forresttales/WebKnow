class PublisherUsersController < ApplicationController

  require 'mini_magick'

  prepend_view_path 'app/views/publisher/user'  
      
  layout 'publisher_users_index'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  # before_action :verify_signin, only: [:index]
  # before_action :verify_signin

  before_action :index_verify, only: [:index]

  # before_action :signed_in_user, except: [:update_my_story, :upload_publisher_user_image_primary, :upload_publisher_user_logo_image, :edit_image_primary, :destroy_publisher_user_image]
  # before_action :verify_id, except: [:update_my_story, :upload_publisher_user_image_primary, :upload_publisher_user_logo_image, :edit_image_primary, :destroy_publisher_user_image]
  # before_action :fill_left_directory, except: [:update_my_story, :upload_publisher_user_image_primary, :upload_publisher_user_logo_image, :edit_image_primary, :destroy_publisher_user_image]

  # before_action :signed_in_user, only: [:index, :index_demo]
  # before_action :verify_params, only: [:index, :index_demo]
  # before_action :fill_left_directory, only: [:index, :index_demo]

  @@current_post_user = nil

  # def verify_signin
      # if !signed_in?
          # redirect_to '/Signin'
      # end
  # end



  # 125713683635

  def index_verify

    id_passed = params[:id]
    
    # Rails.logger.info('in users id_passed = ' + id_passed.to_s)
    # Rails.logger.info('id_passed not nil')
    
    # b_id_exists = IssuedGenId.exists?(:gen_id => id_passed)
    issued_gen_id = IssuedGenId.where(:gen_id => id_passed).first rescue nil
    if !issued_gen_id.nil?
        if signed_in?
            user_passed = issued_gen_id.user rescue nil
            if ( user_passed.id == current_user.id )
                # redirect_to :controller => 'publisher_users', :action => 'index', :id => id_passed.to_s
            else
                # redirect_to :controller => 'public_publisher_users', :action => 'index', :id => id_passed.to_s
                # redirect_to '/public_publisher_users/' + id_passed.to_s
                redirect_to publisher_users_public_path( id: id_passed.to_s)
                
            end
        else
            redirect_to :controller => 'publisher_users_signedout', :action => 'index', :id => id_passed.to_s
        end
    else
        Rails.logger.info('publisher_users_controller issued_gen_id was nil')
        redirect_to '/Signin'      
    end

    
  end



  def index

      # begin
          # # Rails.logger.info('render_index_publisher_user')
#           
          # # @new_user = false
          # # if session[:new_user]
            # # @new_user = true
          # # end
#       
          # @user = current_user
          # @publisher_user = nil
          # # @publisher_user_image_primary = nil
          # # @publisher_user_bkimage = nil
          # # @user_image_primary = nil
          # @post_users = nil
          # @post_user = nil
          # # gon.publisher_user_image_primary_url = nil
          # gon.publisher_user_interest_interest_text = nil
#   
          # @background_1_images = nil
          # @background_1_image = nil        
          # @background_1_image_url = nil
          # @background_1_image_id = nil
          # gon.background_1_image_id = nil          
          # @crop_x_background_1_image = nil
          # @crop_y_background_1_image = nil
          # @crop_w_background_1_image = nil
          # @crop_h_background_1_image = nil
#           
          # @primary_1_image = nil
          # @crop_x_primary_1_image = nil
          # @crop_y_primary_1_image = nil
          # @crop_w_primary_1_image = nil
          # @crop_h_primary_1_image = nil
          # gon.primary_1_image_url = nil
          # gon.primary_1_image_id = nil
# 
          # @list_1_images = nil
# 
#           
          # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
          # publisher_user = current_user.publisher_user rescue nil        
          # if !publisher_user.nil?
              # # Rails.logger.info('publisher_user not nil')
              # @publisher_user = publisher_user
              # @publisher_id = publisher_user.publisher_id
              # @publisher_user_id = publisher_user.id
#               
              # # publisher = Publisher.find_by_id(@publisher_id)
              # publisher = current_user.publisher rescue nil
              # if !publisher.nil?
#                 
                  # # # background_image_1 = publisher_product.publisher_user_background_images rescue nil
                  # # publisher_user_background_image = publisher_user.publisher_user_background_images.where( :primary => true ).first rescue nil
                  # # # @image_5 = image_5
                  # # if !publisher_user_background_image.nil?
                    # # @background_image_1 = publisher_user_background_image
                    # # gon.background_image_1_id = publisher_user_background_image.id
                    # # @background_image_1_id = publisher_user_background_image.id
                    # # @background_image_1_url = publisher_user_background_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                    # # @crop_x_background_image_1 = publisher_user_background_image.crop_x
                    # # @crop_y_background_image_1 = publisher_user_background_image.crop_y
                    # # @crop_w_background_image_1 = publisher_user_background_image.crop_w
                    # # @crop_h_background_image_1 = publisher_user_background_image.crop_h
                  # # else
                    # # # Rails.logger.info('image_5 was nil in index')
                    # # @background_image_1 = nil
                    # # gon.background_image_1_id = nil
                    # # @background_image_1_id = nil
                    # # @background_image_1_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                  # # end
#       
                  # background_1_image = publisher_user.publisher_user_background_images.where( :primary => true ).first rescue nil
                  # if !background_1_image.nil?
                    # @background_1_image = background_1_image
                    # gon.background_1_image_id = background_1_image.id
                    # @background_1_image_id = background_1_image.id
                    # @background_1_image_url = background_1_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                    # @crop_x_background_1_image = background_1_image.crop_x
                    # @crop_y_background_1_image = background_1_image.crop_y
                    # @crop_w_background_1_image = background_1_image.crop_w
                    # @crop_h_background_1_image = background_1_image.crop_h
                  # else
                    # @background_1_image_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                  # end
#       
                  # primary_1_image = publisher_user.publisher_user_images.where( :primary => true ).first rescue nil
                  # if !primary_1_image.nil?
                    # @primary_1_image = primary_1_image
                    # gon.primary_1_image_id = primary_1_image.id
                    # @crop_x_primary_1_image = primary_1_image.crop_x
                    # @crop_y_primary_1_image = primary_1_image.crop_y
                    # @crop_w_primary_1_image = primary_1_image.crop_w
                    # @crop_h_primary_1_image = primary_1_image.crop_h
                  # end
#       
                  # list_1_images = publisher_user.publisher_user_images.order('created_at DESC') rescue nil
                  # if !list_1_images.nil?
                    # @list_1_images = list_1_images
                  # end
#       
                  # @user_friend_invitations_received = current_user.get_relate_user_friend_invitations_received rescue nil
                  # @user_friend_invitations_sent = current_user.get_relate_user_friend_invitations_sent rescue nil
#       
                  # received = @user_friend_invitations_received.count
                  # sent = @user_friend_invitations_sent.count
#       
                  # # Rails.logger.info('get_relate_user_friend_invitations_received = ' + received.to_s)
                  # # Rails.logger.info('get_relate_user_friend_invitations_sent = ' + sent.to_s)
# 
# 
# 
# 
#       
                  # # user_followed_users = @user.followed_users
                  # # user_followed_users.each do |user_followed_user| 
                  # # user_id = user_followed_user.id                              
                  # # user = User.find_by_id(user_id) rescue nil              
                  # # user_image_primary = user.user_images.where( :primary => true ).first
                  # # # user.slug
                  # # if !user_image_primary.nil?                     
                  # # user_image_primary.image_url(:user_100_100) if user_image_primary.image?
                  # # else
                  # # # src="../images_avatar/avatar_generic_1_w100_h100.png"        
                  # # end                           
#       
                  # # @user_friends = current_user.user_friends
                  # # @user_friends = nil
#       
                  # # user_friend_invited_ids = current_user.user_friends_invited
                  # # @user_friend_invitations_received = current_user.user_friend_invitations_received rescue nil
                  # # @user_friend_invitations_sent = current_user.user_friend_invitations_sent rescue nil
#                   
# 
                  # # user_friends_invited.each do |user_friend_invited|
                    # # #Rails.logger.info('user_friend_invited_id = ' + user_friend_invited_id.id.to_s)
                  # # end
                  # # list_user_friend_invited_images = current_user.publisher_user.publisher_user_images.order('created_at DESC') rescue nil
                  # # if !list_1_images.nil?
                    # # @list_1_images = list_1_images
                  # # end
# 
# 
#                   
                  # # user_friend_invited_ids.each do |user_friend_invited_id|
                    # # Rails.logger.info('user_friend_invited_id = ' + user_friend_invited_id.id.to_s)
                  # # end
#       
#       
                  # # @user_friends_invited_count = user_friends_invited.count
                  # # Rails.logger.info('user_friend_invited_ids_count = ' + @user_friend_invited_ids_count.to_s)
#                   
                  # # user_friendships status 1 - invited
                  # # user_invited_friends = current_user.user_friendships.where("status = ?", 1) rescue nil
                  # # user_invited_friends_images = current_user.user_friendships.where("status = ?", 1) rescue nil
#       
#       
                  # # @publisher_user_plot_text = publisher_user.publisher_user_plot.plot_text
                  # # @post_user = current_user.post_users.build
                  # # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
#               
                  # # @log_users = current_user.post_users.paginate(:page => params[:page], :per_page => 5)
                  # # @log_users = current_user.feed_log
#       
                  # # @post_users = current_user.feed_log
#                   
                  # # gon.id_image = nil
                  # # @crop_x = 0
                  # # @crop_y = 0
                  # # @crop_w = 200
                  # # @crop_h = 200
                  # # if !@publisher_user_image_primary.nil? 
                    # # gon.id_image = @publisher_user_image_primary.id
                    # # @crop_x = @publisher_user_image_primary.crop_x
                    # # @crop_y = @publisher_user_image_primary.crop_y
                    # # @crop_w = @publisher_user_image_primary.crop_w
                    # # @crop_h = @publisher_user_image_primary.crop_h
                  # # end
#               
                  # # gon.id_image_logo = nil
                  # # @crop_x_logo = 0
                  # # @crop_y_logo = 0
                  # # @crop_w_logo = 200
                  # # @crop_h_logo = 200
                  # # if !@publisher_user_logo_image.nil? 
                    # # gon.id_image_logo = @publisher_user_logo_image.id
                    # # @crop_x_logo = @publisher_user_logo_image.crop_x
                    # # @crop_y_logo = @publisher_user_logo_image.crop_y
                    # # @crop_w_logo = @publisher_user_logo_image.crop_w
                    # # @crop_h_logo = @publisher_user_logo_image.crop_h
                  # # end
#                   
                  # gon.new_user = current_user.new_user
#       
                  # gon.user_name_first = ""
                  # gon.b_user_name_first = false
                  # gon.b_required_user_name_first = true
                  # if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
                      # gon.user_name_first = current_user.name_first
                      # gon.b_user_name_first = true
                      # gon.b_required_user_name_first = false
                  # end
#                   
                  # gon.user_name_last = ""
                  # gon.b_user_name_last = false
                  # gon.b_required_user_name_last = true
                  # if !((current_user.name_last.blank?) or (current_user.name_last.empty?) or (current_user.name_last.nil?)) 
                      # gon.user_name_last = current_user.name_last
                      # gon.b_user_name_last = true
                      # gon.b_required_user_name_last = false
                  # end
#               
                  # gon.user_email = ""
                  # gon.b_user_email = false
                  # gon.b_required_user_email = true
                  # if !((current_user.email.blank?) or (current_user.email.empty?) or (current_user.email.nil?)) 
                      # gon.user_email = current_user.email
                      # gon.b_user_email = true
                      # gon.b_required_user_email = false
                  # end
#                 
                  # gon.user_gender = current_user.gender
                  # gon.b_user_gender = true
                  # gon.b_required_user_gender = false
#       
                  # gon.user_gender_text = current_user.gender_text
                  # gon.b_user_gender_text = true
                  # gon.b_required_user_gender_text = false
#                   
                  # gon.user_bd_day = current_user.bd_day
                  # gon.b_user_bd_day = true
                  # gon.b_required_user_bd_day = false
#       
                  # gon.user_bd_month = current_user.bd_month
                  # gon.user_bd_month = current_user.bd_month
                  # gon.b_user_bd_month = true
                  # gon.b_required_user_bd_month = false
#                   
                  # gon.user_bd_month_text = current_user.bd_month_text
                  # gon.user_bd_month_text = current_user.bd_month_text
                  # gon.b_user_bd_month_text = true
                  # gon.b_required_user_bd_month_text = false
#                   
                  # gon.user_bd_year = current_user.bd_year
                  # gon.b_user_bd_year = true
                  # gon.b_required_user_bd_year = false
#                   
#                   
                  # gon.name_first = ""
                  # gon.b_name_first = false
                  # gon.b_required_name_first = true
                  # if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
                      # gon.name_first = current_user.name_first
                      # gon.b_name_first = true
                      # gon.b_required_name_first = false
                  # end
#                   
                  # gon.name_last = ""
                  # gon.b_name_last = false
                  # gon.b_required_name_last = true
                  # if !((current_user.name_last.blank?) or (current_user.name_last.empty?) or (current_user.name_last.nil?)) 
                      # gon.name_last = current_user.name_last
                      # gon.b_name_last = true
                      # gon.b_required_name_last = false
                  # end
#               
                  # gon.email = ""
                  # gon.b_email = false
                  # gon.b_required_email = true
                  # if !((publisher_user.email.blank?) or (publisher_user.email.empty?) or (publisher_user.email.nil?)) 
                      # gon.email = publisher_user.email
                      # gon.b_email = true
                      # gon.b_required_email = false
                  # end
#               
                  # gon.location = ""
                  # gon.b_location = false
                  # gon.b_required_location = true
                  # if !((publisher_user.location.blank?) or (publisher_user.location.empty?) or (publisher_user.location.nil?)) 
                      # gon.location = publisher_user.location
                      # gon.b_location = true
                      # gon.b_required_location = false
                  # end
#               
                  # gon.name_alias = ""
                  # gon.b_name_alias = false
                  # gon.b_required_name_alias = true
                  # if !((publisher_user.name_alias.blank?) or (publisher_user.name_alias.empty?) or (publisher_user.name_alias.nil?)) 
                      # gon.name_alias = publisher_user.name_alias
                      # gon.b_name_alias = true
                      # gon.b_required_name_alias = false
                  # end
#               
                  # gon.job_title = ""
                  # gon.b_job_title = false
                  # gon.b_required_job_title = true
                  # if !((publisher_user.job_title.blank?) or (publisher_user.job_title.empty?) or (publisher_user.job_title.nil?)) 
                      # gon.job_title = publisher_user.job_title
                      # gon.b_job_title = true
                      # gon.b_required_job_title = false
                  # end
#               
                  # gon.name_company = ""
                  # gon.b_name_company = false
                  # gon.b_required_name_company = true
                  # if !((publisher_user.name_company.blank?) or (publisher_user.name_company.empty?) or (publisher_user.name_company.nil?)) 
                      # gon.name_company = publisher_user.name_company
                      # gon.b_name_company = true
                      # gon.b_required_name_company = false
                  # end
#               
                  # gon.time_at_company = ""
                  # gon.b_time_at_company = false
                  # gon.b_required_time_at_company = true
                  # if !((publisher_user.time_at_company.blank?) or (publisher_user.time_at_company.empty?) or (publisher_user.time_at_company.nil?)) 
                      # gon.time_at_company = publisher_user.time_at_company
                      # gon.b_time_at_company = true
                      # gon.b_required_time_at_company = false
                  # end
#               
                  # gon.website = ""
                  # gon.b_website = false
                  # gon.b_required_website = true
                  # if !((publisher_user.website.blank?) or (publisher_user.website.empty?) or (publisher_user.website.nil?)) 
                      # gon.website = publisher_user.website
                      # gon.b_website = true
                      # gon.b_required_website = false
                  # end
#               
                  # gon.phone_company = ""
                  # gon.b_phone_company = false
                  # gon.b_required_phone_company = true
                  # if !((publisher_user.phone_company.blank?) or (publisher_user.phone_company.empty?) or (publisher_user.phone_company.nil?)) 
                      # gon.phone_company = publisher_user.phone_company
                      # gon.b_phone_company = true
                      # gon.b_required_phone_company = false
                  # end
#                   
                  # # slug_user = current_user.slug
                  # # @url_my_story_public = '/ppuid' + slug_user
#       
                  # publisher_user_interest = publisher_user.publisher_user_interest rescue nil
                  # if !publisher_user_interest.nil?
                      # gon.publisher_user_interest_interest_text = publisher_user_interest.interest_text rescue nil
                  # end
#                 
              # else
                  # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_publisher_user', :description => 'publisher was nil')
                  # raise
              # end
          # else
              # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_publisher_user', :description => 'publisher_user was nil')
              # raise
          # end
#         
          # render 'publisher_users/index', :layout => 'publisher_users_index'
# 
      # rescue StandardError => e
# 
          # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_publisher_user', :description => e.message.to_s)
          # @errors = true
#           
      # end

    
  end


  def get_feed_post
    
    # @post_user = current_user.post_users.build
    # @feed_items = current_user.feed.paginate(page: params[:page])
    @post_users = current_user.feed
    
  end


  def get_feed_log
    
    # @log_user = current_user.log_users.build
    
    # @feed_items = current_user.feed.paginate(page: params[:page])
    # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
    # @log_users = current_user.feed_log
    @log_users = current_user.feed_log.paginate(:page => params[:page], :per_page => 5)
    
    
  end


  def edit_image_primary
    # user = current_user
    # @user = user
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    # if !publisher_user.nil?
      # @publisher_user = publisher_user
      # @publisher_id = publisher_user.publisher_id
      # @publisher_user_id = publisher_user.id
      # publisher = Publisher.find_by_id(@publisher_id)
      # if !publisher.nil?
        # # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
        # @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
        # # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
      # else
        # #
      # end
    # else
      # # 
    # end
    # # respond_to do |format|
      # # format.html
      # # format.js
    # # end
  end



  def update_story_4
    
    ar = params[:publisher_user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    name_first = h_obj[:name_first]
    name_last = h_obj[:name_last]
    email = h_obj[:email]
    location = h_obj[:location]
    name_alias = h_obj[:name_alias]
    job_title = h_obj[:job_title]
    name_company = h_obj[:name_company]
    time_at_company = h_obj[:time_at_company]
    website = h_obj[:website]
    phone_company = h_obj[:phone_company]
    
    
    h_user = Hash.new
    h_user[:name_first] = name_first
    h_user[:name_last] = name_last
    
    user = User.find(current_user.id) rescue nil
    if !user.nil?
        if user.update_attributes(h_user)
            #
        else
            Rails.logger.info('user update failed')
        end
    else
        Rails.logger.info('user = nil')      
    end

    user = nil
    user = User.find(current_user.id) rescue nil
    # name_first = "first name"
    if !user.nil?
      current_user=(user)
    else
      #
    end

    name_first = current_user.name_first
    b_name_first = true
    name_last = current_user.name_last
    b_name_last = true



    h_publisher_user = Hash.new
    h_publisher_user[:email] = email
    h_publisher_user[:location] = location
    h_publisher_user[:name_alias] = name_alias
    h_publisher_user[:job_title] = job_title
    h_publisher_user[:name_company] = name_company
    h_publisher_user[:time_at_company] = time_at_company
    h_publisher_user[:website] = website
    h_publisher_user[:phone_company] = phone_company
    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    if !publisher_user.nil?
        if publisher_user.update_attributes(h_publisher_user)
            #
        else
            Rails.logger.info('user update failed')
        end
    else
        Rails.logger.info('user = nil')      
    end
    
    publisher_user = nil    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    
    email = publisher_user.email
    b_email = true
    location = publisher_user.location
    b_location = true
    name_alias = publisher_user.name_alias
    b_name_alias = true
    job_title = publisher_user.job_title
    b_job_title = true

    name_company = publisher_user.name_company
    b_name_company = true
    time_at_company = publisher_user.time_at_company
    b_time_at_company = true
    website = publisher_user.website
    b_website = true
    phone_company = publisher_user.phone_company
    b_phone_company = true
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { 
                                      :b_name_first => b_name_first,
                                      :name_first => name_first, 
                                      :b_name_last => b_name_last,
                                      :name_last => name_last,
                                      :b_email => b_email,
                                      :email => email,
                                      :b_location => b_location,
                                      :location => location,
                                      :b_name_alias => b_name_alias,
                                      :name_alias => name_alias,                                      
                                      :b_job_title => b_job_title,
                                      :job_title => job_title,
                                      :b_name_company => b_name_company,
                                      :name_company => name_company,
                                      :b_time_at_company => b_time_at_company,
                                      :time_at_company => time_at_company,
                                      :b_website => b_website,
                                      :website => website,
                                      :b_phone_company => b_phone_company,
                                      :phone_company => phone_company                                                                     
                                    } 
                  }
    end


    # publisher_product_description = nil
    # publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    # b_name_product = false
    # b_required = true
    # publisher_product_description_name_product = "Product Name"      
    # if !((publisher_product_description_updated.name_product.blank?) or (publisher_product_description_updated.name_product.empty?) or (publisher_product_description_updated.name_product.nil?)) 
        # publisher_product_description_name_product = publisher_product_description_updated.name_product
        # b_name_product = true
        # b_required = false      
    # end
    
    
  end



  def get_gender_text(gender)
    
      gender_text = 0
      
      case gender.to_s
      when "0"
        gender_text = "Male"
      when "1"
        gender_text = "Female"
      else
        # 
      end
  
      return gender_text    
  end


  def get_bd_month_text(bd_month)
    
      bd_month_text = ""
      
      case bd_month.to_s
      when "1"
        bd_month_text = "January"
      when "2"
        bd_month_text = "February"
      when "3"
        bd_month_text = "March"
      when "4"
        bd_month_text = "April"
      when "5"
        bd_month_text = "May"
      when "6"
        bd_month_text = "June"
      when "7"
        bd_month_text = "July"
      when "8"
        bd_month_text = "August"
      when "9"
        bd_month_text = "September"
      when "10"
        bd_month_text = "October"
      when "11"
        bd_month_text = "November"
      when "12"
        bd_month_text = "December"
      else
        # 
      end
      
      return bd_month_text
  end


  def update_story_6
    
    ar = params[:user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    name_first = h_obj[:name_first]
    name_last = h_obj[:name_last]
    email = h_obj[:email]
    gender = h_obj[:gender]
    email = h_obj[:email]
    bd_month = h_obj[:bd_month]
    bd_day = h_obj[:bd_day]
    bd_year = h_obj[:bd_year]
    
    h_user = Hash.new
    h_user[:name_first] = name_first
    h_user[:name_last] = name_last
    h_user[:email] = email
    h_user[:gender] = gender
    h_user[:gender_text] = get_gender_text(gender)
    h_user[:bd_month] = bd_month
    h_user[:bd_month_text] = get_bd_month_text(bd_month)
    h_user[:bd_day] = bd_day
    h_user[:bd_year] = bd_year
    
    user = User.find(current_user.id) rescue nil
    if !user.nil?
        if user.update_attributes(h_user)
            #
        else
            Rails.logger.info('user update failed')
        end
    else
        Rails.logger.info('user = nil')      
    end

    user = nil
    user = User.find(current_user.id) rescue nil
    # name_first = "first name"
    if !user.nil?
      current_user=(user)
    else
      #
    end

    name_first = current_user.name_first
    b_name_first = true
    name_last = current_user.name_last
    b_name_last = true
    email = current_user.email
    b_email = true
    gender = current_user.gender
    b_gender = true    
    gender_text = current_user.gender_text
    b_gender_text = true    
    bd_month = current_user.bd_month
    b_bd_month = true
    bd_month_text = current_user.bd_month_text
    b_bd_month_text = true
    bd_day = current_user.bd_day
    b_bd_day = true
    bd_year = current_user.bd_year
    b_bd_year = true
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { 
                                      :b_name_first => b_name_first,
                                      :name_first => name_first, 
                                      :b_name_last => b_name_last,
                                      :name_last => name_last,
                                      :b_email => b_email,
                                      :email => email,
                                      :b_gender => b_gender,
                                      :gender => gender,
                                      :b_gender_text => b_gender_text,
                                      :gender_text => gender_text,
                                      :b_bd_month => b_bd_month,
                                      :bd_month => bd_month,
                                      :b_bd_month_text => b_bd_month_text,
                                      :bd_month_text => bd_month_text,
                                      :b_bd_day => b_bd_day,
                                      :bd_day => bd_day,
                                      :b_bd_year => b_bd_year,
                                      :bd_year => bd_year                                      
                                    } 
                  }
    end


  end


  def update_publisher_user_plot

    plot_text = params[:publisher_user_plot][:plot_text]
    h_publisher_user_plot = Hash.new
    h_publisher_user_plot[:plot_text] = plot_text
    # publisher_user_plot = UserPlot.where("publisher_user_plot_id = ?", current_user.publisher_user.publisher_user_plot.id).first rescue nil
    publisher_user_plot = current_user.publisher_user.publisher_user_plot rescue nil
    if !publisher_user_plot.nil?
        if publisher_user_plot.update_attributes(h_publisher_user_plot)
            #
        else
            Rails.logger.info('publisher_user_plot update failed')
        end
    else
        Rails.logger.info('publisher_user_plot = nil')      
    end

    @publisher_user = nil
    publisher_user = current_user.publisher_user rescue nil
    if !publisher_user.nil?
        @publisher_user = publisher_user
    else
        # error
    end
    
    
  end


  # def update_publisher_user_interest
    # interest_text = params[:publisher_user_interest][:interest_text]
    # h_publisher_user_interest = Hash.new
    # h_publisher_user_interest[:interest_text] = interest_text
    # # publisher_user_interest = UserPlot.where("publisher_user_interest_id = ?", current_user.publisher_user.publisher_user_interest.id).first rescue nil
    # publisher_user_interest = current_user.publisher_user.publisher_user_interest rescue nil
    # if !publisher_user_interest.nil?
        # if publisher_user_interest.update_attributes(h_publisher_user_interest)
            # #
        # else
            # Rails.logger.info('publisher_user_interest update failed')
        # end
    # else
        # Rails.logger.info('publisher_user_interest = nil')      
    # end
    # @publisher_user = nil
    # publisher_user = current_user.publisher_user rescue nil
    # if !publisher_user.nil?
        # @publisher_user = publisher_user
    # else
        # # error
    # end
  # end
  
  # def update_story_2
    # # ar = params[:publisher]
    # # h_obj = Hash.new
    # # ar.each do |obj|
      # # h_obj = obj
    # # end
    # # story_plot = h_obj[:story_plot]
    # story_plot = params[:story_plot]
    # h_publisher_user = Hash.new
    # h_publisher_user[:story_plot] = story_plot
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
        # if publisher_user.update_attributes(h_publisher_user)
            # #
        # else
            # # Rails.logger.info('user update failed')
        # end
    # else
        # # Rails.logger.info('user = nil')      
    # end
    # publisher_user = nil    
    # @publisher_user = nil
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
      # @publisher_user = publisher_user
    # else
      # #
    # end
  # end
  
  
  
  def update_publisher_user_interest
    
      Rails.logger.info('update_publisher_user_interest')
      
      begin
        
          ar = params[:publisher_user]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          # publisher_product_id = h_obj[:publisher_product_id]
          interest_text = h_obj[:interest_text]
      
          b_interest_text = false
          b_required = false
          b_error = true
          publisher_user_interest_text = nil
          
          # publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil
          publisher_user = current_user.publisher_user rescue nil
          if !publisher_user.nil?
              publisher_user_interest = publisher_user.publisher_user_interest rescue nil            
              if !publisher_user_interest.nil?  
                  h_update = Hash.new
                  h_update[:interest_text] = interest_text
                  if publisher_user_interest.update_attributes(h_update)
                      publisher_user_interest_text_updated = publisher_user_interest.interest_text rescue nil
                      if !publisher_user_interest_text_updated.nil?
                          if !((publisher_user_interest_text_updated.blank?) or (publisher_user_interest_text_updated.empty?) or (publisher_user_interest_text_updated.nil?))
                              publisher_user_interest_text = publisher_user_interest_text_updated 
                              b_interest_text = true
                              b_required = false      
                          else
                              b_interest_text = false
                              b_required = false
                          end
                          
                          respond_to do |format|
                              format.html {}
                              format.json { render :json => { :interest_text => publisher_user_interest_text,
                                                              :b_interest_text => b_interest_text,
                                                              :b_required => b_required,  
                                                              :b_error => false,                                        
                                                              :updated => publisher_user.updated_at.to_s(:long) } }
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'update_story_3', :description => 'publisher_user_interest_text_updated was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'update_story_3', :description => 'publisher_user update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'update_story_3', :description => 'publisher_user_interest was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'update_story_3', :description => 'publisher_user was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'update_story_3', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end
  

  # def update_story_3
    # # ar = params[:publisher]
    # # h_obj = Hash.new
    # # ar.each do |obj|
      # # h_obj = obj
    # # end
    # # story_interest = h_obj[:story_interest]
    # story_interest = params[:story_interest]
    # h_publisher_user = Hash.new
    # h_publisher_user[:story_interest] = story_interest
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
        # if publisher_user.update_attributes(h_publisher_user)
            # #
        # else
            # # Rails.logger.info('user update failed')
        # end
    # else
        # # Rails.logger.info('user = nil')      
    # end
    # publisher_user = nil    
    # @publisher_user = nil
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
      # @publisher_user = publisher_user
    # else
      # #
    # end
  # end
  


  

  def create_log_user_like
    
      @nlist = params[:n_list]
      post_user_id = params[:post_user_id]
      @log_user = nil
      @b_has_like = false
      
      h_post_user_like = Hash.new
      h_post_user_like[:post_user_id] = post_user_id
      h_post_user_like[:user_id] = current_user.id
      post_user_like = PostUserLike.new(h_post_user_like)
      # post_user_like = current_user.post_users.build(post_user_like_params)
      if post_user_like.save
          post_user = PostUser.find_by_id(post_user_id) rescue nil        
          if !post_user.nil?
              @log_user = post_user
              @b_has_like = true
          else
              #
          end          
      else
          #
      end
      
  end
  
  
  def destroy_log_user_like
    
      @nlist = params[:n_list]
      post_user_id = params[:post_user_id]
      @log_user = nil
      @b_has_like = true
    
      post_user_likes = PostUserLike.where('post_user_id = ?', post_user_id)
      if post_user_likes.any?
          post_user_like = post_user_likes.where('user_id = ?', current_user.id).first rescue nil
          if !post_user_like.nil?
              if post_user_like.destroy
                  post_user = PostUser.find(post_user_id) rescue nil
                  if !post_user.nil?
                      @log_user = post_user
                      @b_has_like = false
                  else
                      #
                  end                          
                  # Rails.logger.info "post_user_like destroyed"
              else      
                  # Rails.logger.info "publisher_user_logo_image destroy failed"
              end
          else
              # Rails.logger.info "post_user_like = nil"
          end
      else
          #
      end

    
  end

  
  
  # def show_all_images
    # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    # # if !publisher_user.nil?
      # # @publisher_user = publisher_user
      # # @publisher_user_id = publisher_user.id
      # # publisher_id = publisher_user.publisher_id
      # # @publisher_id = publisher_id
      # # publisher = Publisher.find_by_id(publisher_id)
      # # if !publisher.nil?
        # # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
        # # @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first        
      # # else
        # # #
      # # end
    # # else
      # # #
    # # end
  # end



  # def destroy_publisher_user_image
    # @post_users = nil
    # @publisher_user_image = nil
    # publisher_user_image = UserImage.find(params[:id]) rescue nil
    # if !publisher_user_image.nil?
        # if publisher_user_image.destroy
            # @post_users = current_user.feed
        # else      
            # #
        # end
    # else
      # #
    # end
  # end
  


  # def destroy_publisher_user_logo_image
    # @publisher_user_logo_image = nil
    # publisher_user_logo_image = PublisherUserLogoImage.find(params[:id]) rescue nil
    # if !publisher_user_logo_image.nil?
        # if publisher_user_logo_image.destroy
            # # 
        # else      
            # # Rails.logger.info "publisher_user_logo_image destroy failed"
        # end
    # else
        # #Rails.logger.info "publisher_user_logo_image = nil"
    # end
  # end
  

  
  # def upload_publisher_user_image_primary
      # Rails.logger.info "in upload_publisher_user_image_primary"
      # @post_users = nil
      # @id_image = nil
      # @crop_x = 0
      # @crop_y = 0
      # @crop_w = 200
      # @crop_h = 200
      # h_user_image = Hash.new
      # h_user_image[:user_id] = current_user.id
      # h_user_image[:image] = params[:user_image][:image]
      # h_user_image[:primary] = true
      # h_user_image[:crop_x] = @crop_x
      # h_user_image[:crop_y] = @crop_y
      # h_user_image[:crop_w] = @crop_w
      # h_user_image[:crop_h] = @crop_h
      # @publisher_user_image_primary = nil
      # user_image = UserImage.new(h_user_image)
      # if request.xhr? || remotipart_submitted?
          # if user_image.save
              # user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil     
              # if !user_image_primary.nil? 
                  # # @id_image = user_image_primary.id
                  # img = user_image_primary
                  # # image = MiniMagick::Image.read("public" + img.image_url(:image_600_600))[0]
                  # image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                  # #w = image.columns
                  # #h = image.rows
                  # w = image.width
                  # h = image.height
                  # # Rails.logger.info "w = " + w.to_s
                  # # Rails.logger.info "h = " + h.to_s
                  # w_max = false
                  # h_max = false
                  # w_h_equal = false
                  # x = 0
                  # y = 0
                  # l = 0                    
                  # d = 0
                  # if ( w == h)
                      # w_h_equal = true
                  # else
                      # if ( w > h )
                        # w_max = true
                      # else
                        # h_max = true
                      # end
                  # end
                  # if w_max
                      # d = w - h
                      # d = (d/2).round
                      # x = d
                      # l = h  
                  # end
                  # if h_max
                      # d = h - w
                      # d = (d/2).round
                      # y = d
                      # l = w  
                  # end
                  # if w_h_equal
                      # l = w
                  # end
                  # @crop_x = x
                  # @crop_y = y
                  # @crop_w = l
                  # @crop_h = l
                  # h_update = Hash.new
                  # h_update[:crop_x] = x
                  # h_update[:crop_y] = y
                  # h_update[:crop_w] = l
                  # h_update[:crop_h] = l
                  # if user_image_primary.update_attributes(h_update)
                    # #                      
                  # else
                    # #  
                  # end
                  # @publisher_user_image_primary = user_image_primary
                  # @post_users = current_user.feed
              # end
          # else
            # # error save
          # end
      # else
        # # 
      # end
  # end  
  


  # def upload_publisher_user_image_primary_change
      # @post_users = nil
      # @publisher_user_image = nil
      # publisher_user_image = current_user.user_images.where( :primary => true ).first
      # if !publisher_user_image.nil?
          # if publisher_user_image.destroy
              # #
          # else      
              # #
          # end
      # else
        # #
      # end
      # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
      # # if !publisher_user.nil?
          # # publisher_user_images = publisher_user.publisher_user_images     
          # # publisher_user_image_primary = publisher_user_images.where( :primary => true ).first
          # # if !publisher_user_image_primary.nil?
              # # if publisher_user_image_primary.destroy
              # # else      
                # # #
              # # end
          # # else
            # # #
          # # end
      # # end
      # @id_image = nil
      # @crop_x = 0
      # @crop_y = 0
      # @crop_w = 200
      # @crop_h = 200
      # h_user_image = Hash.new
      # h_user_image[:user_id] = current_user.id
      # h_user_image[:image] = params[:user_image][:image]
      # h_user_image[:primary] = true
      # h_user_image[:crop_x] = @crop_x
      # h_user_image[:crop_y] = @crop_y
      # h_user_image[:crop_w] = @crop_w
      # h_user_image[:crop_h] = @crop_h
      # @publisher_user_image_primary = nil
      # user_image = UserImage.new(h_user_image)
      # if request.xhr? || remotipart_submitted?
          # if user_image.save
              # user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil     
              # if !user_image_primary.nil? 
                  # # @id_image = user_image_primary.id
                  # img = user_image_primary
                  # image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                  # w = image.width
                  # h = image.height
                  # w_max = false
                  # h_max = false
                  # w_h_equal = false
                  # x = 0
                  # y = 0
                  # l = 0                    
                  # d = 0
                  # if ( w == h)
                      # w_h_equal = true
                  # else
                      # if ( w > h )
                        # w_max = true
                      # else
                        # h_max = true
                      # end
                  # end
                  # if w_max
                      # d = w - h
                      # d = (d/2).round
                      # x = d
                      # l = h  
                  # end
                  # if h_max
                      # d = h - w
                      # d = (d/2).round
                      # y = d
                      # l = w  
                  # end
                  # if w_h_equal
                      # l = w
                  # end
                  # @crop_x = x
                  # @crop_y = y
                  # @crop_w = l
                  # @crop_h = l
                  # h_update = Hash.new
                  # h_update[:crop_x] = x
                  # h_update[:crop_y] = y
                  # h_update[:crop_w] = l
                  # h_update[:crop_h] = l
                  # if user_image_primary.update_attributes(h_update)
                    # #                      
                  # else
                    # #  
                  # end
                  # @publisher_user_image_primary = user_image_primary
                  # @post_users = current_user.feed
              # end
          # else
            # # error save
          # end
      # else
        # # 
      # end
  # end  



  # def upload_publisher_user_image
    # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    # # if !publisher_user.nil?
        # # h_publisher_user_image = Hash.new
        # # h_publisher_user_image[:image] = params[:publisher_user_image][:image]
        # # h_publisher_user_image[:user_id] = publisher_user.user_id
        # # h_publisher_user_image[:publisher_id] = publisher_user.publisher_id
        # # h_publisher_user_image[:publisher_user_id] = publisher_user.id
        # # h_publisher_user_image[:primary] = false 
        # # publisher_user_image = PublisherUserImage.new
        # # # publisher_user_image.image = params[:publisher_user_image][:image]
        # # # publisher_user_image.publisher_id = publisher_user.publisher_id
        # # # publisher_user_image.publisher_user_id = publisher_user.id
        # # # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
        # # if request.xhr? || remotipart_submitted?
            # # if publisher_user_image.save
              # # @publisher_user_images = publisher_user.publisher_user_images     
            # # else
              # # # error save
            # # end
        # # else
          # # # render text: 'Remote call failed'
        # # end
    # # else
      # # #
    # # end
  # end  



  # def upload_publisher_user_logo_image
    # @id_image_logo = nil
    # @crop_x_logo = 0
    # @crop_y_logo = 0
    # @crop_w_logo = 200
    # @crop_h_logo = 200
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
        # h_publisher_user_logo_image = Hash.new
        # h_publisher_user_logo_image[:image] = params[:publisher_user_logo_image][:image]
        # h_publisher_user_logo_image[:user_id] = publisher_user.user_id
        # h_publisher_user_logo_image[:publisher_id] = publisher_user.publisher_id
        # h_publisher_user_logo_image[:publisher_user_id] = publisher_user.id
        # h_publisher_user_logo_image[:crop_x] = @crop_x
        # h_publisher_user_logo_image[:crop_y] = @crop_y
        # h_publisher_user_logo_image[:crop_w] = @crop_w
        # h_publisher_user_logo_image[:crop_h] = @crop_h
        # publisher_user_logo_image = PublisherUserLogoImage.new(h_publisher_user_logo_image)
        # if request.xhr? || remotipart_submitted?
            # if publisher_user_logo_image.save
                # publisher_user_logo_image = publisher_user.publisher_user_logo_images.first rescue nil
                # if !publisher_user_logo_image.nil? 
                    # @id_image_logo = publisher_user_logo_image.id
                    # @publisher_user_logo_image = publisher_user_logo_image
                    # img = publisher_user_logo_image
                    # image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                    # w = image.width
                    # h = image.height
                    # w_max = false
                    # h_max = false
                    # w_h_equal = false
                    # x = 0
                    # y = 0
                    # l = 0                    
                    # d = 0
                    # if ( w == h)
                        # w_h_equal = true
                    # else
                        # if ( w > h )
                          # w_max = true
                        # else
                          # h_max = true
                        # end
                    # end
                    # if w_max
                        # d = w - h
                        # d = (d/2).round
                        # x = d
                        # l = h  
                    # end
                    # if h_max
                        # d = h - w
                        # d = (d/2).round
                        # y = d
                        # l = w  
                    # end
                    # if w_h_equal
                        # l = w
                    # end
                    # @crop_x_logo = x
                    # @crop_y_logo = y
                    # @crop_w_logo = l
                    # @crop_h_logo = l
                    # h_update = Hash.new
                    # h_update[:crop_x] = x
                    # h_update[:crop_y] = y
                    # h_update[:crop_w] = l
                    # h_update[:crop_h] = l
                    # if publisher_user_logo_image.update_attributes(h_update)
                      # #                      
                    # else
                      # #  
                    # end
                # else
                  # Rails.logger.info "publisher_user_logo_image = nil"
                # end
            # else
              # # error save
            # end
        # else
          # # 
        # end
    # else
      # #
    # end
    # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # # if !publisher_user.nil?
        # # h_publisher_user_logo_image = Hash.new
        # # h_publisher_user_logo_image[:image] = params[:publisher_user_logo_image][:image]
        # # h_publisher_user_logo_image[:user_id] = publisher_user.user_id
        # # h_publisher_user_logo_image[:publisher_id] = publisher_user.publisher_id
        # # h_publisher_user_logo_image[:publisher_user_id] = publisher_user.id
        # # # h_publisher_user_logo_image[:primary] = false 
        # # publisher_user_logo_image = PublisherUserLogoImage.new(h_publisher_user_logo_image)
        # # if request.xhr? || remotipart_submitted?
            # # if publisher_user_logo_image.save
              # # # @publisher_user_logo_images = publisher_user.publisher_user_images.first     
              # # # @publisher_user_logo_image = @publisher_user_logo_images.where().first
              # # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", publisher_user.id).first rescue nil
            # # else
              # # # error save
            # # end
        # # else
          # # # render text: 'Remote call failed'
        # # end
    # # else
      # # #
    # # end
  # end  



  # def upload_publisher_user_logo_image_change
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
        # publisher_user_logo_images = publisher_user.publisher_user_logo_images     
        # publisher_user_logo_image = publisher_user_logo_images.first
        # if !publisher_user_logo_image.nil?
            # if publisher_user_logo_image.destroy
            # else      
              # #
            # end
        # else
            # #
        # end
    # end
    # @id_image_logo = nil
    # @crop_x_logo = 0
    # @crop_y_logo = 0
    # @crop_w_logo = 200
    # @crop_h_logo = 200
    # if !publisher_user.nil?
        # h_publisher_user_logo_image = Hash.new
        # h_publisher_user_logo_image[:image] = params[:publisher_user_logo_image][:image]
        # h_publisher_user_logo_image[:user_id] = publisher_user.user_id
        # h_publisher_user_logo_image[:publisher_id] = publisher_user.publisher_id
        # h_publisher_user_logo_image[:publisher_user_id] = publisher_user.id
        # h_publisher_user_logo_image[:crop_x] = @crop_x
        # h_publisher_user_logo_image[:crop_y] = @crop_y
        # h_publisher_user_logo_image[:crop_w] = @crop_w
        # h_publisher_user_logo_image[:crop_h] = @crop_h
        # publisher_user_logo_image = PublisherUserLogoImage.new(h_publisher_user_logo_image)
        # if request.xhr? || remotipart_submitted?
            # if publisher_user_logo_image.save
                # publisher_user_logo_image = publisher_user.publisher_user_logo_images.first rescue nil
                # if !publisher_user_logo_image.nil? 
                    # @id_image_logo = publisher_user_logo_image.id
                    # @publisher_user_logo_image = publisher_user_logo_image
                    # img = publisher_user_logo_image
                    # image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                    # w = image.width
                    # h = image.height
                    # w_max = false
                    # h_max = false
                    # w_h_equal = false
                    # x = 0
                    # y = 0
                    # l = 0                    
                    # d = 0
                    # if ( w == h)
                        # w_h_equal = true
                    # else
                        # if ( w > h )
                          # w_max = true
                        # else
                          # h_max = true
                        # end
                    # end
                    # if w_max
                        # d = w - h
                        # d = (d/2).round
                        # x = d
                        # l = h  
                    # end
                    # if h_max
                        # d = h - w
                        # d = (d/2).round
                        # y = d
                        # l = w  
                    # end
                    # if w_h_equal
                        # l = w
                    # end
                    # @crop_x_logo = x
                    # @crop_y_logo = y
                    # @crop_w_logo = l
                    # @crop_h_logo = l
                    # h_update = Hash.new
                    # h_update[:crop_x] = x
                    # h_update[:crop_y] = y
                    # h_update[:crop_w] = l
                    # h_update[:crop_h] = l
                    # if publisher_user_logo_image.update_attributes(h_update)
                      # #                      
                    # else
                      # #  
                    # end
                # else
                  # Rails.logger.info "publisher_user_logo_image = nil"
                # end
            # else
              # # error save
            # end
        # else
          # # 
        # end
    # else
      # #
    # end
    # # respond_to do |format|
      # # format.html
      # # # format.js
      # # # format.js { render :js => "window.location.replace('#{article_path(@article)}');"}
      # # format.js { render :js => { :id_image => id_image,
                                  # # :crop_x => crop_x,
                                  # # :crop_y => crop_y,
                                  # # :crop_w => crop_w,
                                  # # :crop_h => crop_h
                                # # }
                # # }
    # # end
  # end  





  # def cropped_image(image, params)
      # # image = MiniMagick::Image.open(self.image.path)
      # crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
      # image.crop(crop_params)
      # image
  # end
  # def resize_to_fill(image, width, height)
      # cols, rows = image[:dimensions]
      # image.combine_options do |cmd|
        # if width != cols || height != rows
          # scale_x = width/cols.to_f
          # scale_y = height/rows.to_f
          # if scale_x >= scale_y
            # cols = (scale_x * (cols + 0.5)).round
            # rows = (scale_x * (rows + 0.5)).round
            # cmd.resize "#{cols}"
          # else
            # cols = (scale_y * (cols + 0.5)).round
            # rows = (scale_y * (rows + 0.5)).round
            # cmd.resize "x#{rows}"
          # end
        # end
        # cmd.gravity 'Center'
        # cmd.background "rgba(255,255,255,0.0)"
        # cmd.extent "#{width}x#{height}" if cols != width || rows != height
      # end
      # image
  # end
      
  # def crop_commit_user
      # img = UserImage.find(params[:image_id])
      # image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # # Rails.logger.info "image.details = " + image.details.to_s
      # # new_image_200_200 = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # # new_image_100_100 = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # # new_image_50_50   = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # # new_image_34_34   = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # # new_image_200_200 = cropped_image(new_image_200_200, params)
      # # new_image_100_100 = cropped_image(new_image_100_100, params)
      # # new_image_50_50   = cropped_image(new_image_50_50, params)
      # # new_image_34_34   = cropped_image(new_image_34_34, params)
      # # new_image_200_200 = resize_to_fill(new_image_200_200, 200, 200)
      # # new_image_100_100 = resize_to_fill(new_image_100_100, 100, 100)
      # # new_image_50_50   = resize_to_fill(new_image_50_50, 50, 50)
      # # new_image_34_34   = resize_to_fill(new_image_34_34, 34, 34)
      # # new_image_200_200.write image_200_200_path
      # # new_image_100_100.write image_100_100_path
      # # new_image_50_50.write image_50_50_path
      # # new_image_34_34.write image_34_34_path
      # crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
      # new_image = image.crop(crop_params)
      # img_name = File.basename(img.image.to_s)
      # img_dir = "public" + File.dirname(img.image.to_s)
      # image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
      # image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
      # image_50_50_path   = img_dir + "/" + "image_50_50_" + img_name
      # image_34_34_path   = img_dir + "/" + "image_34_34_" + img_name
      # FileUtils.rm_rf(image_200_200_path) 
      # FileUtils.rm_rf(image_100_100_path) 
      # FileUtils.rm_rf(image_50_50_path) 
      # FileUtils.rm_rf(image_34_34_path) 
      # new_image.resize('200x200')
      # new_image.write image_200_200_path
      # new_image.resize('100x100')
      # new_image.write image_100_100_path      
      # new_image.resize('50x50')
      # new_image.write image_50_50_path      
      # new_image.resize('34x34')
      # new_image.write image_34_34_path
      # x = params[:crop_x]
      # y = params[:crop_y]
      # w = params[:crop_w]
      # h = params[:crop_h]
      # x = x.to_i
      # y = y.to_i
      # w = w.to_i
      # h = h.to_i
      # h_crop = Hash.new
      # h_crop[:crop_x] = x
      # h_crop[:crop_y] = y
      # h_crop[:crop_w] = w
      # h_crop[:crop_h] = h
      # @post_users = nil    
      # @publisher_user_image_primary = nil
      # publisher_user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil
      # if !publisher_user_image_primary.nil?
          # if publisher_user_image_primary.update_attributes(h_crop)
              # @publisher_user_image_primary = publisher_user_image_primary  
              # @post_users = current_user.feed
          # else
            # #
          # end
      # else
        # #
      # end
  # end



  # def crop_commit_logo
      # # x = params[:crop_x]
      # # y = params[:crop_y]
      # # w = params[:crop_w]
      # # h = params[:crop_h]
# #   
      # # img = PublisherUserLogoImage.find(params[:image_id])
      # # image = Magick::Image.read("public" + img.image_url(:image_600_600))[0]
# #   
      # # x = x.to_i
      # # y = y.to_i
      # # w = w.to_i
      # # h = h.to_i
      # # image_new = image.crop(x, y, w, h)
# #   
      # # new_user_200_200 = image_new.resize_to_fill(200, 200)    
      # # new_user_100_100 = image_new.resize_to_fill(100, 100)    
      # # new_user_50_50 = image_new.resize_to_fill(50, 50)
      # # new_user_34_34 = image_new.resize_to_fill(34, 34)
# #   
      # # user_200_200 = Magick::Image.read("public" + img.image_url(:user_200_200))[0]    
      # # user_100_100 = Magick::Image.read("public" + img.image_url(:user_100_100))[0]
      # # user_50_50 = Magick::Image.read("public" + img.image_url(:user_50_50))[0]
      # # user_34_34 = Magick::Image.read("public" + img.image_url(:user_34_34))[0]
# #   
      # # # public/uploads/publisher_user_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
# #   
      # # user_200_200_filename = user_200_200.filename
      # # user_100_100_filename = user_100_100.filename
      # # user_50_50_filename = user_50_50.filename
      # # user_34_34_filename = user_34_34.filename
# #   
      # # FileUtils.rm_rf(Dir.glob(user_200_200.filename))
      # # FileUtils.rm_rf(Dir.glob(user_100_100.filename))
      # # FileUtils.rm_rf(Dir.glob(user_50_50.filename))
      # # FileUtils.rm_rf(Dir.glob(user_34_34.filename))
# #       
      # # new_user_200_200.write user_200_200_filename
      # # new_user_100_100.write user_100_100_filename
      # # new_user_50_50.write user_50_50_filename
      # # new_user_34_34.write user_34_34_filename
# #   
      # # h_crop = Hash.new
      # # h_crop[:crop_x] = x
      # # h_crop[:crop_y] = y
      # # h_crop[:crop_w] = w
      # # h_crop[:crop_h] = h
# #   
      # # @publisher_user_logo_image = nil
      # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
      # # if !publisher_user.nil?
          # # publisher_user_logo_image = publisher_user.publisher_user_logo_images.first rescue nil
          # # if !publisher_user_logo_image.nil?
              # # if publisher_user_logo_image.update_attributes(h_crop)
                  # # @publisher_user_logo_image = publisher_user_logo_image  
              # # else
                # # #
              # # end
          # # else
            # # #
          # # end
      # # else
        # # #
      # # end
#     
#     
  # end


  def dbdelete

      # PublisherProfileImage.dbdelete
      # PublisherProfileImage.dbclear

      # Publisher.dbdelete
      # Publisher.dbclear
      
      # User.dbdelete
      # User.dbclear

      # UserProfileImage.dbdelete
      # UserProfileImage.dbclear

      # Publisher.dbdelete
      # Publisher.dbclear

      # PublisherUser.dbdelete
      # PublisherUser.dbclear

      # PublisherMember.dbdelete
      # PublisherMember.dbclear

      PublisherUserImage.dbdelete
      PublisherUserImage.dbclear

      # PublisherProduct.dbdelete
      # PublisherProduct.dbclear

      # PublisherProductDescription.dbdelete
      # PublisherProductDescription.dbclear

      # PublisherProductImage.dbdelete
      # PublisherProductImage.dbclear

      # PublisherProduct1Image.dbdelete
      # PublisherProduct1Image.dbclear

      # PublisherProduct2Image.dbdelete
      # PublisherProduct2Image.dbclear

      # PublisherProductLogo.dbdelete
      # PublisherProductLogo.dbclear

      # PublisherProductCorporateLogo.dbdelete
      # PublisherProductCorporateLogo.dbclear

      # PublisherProductPdf.dbdelete
      # PublisherProductPdf.dbclear

      # PublisherProductPdfImage.dbdelete
      # PublisherProductPdfImage.dbclear

      # PublisherProductContentType.dbdelete
      # PublisherProductContentType.dbclear

      # PublisherProductCategorySubject.dbdelete
      # PublisherProductCategorySubject.dbclear

      # PublisherProductAppropriateAge.dbdelete
      # PublisherProductAppropriateAge.dbclear

      # PublisherProductAppropriateGrade.dbdelete
      # PublisherProductAppropriateGrade.dbclear

      # PublisherProductMarketTarget.dbdelete
      # PublisherProductMarketTarget.dbclear

      # PublisherProductPlatform.dbdelete
      # PublisherProductPlatform.dbclear

      # PublisherProductFileType.dbdelete
      # PublisherProductFileType.dbclear

      # PublisherProductCharacter.dbdelete
      # PublisherProductCharacter.dbclear

      # PublisherProductEnhancement.dbdelete
      # PublisherProductEnhancement.dbclear

      # PublisherProductByReview.dbdelete
      # PublisherProductByReview.dbclear

      # PublisherProductPricingModel.dbdelete
      # PublisherProductPricingModel.dbclear

      # PublisherProductPrice.dbdelete
      # PublisherProductPrice.dbclear

      # PublisherProductLessonTime.dbdelete
      # PublisherProductLessonTime.dbclear

      # PublisherProductCoreLiteracyStandard.dbdelete
      # PublisherProductCoreLiteracyStandard.dbclear

      # PublisherProductCoreMathStandard.dbdelete
      # PublisherProductCoreMathStandard.dbclear


      redirect_to '/Publisher-Admin'      
      
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end

  end

  # def fullscreen
      # @user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil
      # render 'publisher_users/fullscreen', :layout => 'user_fullscreen'      
  # end
  
  
  def knowcred
    render :layout => 'publisher_users_knowcred'
  end
  

  
  def upload_background_1_image
    
      @errors = false
      
      begin
           
          # @background_image_1 = nil
          # @background_image_1_id = nil
          # @background_image_1_url = nil
          # @publisher_product = nil
          # @crop_x_background_image_1 = 0
          # @crop_y_background_image_1 = 0
          # @crop_w_background_image_1 = 100
          # @crop_h_background_image_1 = 25
          
          if request.xhr? || remotipart_submitted?
              image = params[:publisher_user_background_image][:image]
              if !image.nil?
                  publisher = current_user.publisher rescue nil
                  if !publisher.nil?
                      publisher_user = current_user.publisher_user rescue nil
                      if !publisher_user.nil?
                          h_new = Hash.new
                          h_new[:user_id] = current_user.id
                          h_new[:publisher_id] = publisher.id
                          h_new[:publisher_user_id] = publisher_user.id
                          h_new[:image] = image
                          h_new[:primary] = true
                          # h_image[:crop_x] = @crop_x
                          # h_image[:crop_y] = @crop_y
                          # h_image[:crop_w] = @crop_w
                          # h_image[:crop_h] = @crop_h
                          publisher_user_background_image = PublisherUserBackgroundImage.new(h_new)
                          if publisher_user_background_image.save
                              img = publisher_user_background_image
                              image = MiniMagick::Image.open("public" + img.image_url(:image_500_500))
                              w = image.width
                              h = image.height
    
                              # # Background aspect ratio (1200:300 or 4:1)
                              bkgrnd_asp_ratio = 4
                              crop_w = image.width
                              crop_h = (image.width / bkgrnd_asp_ratio).round
                              crop_x = 0
                              crop_y = ((image.height - crop_h) / 2).round
    
                              h_update = Hash.new
                              h_update[:crop_x] = crop_x
                              h_update[:crop_y] = crop_y
                              h_update[:crop_w] = crop_w
                              h_update[:crop_h] = crop_h
                              
                              if publisher_user_background_image.update_attributes(h_update)
                                  gon.background_1_image_id = publisher_user_background_image.id
                                  @background_1_image = publisher_user_background_image
                                  @background_1_image_id = publisher_user_background_image.id
                                  @background_1_image_url = publisher_user_background_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                                  @crop_x_background_1_image = publisher_user_background_image.crop_x
                                  @crop_y_background_1_image = publisher_user_background_image.crop_y
                                  @crop_w_background_1_image = publisher_user_background_image.crop_w
                                  @crop_h_background_1_image = publisher_user_background_image.crop_h

                                  primary_1_image = publisher_user.publisher_user_images.where(:primary => true).first rescue nil
                                  @primary_1_image = primary_1_image
                                  if !primary_1_image.nil?
                                    @primary_1_image_id = primary_1_image.id
                                    gon.primary_1_image_id = primary_1_image.id
                                    @crop_x_primary_1_image = primary_1_image.crop_x
                                    @crop_y_primary_1_image = primary_1_image.crop_y
                                    @crop_w_primary_1_image = primary_1_image.crop_w
                                    @crop_h_primary_1_image = primary_1_image.crop_h
                                  else
                                    @primary_1_image_id = nil
                                    gon.primary_1_image_id = nil
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => 'publisher_user_background_image updated_attributes failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => 'publisher_user_background_image save failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => 'publisher_user was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => 'publisher was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => 'image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => 'request remotipart failed')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_background_1_image_change

      @errors = false
      
      begin
           
          if request.xhr? || remotipart_submitted?
              image = params[:publisher_user_background_image][:image]
              if !image.nil?
                  background_image_id_delete = params[:publisher_user_background_image][:background_image_1_id]
                  if !background_image_id_delete.nil?
                      publisher = current_user.publisher rescue nil
                      if !publisher.nil?
                          publisher_user = current_user.publisher_user rescue nil
                          if !publisher_user.nil?
                              publisher_user_background_image_delete = publisher_user.publisher_user_background_images.where("id = ?", background_image_id_delete).first rescue nil
                              if !publisher_user_background_image_delete.nil?
                                  if publisher_user_background_image_delete.destroy
                                      h_new = Hash.new
                                      h_new[:user_id] = current_user.id
                                      h_new[:publisher_id] = publisher.id
                                      h_new[:publisher_user_id] = publisher_user.id
                                      h_new[:image] = image
                                      h_new[:primary] = true
                                      # h_image[:crop_x] = @crop_x
                                      # h_image[:crop_y] = @crop_y
                                      # h_image[:crop_w] = @crop_w
                                      # h_image[:crop_h] = @crop_h
                                      publisher_user_background_image = PublisherUserBackgroundImage.new(h_new)
                                      if publisher_user_background_image.save
                                          img = publisher_user_background_image
                                          image = MiniMagick::Image.open("public" + img.image_url(:image_500_500))
                                          w = image.width
                                          h = image.height
                
                                          # # Background aspect ratio (1200:300 or 4:1)
                                          bkgrnd_asp_ratio = 4
                                          crop_w = image.width
                                          crop_h = (image.width / bkgrnd_asp_ratio).round
                                          crop_x = 0
                                          crop_y = ((image.height - crop_h) / 2).round
                
                                          h_update = Hash.new
                                          h_update[:crop_x] = crop_x
                                          h_update[:crop_y] = crop_y
                                          h_update[:crop_w] = crop_w
                                          h_update[:crop_h] = crop_h
                                          
                                          if publisher_user_background_image.update_attributes(h_update)
                                              gon.background_1_image_id = publisher_user_background_image.id
                                              @background_1_image = publisher_user_background_image
                                              @background_1_image_id = publisher_user_background_image.id
                                              @background_1_image_url = publisher_user_background_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                                              @crop_x_background_1_image = publisher_user_background_image.crop_x
                                              @crop_y_background_1_image = publisher_user_background_image.crop_y
                                              @crop_w_background_1_image = publisher_user_background_image.crop_w
                                              @crop_h_background_1_image = publisher_user_background_image.crop_h
            
                                              primary_1_image = publisher_user.publisher_user_images.where(:primary => true).first rescue nil
                                              @primary_1_image = primary_1_image
                                              if !primary_1_image.nil?
                                                @primary_1_image_id = primary_1_image.id
                                                gon.primary_1_image_id = primary_1_image.id
                                                @crop_x_primary_1_image = primary_1_image.crop_x
                                                @crop_y_primary_1_image = primary_1_image.crop_y
                                                @crop_w_primary_1_image = primary_1_image.crop_w
                                                @crop_h_primary_1_image = primary_1_image.crop_h
                                              else
                                                @primary_1_image_id = nil
                                                gon.primary_1_image_id = nil
                                              end
                                          else
                                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'publisher_user_background_image updated_attributes failed')
                                              raise
                                          end
                                      else
                                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'publisher_user_background_image save failed')
                                          raise
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'publisher_user_background_image_delete destroy failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'publisher_user_background_image_delete was nil')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'publisher_user was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'publisher was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'background_image_id_delete was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => 'request remotipart failed')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_background_image_1_change', :description => e.message.to_s)
          @errors = true
          
      end


  end
  
  

  def crop_background_1_image

      @errors = false
      
      begin
        
          background_image_id = params[:background_image_id]
          params_crop_x = params[:crop_x]
          params_crop_y = params[:crop_y]
          params_crop_w = params[:crop_w]
          params_crop_h = params[:crop_h]

          @background_1_image = nil
          @background_1_image_id = nil
          gon.background_1_image_id = nil

          @primary_1_image_id = nil
          gon.primary_1_image_id = nil


          if !background_image_id.nil?
              if !params_crop_x.nil?
                  if !params_crop_y.nil?
                      if !params_crop_w.nil?
                          if !params_crop_h.nil?
                              publisher_user = current_user.publisher_user
                              if !publisher_user.nil?
                                  publisher_user_background_image = publisher_user.publisher_user_background_images.where("id = ?", background_image_id).first rescue nil
                                  # Rails.logger.info("publisher_user_background_image.image_url = " + publisher_user_background_image.image_url.to_s)
                                  if !publisher_user_background_image.nil?
                                      image = MiniMagick::Image.open("public" + publisher_user_background_image.image_url)
                                      image_500_500 = MiniMagick::Image.open("public" + publisher_user_background_image.image_url(:image_500_500))
                                      if(image.width >= image.height)
                                          crop_scale = image.width / image_500_500.width.to_f
                                      else
                                          crop_scale = image.height / image_500_500.height.to_f
                                      end
                                      
                                      crop_x = (params_crop_x.to_i * crop_scale).to_i
                                      crop_y = (params_crop_y.to_i * crop_scale).to_i
                                      crop_w = (params_crop_w.to_i * crop_scale).to_i
                                      crop_h = (params_crop_h.to_i * crop_scale).to_i
                        
                                      crop_params = "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
                                      new_image = image.crop(crop_params)
                        
                                      img_name = File.basename(publisher_user_background_image.image.to_s)
                                      img_dir = "public" + File.dirname(publisher_user_background_image.image.to_s)
                        
                                      image_1200_300_path = img_dir + "/" + "image_1200_300_fill_" + img_name
                        
                                      FileUtils.rm_rf(image_1200_300_path)
                        
                                      new_image.resize('1200x300')
                                      new_image.write image_1200_300_path
                        
                                      publisher_user_background_image_cropped = publisher_user.publisher_user_background_images.where("id = ?", background_image_id).first rescue nil
                                      if !publisher_user_background_image_cropped.nil? 
                                          h_update = Hash.new
                                          h_update[:crop_x] = params_crop_x
                                          h_update[:crop_y] = params_crop_y
                                          h_update[:crop_w] = params_crop_w
                                          h_update[:crop_h] = params_crop_h
                                          if publisher_user_background_image_cropped.update_attributes(h_update)
                                              background_1_image = publisher_user_background_image_cropped
                                              if !background_1_image.nil?
                                                  gon.background_1_image_id = background_1_image.id
                                                  @background_1_image = background_1_image
                                                  @background_1_image_id = background_1_image.id
                                                  @background_1_image_url = background_1_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                                                  @crop_x_background_1_image = background_1_image.crop_x
                                                  @crop_y_background_1_image = background_1_image.crop_y
                                                  @crop_w_background_1_image = background_1_image.crop_w
                                                  @crop_h_background_1_image = background_1_image.crop_h
                                              else
                                                  @background_1_image_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                                              end
                                              
                                              primary_1_image = publisher_user.publisher_user_images.where(:primary => true).first rescue nil
                                              @primary_1_image = primary_1_image
                                              if !primary_1_image.nil?
                                                  @primary_1_image_id = primary_1_image.id
                                                  gon.primary_1_image_id = primary_1_image.id
                                                  @crop_x_primary_1_image = primary_1_image.crop_x
                                                  @crop_y_primary_1_image = primary_1_image.crop_y
                                                  @crop_w_primary_1_image = primary_1_image.crop_w
                                                  @crop_h_primary_1_image = primary_1_image.crop_h
                                              end
                                          else
                                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'publisher_user_background_image_cropped update_attributes failed')
                                              raise
                                          end
                                      else
                                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'publisher_user_background_image_cropped was nil')
                                          raise
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'publisher_user_background_image was nil')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'publisher_user was nil')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'params_crop_h was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'params_crop_w was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'params_crop_y was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'params_crop_x was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => 'background_image_id was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_background_1_image', :description => e.message.to_s)
          @errors = true
          
      end


  end

  

  def destroy_background_1_image
    
    
      begin
        
          ar = params[:publisher_user]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          background_image_id = h_obj[:background_image_1_id]
          image_id = h_obj[:image_1_id]

          gon.primary_1_image_id = nil
          
          
          if !background_image_id.nil?
              publisher_user = current_user.publisher_user rescue nil
              if !publisher_user.nil?
                  publisher_user_background_image = publisher_user.publisher_user_background_images.where("id = ?", background_image_id).first rescue nil
                  if !publisher_user_background_image.nil?
                      if publisher_user_background_image.destroy
                          @background_1_image = nil
                          gon.background_1_image_id = nil
                          @background_1_image_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                          
                          primary_1_image = publisher_user.publisher_user_images.where("id = ?", image_id).first rescue nil
                          @primary_1_image = primary_1_image
                          if !primary_1_image.nil?
                            gon.primary_1_image_id = primary_1_image.id
                            @crop_x_primary_1_image = primary_1_image.crop_x
                            @crop_y_primary_1_image = primary_1_image.crop_y
                            @crop_w_primary_1_image = primary_1_image.crop_w
                            @crop_h_primary_1_image = primary_1_image.crop_h
                          end
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destroy_background_1_image', :description => 'publisher_user_background_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destroy_background_1_image', :description => 'publisher_user_background_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destroy_background_1_image', :description => 'publisher_user was nil')
                  raise
              end              
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destroy_background_1_image', :description => 'background_image_id was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destroy_background_1_image', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
    
  end



  def upload_primary_1_image

      @errors = false
      
      begin

          if request.xhr? || remotipart_submitted?
           
              @primary_1_image_id = nil
              @primary_1_image = nil
              @primary_1_crop_x = 0
              @primary_1_crop_y = 0
              @primary_1_crop_w = 200
              @primary_1_crop_h = 200
              @list_1_images = nil
              
              image = params[:publisher_user_image][:image]
              # primary = params[:publisher_user_image][:primary]
              # @primary = false              
              # if primary.to_s == 'false'
                  # # Rails.logger.info "primary was sent = " + primary.to_s
                  # primary = false
              # elsif primary.to_s == '-_-----
                  # # Rails.logger.info "primary was sent = " + primary.to_s
                  # primary = true
              # end
              # # Rails.logger.info "primary = " + primary.to_s
              
              if !image.nil?
                  publisher = current_user.publisher rescue nil
                  if !publisher.nil?
                      publisher_user = current_user.publisher_user rescue nil
                      if !publisher_user.nil?
                          h_new = Hash.new
                          h_new[:user_id] = current_user.id
                          h_new[:publisher_id] = publisher.id
                          h_new[:publisher_user_id] = publisher_user.id
                          h_new[:image] = image
                          h_new[:primary] = true
                          publisher_user_image = PublisherUserImage.new(h_new)
                          if publisher_user_image.save
                              img = publisher_user_image
                              image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                              w = image.width
                              h = image.height
                              w_max = false
                              h_max = false
                              w_h_equal = false
                              x = 0
                              y = 0
                              l = 0                    
                              d = 0
                              if ( w == h)
                                  w_h_equal = true
                              else
                                  if ( w > h )
                                    w_max = true
                                  else
                                    h_max = true
                                  end
                              end
                              if w_max
                                  d = w - h
                                  d = (d/2).round
                                  x = d
                                  l = h  
                              end
                              if h_max
                                  d = h - w
                                  d = (d/2).round
                                  y = d
                                  l = w  
                              end
                              if w_h_equal
                                  l = w
                              end
              
                              h_update = Hash.new
                              h_update[:crop_x] = x
                              h_update[:crop_y] = y
                              h_update[:crop_w] = l
                              h_update[:crop_h] = l
                              if publisher_user_image.update_attributes(h_update)
                                  @primary_1_image = publisher_user_image
                                  @primary_1_image_id = publisher_user_image.id
                                  
                                  publisher_user_images = publisher_user.publisher_user_images rescue nil
                                  if !publisher_user_images.nil?
                                      @list_1_images = publisher_user_images                                    
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'publisher_user_images was nil')
                                      raise
                                  end
                                  # publisher_user_images = publisher_user.publisher_user_images.order('created_at DESC') rescue nil
                                  # if !publisherUserImages.nil?
                                      # @publisher_user_images = publisher_user_images
                                  # else
                                      # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_image_1', :description => 'publisher_user_images was nil')
                                      # raise
                                  # end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'publisher_user_image update_attributes failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'publisher_user_image save failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'publisher_user was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'publisher was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => 'request remotipart failed')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_primary_1_image_change

      @errors = false
      
      begin

          if request.xhr? || remotipart_submitted?
           
              @primary_1_image_id = nil
              @primary_1_image = nil
              @primary_1_crop_x = 0
              @primary_1_crop_y = 0
              @primary_1_crop_w = 200
              @primary_1_crop_h = 200
              @list_1_images = nil
              
              image = params[:publisher_user_image][:image]
              image_id_delete = params[:publisher_user_image][:image_id_delete]
              if !image.nil?
                  if !image_id_delete.nil?
                      publisher = current_user.publisher rescue nil
                      if !publisher.nil?
                          publisher_user = current_user.publisher_user rescue nil
                          if !publisher_user.nil?
                              image_delete = publisher_user.publisher_user_images.where("id = ?", image_id_delete).first rescue nil
                              if !image_delete.nil?
                                  if image_delete.destroy
                                      h_new = Hash.new
                                      h_new[:user_id] = current_user.id
                                      h_new[:publisher_id] = publisher.id
                                      h_new[:publisher_user_id] = publisher_user.id
                                      h_new[:image] = image
                                      publisher_user_image = PublisherUserImage.new(h_new)
                                      if publisher_user_image.save
                                          img = publisher_user_image
                                          image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                                          w = image.width
                                          h = image.height
                                          w_max = false
                                          h_max = false
                                          w_h_equal = false
                                          x = 0
                                          y = 0
                                          l = 0                    
                                          d = 0
                                          if ( w == h)
                                              w_h_equal = true
                                          else
                                              if ( w > h )
                                                w_max = true
                                              else
                                                h_max = true
                                              end
                                          end
                                          if w_max
                                              d = w - h
                                              d = (d/2).round
                                              x = d
                                              l = h  
                                          end
                                          if h_max
                                              d = h - w
                                              d = (d/2).round
                                              y = d
                                              l = w  
                                          end
                                          if w_h_equal
                                              l = w
                                          end
                          
                                          h_update = Hash.new
                                          h_update[:crop_x] = x
                                          h_update[:crop_y] = y
                                          h_update[:crop_w] = l
                                          h_update[:crop_h] = l
                                          if publisher_user_image.update_attributes(h_update)
                                              @primary_1_image = publisher_user_image
                                              @primary_1_image_id = publisher_user_image.id      
                                              
                                              publisher_user_images = publisher_user.publisher_user_images rescue nil
                                              if !publisher_user_images.nil?
                                                  @list_1_images = publisher_user_images                                    
                                              else
                                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'publisher_user_images was nil')
                                                  raise
                                              end
                                          else
                                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'publisher_user_image update_attributes failed')
                                              raise
                                          end
                                      else
                                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'publisher_user_image save failed')
                                          raise
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'image_delete destroy failed')
                                      raise
                                  end          
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'image_delete was nil')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'publisher_user was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'publisher was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'image_id_delete was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => 'request remotipart failed')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_primary_1_image_change', :description => e.message.to_s)
          @errors = true
          
      end
        
    
  end



  def crop_primary_1_image
    
      @errors = false
      
      begin
        
          image_id = params[:image_id]
          params_crop_x = params[:crop_x]
          params_crop_y = params[:crop_y]
          params_crop_w = params[:crop_w]
          params_crop_h = params[:crop_h]

          if !image_id.nil?
              if !params_crop_x.nil?
                  if !params_crop_y.nil?
                      if !params_crop_w.nil?
                          if !params_crop_h.nil?
                              publisher_user = current_user.publisher_user
                              if !publisher_user.nil?
                                  publisher_user_image = publisher_user.publisher_user_images.where("id = ?", image_id).first rescue nil
                                  if !publisher_user_image.nil?
                                      # image = MiniMagick::Image.open("public" + publisher_user_image.image_url)
                                      # image_600_600 = MiniMagick::Image.open("public" + publisher_user_image.image_url(:image_600_600))
                                      image = MiniMagick::Image.open("public" + publisher_user_image.image_url(:image_600_600))
                                  
                                      crop_params = "#{params_crop_w}x#{params_crop_h}+#{params_crop_x}+#{params_crop_y}"
                                      new_image = image.crop(crop_params)
                        
                                      img_name = File.basename(publisher_user_image.image.to_s)
                                      img_dir = "public" + File.dirname(publisher_user_image.image.to_s)
                                
                                      image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
                                      image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
                                      image_50_50_path = img_dir + "/" + "image_50_50_" + img_name
                                
                                      FileUtils.rm_rf(image_200_200_path) 
                                      FileUtils.rm_rf(image_100_100_path)
                                      FileUtils.rm_rf(image_50_50_path) 
                                
                                      new_image.resize('200x200')
                                      new_image.write image_200_200_path
                                      new_image.resize('100x100')
                                      new_image.write image_100_100_path      
                                      new_image.resize('50x50')
                                      new_image.write image_50_50_path      
                                
                                      x = params_crop_x
                                      y = params_crop_y
                                      w = params_crop_w
                                      h = params_crop_h
                                      x = x.to_i
                                      y = y.to_i
                                      w = w.to_i
                                      h = h.to_i
                                
                                      h_crop = Hash.new
                                      h_crop[:crop_x] = x
                                      h_crop[:crop_y] = y
                                      h_crop[:crop_w] = w
                                      h_crop[:crop_h] = h
                                
                                      if publisher_user_image.update_attributes(h_crop)
                                          @primary_1_image = publisher_user_image
                                          @primary_1_image_id = publisher_user_image.id      
                                      else
                                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'publisher_user_image update_attributes failed')
                                          raise
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'publisher_user_image was nil')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'publisher_user was nil')
                                  raise
                              end      
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'params_crop_h was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'params_crop_w was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'params_crop_y was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'params_crop_x was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => 'image_id was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'crop_primary_1_image', :description => e.message.to_s)
          @errors = true
          
      end
  
    
  end



  def destroy_primary_1_image

      begin
        
          ar = params[:publisher_user]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          image_id = h_obj[:image_id]
          @primary_1_image = nil
          gon.primary_1_image_id = nil
          
          publisher_user = current_user.publisher_user rescue nil
          if !publisher_user.nil?
              if !image_id.nil?
                  publisher_user_image = current_user.publisher_user.publisher_user_images.where("id = ?", image_id).first rescue nil
                  if !publisher_user_image.nil?
                      publisher_user_images = publisher_user.publisher_user_images rescue nil
                      if !publisher_user_images.nil?                            
                          if publisher_user_image.destroy
                              @list_1_images = publisher_user_images                            
                          else      
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_primary_1_image', :description => 'publisher_user_image destroy failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_primary_1_image', :description => 'publisher_user_images was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_primary_1_image', :description => 'publisher_user_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_primary_1_image', :description => 'image_id was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_primary_1_image', :description => 'publisher_user was nil')
              raise
          end
                    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_primary_1_image', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_list_1_image

      @errors = false
      
      begin

          if request.xhr? || remotipart_submitted?
           
              @list_1_image_id = nil
              @list_1_image = nil
              @list_1_images = nil
              @list_1_crop_x = 0
              @list_1_crop_y = 0
              @list_1_crop_w = 200
              @list_1_crop_h = 200
              
              image = params[:publisher_user_image][:image]

              
              if !image.nil?
                  publisher = current_user.publisher rescue nil
                  if !publisher.nil?
                      publisher_user = current_user.publisher_user rescue nil
                      if !publisher_user.nil?
                          h_new = Hash.new
                          h_new[:user_id] = current_user.id
                          h_new[:publisher_id] = publisher.id
                          h_new[:publisher_user_id] = publisher_user.id
                          h_new[:image] = image
                          h_new[:primary] = false
                          publisher_user_image = PublisherUserImage.new(h_new)
                          if publisher_user_image.save
                              img = publisher_user_image
                              image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                              w = image.width
                              h = image.height
                              w_max = false
                              h_max = false
                              w_h_equal = false
                              x = 0
                              y = 0
                              l = 0                    
                              d = 0
                              if ( w == h)
                                  w_h_equal = true
                              else
                                  if ( w > h )
                                    w_max = true
                                  else
                                    h_max = true
                                  end
                              end
                              if w_max
                                  d = w - h
                                  d = (d/2).round
                                  x = d
                                  l = h  
                              end
                              if h_max
                                  d = h - w
                                  d = (d/2).round
                                  y = d
                                  l = w  
                              end
                              if w_h_equal
                                  l = w
                              end
              
                              h_update = Hash.new
                              h_update[:crop_x] = x
                              h_update[:crop_y] = y
                              h_update[:crop_w] = l
                              h_update[:crop_h] = l
                              if publisher_user_image.update_attributes(h_update)
                                  @list_1_image = publisher_user_image
                                  @list_1_image_id = publisher_user_image.id
                                  
                                  publisher_user_images = publisher_user.publisher_user_images rescue nil
                                  if !publisher_user_images.nil?
                                      @list_1_images = publisher_user_images
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'publisher_user_images was nil')
                                      raise
                                  end
                                  # publisher_user_images = publisher_user.publisher_user_images.order('created_at DESC') rescue nil
                                  # if !publisherUserImages.nil?
                                      # @publisher_user_images = publisher_user_images
                                  # else
                                      # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_image_1', :description => 'publisher_user_images was nil')
                                      # raise
                                  # end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'publisher_user_image update_attributes failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'publisher_user_image save failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'publisher_user was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'publisher was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => 'request remotipart failed')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'upload_list_1_image', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def destroy_list_1_image

      begin
        
          ar = params[:publisher_user]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          image_id = h_obj[:image_id]
          @list_1_image = nil
          gon.list_1_image_id = nil
          @primary = nil
          @list_1_images = nil
          
          publisher_user = current_user.publisher_user rescue nil
          if !publisher_user.nil?
              if !image_id.nil?
                  publisher_user_image = publisher_user.publisher_user_images.where("id = ?", image_id).first rescue nil
                  if !publisher_user_image.nil?
                      primary = publisher_user_image.primary rescue nil
                      
                      Rails.logger.info "primary = " + primary.to_s
                          
                      publisher_user_images = publisher_user.publisher_user_images rescue nil
                      if !publisher_user_images.nil?                            
                          if publisher_user_image.destroy
                              @primary = primary
                              @list_1_images = publisher_user_images                                               
                          else      
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_list_1_image', :description => 'publisher_user_image destroy failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_list_1_image', :description => 'publisher_user_images was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_list_1_image', :description => 'publisher_user_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_list_1_image', :description => 'image_id was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_list_1_image', :description => 'publisher_user was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'destory_list_1_image', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end


  def cancel_post_user_on_close
    
  end
  
  
  
  
  
  
  def create_user_friend_invitation

      begin

          user_friend_to_id = params[:user_friend_to_id]
          Rails.logger.info params.to_yaml

          public_user = User.where(:id => user_friend_to_id).first rescue nil

          if !public_user.nil?
              relate_user_friend_invitation = current_user.relate_user_friend_invitations.build(user_friend_to_id: public_user.id) rescue nil
              if relate_user_friend_invitation.save
                  @user_friend_invitation_exists = current_user.relate_user_friend_invitations.where(:user_friend_to_id => public_user.id).exists? rescue nil
                  Rails.logger.info('user_friend_invitation_exists = ' + @user_friend_invitation_exists.to_s)
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'public_publisher_users', :action => 'create_user_friend_invitation', :description => 'relate_user_friend_invitation save failed')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'public_publisher_users', :action => 'create_user_friend_invitation', :description => 'public_user was nil')
              raise
          end

      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'public_publisher_users', :action => 'create_user_friend_invitation', :description => e.message.to_s)
      end

    
  end
  

  def add_user_friend

      begin
            
          @relate_user_friend_invitation_exists = false
          @relate_user_friend_invitation_received = false
          # @relate_user_friend_invitation_sent = false
          @b_relate_user_friend_invitation_cancelled = false            
          @errors = true
            
          if !params[:friend_id].nil?
              # Rails.logger.info "friend_id = " + params[:friend_id].to_yaml
              friend_id = params[:friend_id]

              relate_user_friend_invitation = RelateUserFriendInvitation.where('user_friend_to_id = ?', current_user.id).first rescue nil
              if !relate_user_friend_invitation.nil?
                  h_new_relate_user_friend = Hash.new
                  h_new_relate_user_friend[:friend_1_id] = current_user.id
                  h_new_relate_user_friend[:friend_2_id] = friend_id
                  relate_user_friend = current_user.relate_user_friends.build(h_new_relate_user_friend) rescue nil
                  if relate_user_friend.save
                      if relate_user_friend_invitation.destroy
                          @user_friend_invitations_received = current_user.get_relate_user_friend_invitations_received rescue nil
                          # @user_friend_invitations_sent = current_user.get_relate_user_friend_invitations_sent rescue nil
                          @user = current_user
                          @errors = false
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'add_user_friend', :description => 'relate_user_friend_invitation destroy failed')
                          raise
                      end                    
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'add_user_friend', :description => 'relate_user_friend save failed')
                      raise
                  end
                
              else
                  @user_friend_invitations_received = current_user.get_relate_user_friend_invitations_received rescue nil
                  @b_relate_user_friend_invitation_cancelled = true
                  @errors = false
                  # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'add_user_friend', :description => 'relate_user_friend_invitation was nil')
                  # raise
              end
              
              
              
              
              
              # # :user_id,
              # # :user_friend_id,
              # # :user_initiate_id,
              # # :status,    # can be 'pending', 'requested', 'accepted'
              # # :status_text,
              # # :invitation_at,
              # # :accepted_at
              # h_new_user_friend = Hash.new
              # h_new_user_friend[:user_id] = current_user.id
              # h_new_user_friend[:user_friend_id] = params[:friend_id]
              # h_new_user_friend[:user_initiate_id] = params[:friend_id]
              # new_user_friend = current_user.user_friends.build(h_new_user_friend) rescue nil
              # if !new_user_friend.nil?
                  # @errors = false
                  # @user = current_user
              # else
                  # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'add_user_friend', :description => 'new_user_friend was nil')
                  # raise
              # end            
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'add_user_friend', :description => 'params were nil')
              raise
              @errors = true
          end
      
      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'add_user_friend', :description => e.message.to_s)
          @errors = true
      end
      
    
  end
  


  def remove_user_friend

      # Rails.logger.info "remove friend_id = " + params[:friend_id].to_s
      # Rails.logger.info "remove user_id = " + params[:user_id].to_s
      
      begin
            
          @errors = true
          
          friend_id = params[:friend_id]
          user_id = params[:user_id]
          
          if ((!friend_id.nil?) and (!user_id.nil?))
              relate_user_friend = RelateUserFriend.where(:id => friend_id).first rescue nil
              if !relate_user_friend.nil?
                  if relate_user_friend.destroy
                      @user = current_user
                      @errors = false
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'remove_user_friend', :description => 'relate_user_friend destroy failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'remove_user_friend', :description => 'relate_user_friend was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'remove_user_friend', :description => 'params were nil')
              raise
          end
      
      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'remove_user_friend', :description => e.message.to_s)
      end
      
    
  end
  
  
  
  def cancel_user_friend_invitation

      Rails.logger.info "remove invitation_id = " + params[:invitation_id].to_s
      Rails.logger.info "remove invitation user_id = " + params[:user_id].to_s

      # relate_user_friend_invitation = current_user.relate_user_friend_invitations.build(user_friend_to_id: public_user.id) rescue nil
      
      begin

          @user_friend_invitations_sent = nil
          @errors = true

          invitation_id = params[:invitation_id]
          user_id = params[:user_id]
          
          if ((!invitation_id.nil?) and (!user_id.nil?))
              relate_user_friend_invitation = RelateUserFriendInvitation.where(:id => invitation_id).first rescue nil
              if !relate_user_friend_invitation.nil?
                  if relate_user_friend_invitation.destroy
                      @user_friend_invitations_sent = current_user.get_relate_user_friend_invitations_sent rescue nil
                      @user = current_user
                      @errors = false
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'cancel_user_friend_invitation', :description => 'relate_user_friend destroy failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'cancel_user_friend_invitation', :description => 'relate_user_friend was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'cancel_user_friend_invitation', :description => 'params were nil')
              raise
          end

      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_users', :action => 'cancel_user_friend_invitation', :description => e.message.to_s)
      end

    
  end


  
  private

    def publisher_user_params
      params.require(:publisher_user).permit(
                                        :user_id,
                                        :publisher_id,
                                       )
    end
  


    def sort_column_posts
      PostUser.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
  
    # def sort_column
      # PublisherUser.column_names.include?(params[:sort]) ? params[:sort] : "id"
    # end    
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    # end

    # def yesno(x)
      # x == 1 ? "Yes" : "No"
    # end

  
  
end
