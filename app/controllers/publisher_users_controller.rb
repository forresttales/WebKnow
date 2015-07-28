class PublisherUsersController < ApplicationController

  # before_filter :force_http

  #require 'RMagick'
  # require 'rmagick'
  
  require 'mini_magick'
  # require 'carrierwave/processing/mini_magick'
    
  # include CarrierWave::MiniMagick
  
      
  # layout 'publisher'
  layout 'publisher'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  # before_action :verify_signin, only: [:index]
  before_action :verify_signin

  # before_action :signed_in_user, except: [:update_my_story, :upload_publisher_user_image_primary, :upload_publisher_user_logo_image, :edit_image_primary, :destroy_publisher_user_image]
  # before_action :verify_id, except: [:update_my_story, :upload_publisher_user_image_primary, :upload_publisher_user_logo_image, :edit_image_primary, :destroy_publisher_user_image]
  # before_action :fill_left_directory, except: [:update_my_story, :upload_publisher_user_image_primary, :upload_publisher_user_logo_image, :edit_image_primary, :destroy_publisher_user_image]

  # before_action :signed_in_user, only: [:index, :index_demo]
  # before_action :verify_params, only: [:index, :index_demo]
  # before_action :fill_left_directory, only: [:index, :index_demo]

  @@current_post_user = nil

  def verify_signin
    
      if !signed_in?
          redirect_to '/Signin'
      end
      
  end

  # def verify_params
    # # id_passed = params[:id]
    # # if !id_passed.nil?
        # # publisher_user = PublisherUser.friendly.find(id_passed) rescue nil
        # # if !publisher_user.nil?
            # # current_publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
            # # if !(current_publisher_user.id == publisher_user.id)
              # # raise ActionController::RoutingError.new('Not Found')
            # # end        
        # # else
          # # raise ActionController::RoutingError.new('Not Found')
        # # end
    # # else
        # # # user_my_story_url = '/puid-demo' + current_user.slug
        # # redirect_to current_user.slug
    # # end
  # end    


  # def fill_left_directory
    # @url_user_story = '#'
    # @url_profile_story = '#'
    # @url_profile_story_home = '#' 
    # if signed_in?
        # # signed in
        # @url_user_story = current_user.slug
        # case current_user.profile_type.to_s
          # when "1"
              # # student user
          # when "2"
              # # teacher user
          # when "3"
              # # publisher user
              # publisher = current_user.publisher
              # @url_profile_story = publisher.slug
              # @url_profile_story_home = "Publisher"
          # when "4"
              # # institute user
          # when "5"
              # # recruiter user
          # else
              # #
        # end
    # else
        # # not signed
    # end
  # end



  # def index_home
#     
        # Rails.logger.info('render_index_publisher_user_home')
#         
        # @user = current_user
        # @publisher_user = nil
        # @publisher_user_image_primary = nil
        # @user_image_primary = nil
        # @post_users = nil
        # @post_user = nil
#         
        # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
        # publisher_user = current_user.publisher_user
        # if !publisher_user.nil?
            # @publisher_user = publisher_user
            # @publisher_id = publisher_user.publisher_id
            # @publisher_user_id = publisher_user.id
            # # publisher = Publisher.find_by_id(@publisher_id)
            # publisher = current_user.publisher
            # if !publisher.nil?
                # @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first
                # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
            # else
              # #
            # end
#             
# 
            # # @post_user = current_user.post_users.build
            # # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
            # @post_users = current_user.feed
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
            # gon.name_first = ""
            # gon.b_name_first = false
            # gon.b_required_name_first = true
            # if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
                # gon.name_first = current_user.name_first
                # gon.b_name_first = true
                # gon.b_required_name_first = false
            # end
            # gon.name_last = ""
            # gon.b_name_last = false
            # gon.b_required_name_last = true
            # if !((current_user.name_last.blank?) or (current_user.name_last.empty?) or (current_user.name_last.nil?)) 
                # gon.name_last = current_user.name_last
                # gon.b_name_last = true
                # gon.b_required_name_last = false
            # end
#             
            # # gon.email = ""
            # # gon.b_email = false
            # # gon.b_required_email = true
            # # if !((publisher_user.email.blank?) or (publisher_user.email.empty?) or (publisher_user.email.nil?)) 
                # # gon.email = publisher_user.email
                # # gon.b_email = true
                # # gon.b_required_email = false
            # # end
            # # gon.location = ""
            # # gon.b_location = false
            # # gon.b_required_location = true
            # # if !((publisher_user.location.blank?) or (publisher_user.location.empty?) or (publisher_user.location.nil?)) 
                # # gon.location = publisher_user.location
                # # gon.b_location = true
                # # gon.b_required_location = false
            # # end
            # # gon.name_alias = ""
            # # gon.b_name_alias = false
            # # gon.b_required_name_alias = true
            # # if !((publisher_user.name_alias.blank?) or (publisher_user.name_alias.empty?) or (publisher_user.name_alias.nil?)) 
                # # gon.name_alias = publisher_user.name_alias
                # # gon.b_name_alias = true
                # # gon.b_required_name_alias = false
            # # end
            # # gon.job_title = ""
            # # gon.b_job_title = false
            # # gon.b_required_job_title = true
            # # if !((publisher_user.job_title.blank?) or (publisher_user.job_title.empty?) or (publisher_user.job_title.nil?)) 
                # # gon.job_title = publisher_user.job_title
                # # gon.b_job_title = true
                # # gon.b_required_job_title = false
            # # end
            # # gon.name_company = ""
            # # gon.b_name_company = false
            # # gon.b_required_name_company = true
            # # if !((publisher_user.name_company.blank?) or (publisher_user.name_company.empty?) or (publisher_user.name_company.nil?)) 
                # # gon.name_company = publisher_user.name_company
                # # gon.b_name_company = true
                # # gon.b_required_name_company = false
            # # end
            # # gon.time_at_company = ""
            # # gon.b_time_at_company = false
            # # gon.b_required_time_at_company = true
            # # if !((publisher_user.time_at_company.blank?) or (publisher_user.time_at_company.empty?) or (publisher_user.time_at_company.nil?)) 
                # # gon.time_at_company = publisher_user.tim<div id="rd_profile_type_1" class="rd-button-disabled" tabindex=""></div>e_at_company
                # # gon.b_time_at_company = true
                # # gon.b_required_time_at_company = false
            # # end
            # # gon.website = ""
            # # gon.b_website = false
            # # gon.b_required_website = true
            # # if !((publisher_user.website.blank?) or (publisher_user.website.empty?) or (publisher_user.website.nil?)) 
                # # gon.website = publisher_user.website
                # # gon.b_website = true
                # # gon.b_required_website = false
            # # end
            # # gon.phone_company = ""
            # # gon.b_phone_company = false
            # # gon.b_required_phone_company = true
            # # if !((publisher_user.phone_company.blank?) or (publisher_user.phone_company.empty?) or (publisher_user.phone_company.nil?)) 
                # # gon.phone_company = publisher_user.phone_company
                # # gon.b_phone_company = true
                # # gon.b_required_phone_company = false
            # # end
#             
            # # slug_user = current_user.slug
            # # @url_my_story_public = '/ppuid' + slug_user
# 
# 
# 
#             
        # else
          # # exit if publisher_user nil 
        # end
#         
#         
        # # render 'index_home', :layout => 'publisher'
#     
  # end



  # def index
#     
        # Rails.logger.info('render_index_publisher_user')
#         
        # # @new_user = false
        # # if session[:new_user]
          # # @new_user = true
        # # end
#     
        # @user = current_user
        # @publisher_user = nil
        # @publisher_user_image_primary = nil
        # @user_image_primary = nil
        # @post_users = nil
        # @post_user = nil
#         
        # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
        # publisher_user = current_user.publisher_user        
        # if !publisher_user.nil?
            # Rails.logger.info('publisher_user not nil')
            # @publisher_user = publisher_user
            # @publisher_id = publisher_user.publisher_id
            # @publisher_user_id = publisher_user.id
            # # publisher = Publisher.find_by_id(@publisher_id)
            # publisher = current_user.publisher
            # if !publisher.nil?
                # Rails.logger.info('publisher not nil')
                # @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first
                # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
            # else
                # Rails.logger.info('publisher was nil')
            # end
#             
            # # @publisher_user_plot_text = publisher_user.publisher_user_plot.plot_text
            # # @post_user = current_user.post_users.build
            # # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
#         
            # # @log_users = current_user.post_users.paginate(:page => params[:page], :per_page => 5)
            # # @log_users = current_user.feed_log
            # @post_users = current_user.feed_log
#             
            # gon.id_image = nil
            # @crop_x = 0
            # @crop_y = 0
            # @crop_w = 200
            # @crop_h = 200
            # if !@publisher_user_image_primary.nil? 
              # gon.id_image = @publisher_user_image_primary.id
              # @crop_x = @publisher_user_image_primary.crop_x
              # @crop_y = @publisher_user_image_primary.crop_y
              # @crop_w = @publisher_user_image_primary.crop_w
              # @crop_h = @publisher_user_image_primary.crop_h
            # end
#         
            # gon.id_image_logo = nil
            # @crop_x_logo = 0
            # @crop_y_logo = 0
            # @crop_w_logo = 200
            # @crop_h_logo = 200
            # if !@publisher_user_logo_image.nil? 
              # gon.id_image_logo = @publisher_user_logo_image.id
              # @crop_x_logo = @publisher_user_logo_image.crop_x
              # @crop_y_logo = @publisher_user_logo_image.crop_y
              # @crop_w_logo = @publisher_user_logo_image.crop_w
              # @crop_h_logo = @publisher_user_logo_image.crop_h
            # end
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
# 
# 
#             
        # else
          # Rails.logger.info('publisher_user was nil') 
        # end
#         
#         
        # # render 'index', :layout => 'publisher'
#     
  # end



  
  # def index
    # @user = current_user
    # @publisher_user = nil
    # # @user_avatar = nil
    # @publisher_user_image_primary = nil
    # @user_image_primary = nil
    # @post_users = nil
    # @post_user = nil
    # @@current_post_user = nil
#     
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
        # @publisher_user = publisher_user
        # @publisher_id = publisher_user.publisher_id
        # @publisher_user_id = publisher_user.id
        # publisher = Publisher.find_by_id(@publisher_id)
        # if !publisher.nil?
            # # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
            # # @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
            # @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first
            # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
            # # if !@publisher_user_image_primary.nil?
                # # @user_avatar = @publisher_user_image_primary.image_url(:user_34_34)
                # # img = @publisher_user_image_primary
                # # image = MiniMagick::Image.read("public" + img.image_url(:image_600_600))[0]
                # # @image_width = image.columns
                # # @image_height = image.rows
            # # end
        # else
          # #
        # end
    # else
      # # exit if publisher_user nil 
    # end
# 
#     
    # # @post_users = current_user.post_users.order(sort_column_posts + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)    
    # # @post_users = PostUser.all.order(sort_column_posts + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
# 
    # # @post_users = PostUser.all.order(sort_column_posts + " " + sort_direction)
    # #@micropost = current_user.microposts.build
    # # @post_user = current_user.post_users.build
    # # @feed_items = current_user.feed.paginate(page: params[:page])
    # # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
    # @post_users = current_user.feed
    # # @feed_items = current_user.feed
    # # @post_users = current_user.feed
# 
    # # @log_users = current_user.post_users    
# 
# 
    # gon.id_image = nil
    # @crop_x = 0
    # @crop_y = 0
    # @crop_w = 200
    # @crop_h = 200
    # if !@publisher_user_image_primary.nil? 
      # gon.id_image = @publisher_user_image_primary.id
      # @crop_x = @publisher_user_image_primary.crop_x
      # @crop_y = @publisher_user_image_primary.crop_y
      # @crop_w = @publisher_user_image_primary.crop_w
      # @crop_h = @publisher_user_image_primary.crop_h
    # end
# 
    # gon.id_image_logo = nil
    # @crop_x_logo = 0
    # @crop_y_logo = 0
    # @crop_w_logo = 200
    # @crop_h_logo = 200
    # if !@publisher_user_logo_image.nil? 
      # gon.id_image_logo = @publisher_user_logo_image.id
      # @crop_x_logo = @publisher_user_logo_image.crop_x
      # @crop_y_logo = @publisher_user_logo_image.crop_y
      # @crop_w_logo = @publisher_user_logo_image.crop_w
      # @crop_h_logo = @publisher_user_logo_image.crop_h
    # end
# 
# 
# 
    # # 1 name_first
    # @b_user_name_first = false
    # gon.user_name_first = ""
    # gon.b_user_name_first = false
    # gon.b_required_user_name_first = true
    # if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
        # # @b_name_first = true
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
# 
# 
# 
    # gon.name_first = ""
    # gon.b_name_first = false
    # gon.b_required_name_first = true
    # if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
        # # @b_name_first = true
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
#     
#     
#     
    # slug_user = current_user.slug
    # @url_my_story_public = '/ppuid' + slug_user
#     
#     
  # end



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



  def update_story_1
    
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


  def update_publisher_user_interest

    interest_text = params[:publisher_user_interest][:interest_text]
    h_publisher_user_interest = Hash.new
    h_publisher_user_interest[:interest_text] = interest_text
    # publisher_user_interest = UserPlot.where("publisher_user_interest_id = ?", current_user.publisher_user.publisher_user_interest.id).first rescue nil
    publisher_user_interest = current_user.publisher_user.publisher_user_interest rescue nil
    if !publisher_user_interest.nil?
        if publisher_user_interest.update_attributes(h_publisher_user_interest)
            #
        else
            Rails.logger.info('publisher_user_interest update failed')
        end
    else
        Rails.logger.info('publisher_user_interest = nil')      
    end

    @publisher_user = nil
    publisher_user = current_user.publisher_user rescue nil
    if !publisher_user.nil?
        @publisher_user = publisher_user
    else
        # error
    end
    
    
  end
  
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
  

  def update_story_3
    
    # ar = params[:publisher]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
    # story_interest = h_obj[:story_interest]

    story_interest = params[:story_interest]
    
    h_publisher_user = Hash.new
    h_publisher_user[:story_interest] = story_interest
    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    if !publisher_user.nil?
        if publisher_user.update_attributes(h_publisher_user)
            #
        else
            # Rails.logger.info('user update failed')
        end
    else
        # Rails.logger.info('user = nil')      
    end
    
    
    publisher_user = nil    
    @publisher_user = nil
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    if !publisher_user.nil?
      @publisher_user = publisher_user
    else
      #
    end
    
    
  end
  

  def create_post_user_comment
    
      ar = params[:post_user_comment]
      h_obj = Hash.new
      ar.each do |obj|
        h_obj = obj
      end
    
      @post_user_comments = nil
      @post_user_id = nil

      post_user_id = h_obj[:post_user_id]
      # post_user_id = params[:post_user_comment][:post_user_id]
      # @post_user = nil
      # @b_has_like = false
            
      h_post_user_comment = Hash.new
      h_post_user_comment[:post_user_id] = post_user_id
      h_post_user_comment[:user_id] = current_user.id
      # h_post_user_comment[:comment_text] = params[:post_user_comment][:comment_text]
      h_post_user_comment[:comment_text] = h_obj[:comment_text]

      if !post_user_id.nil?
          post_user = PostUser.where("id = ?", post_user_id).first rescue nil
          if !post_user.nil?
              post_user_comment = post_user.post_user_comments.build(h_post_user_comment)
              if post_user_comment.save
                  @post_user_comments = post_user.post_user_comments.order('created_at DESC')
                  @post_user_id = post_user_id                    
              else
                  #
              end
          else
              #
          end  
      else
          #
      end
      
    
  end
  
  
  def destroy_post_user_comment
    
    @post_user_comments = nil
    @post_user_id = nil
    
    post_user_comment_id = params[:post_user_comment_id]
    post_user_id = params[:post_user_id]
    
    post_user_comment = current_user.post_user_comments.where("id = ?", post_user_comment_id).first rescue nil
    if !post_user_comment.nil?
        if post_user_comment.destroy
            post_user = PostUser.where("id = ?", post_user_id).first rescue nil
            if !post_user.nil?
                @post_user_comments = post_user.post_user_comments.order('created_at DESC')
                @post_user_id = post_user.id                
            else
                #
            end
        else
            #
        end
    else
        #
    end

    
  end
  
  
  def add_post_user

      b_save = false
      
      post_user = current_user.post_users.build
      if post_user.save
          # @post_user = current_user.post_users.build
          # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 100)
          @@current_post_user = post_user
          # @post_users = current_user.feed
          b_save = true    
      else
        # @feed_items = []
      end
      
      return b_save
  end


  def cancel_post_user
      if @@current_post_user
          @@current_post_user.destroy
      end    
      @@current_post_user = nil
  end


  def cancel_post_user_on_close
      Rails.logger.info('cancel_post_user_on_close called')
      if @@current_post_user
          if @@current_post_user.destroy
              # Rails.logger.info('@@current_post_user.destroy successful')
          else
              # Rails.logger.info('@@current_post_user.destroy failed')
          end
      else
          Rails.logger.info('@@current_post_user = nil')
      end    
      @@current_post_user = nil
  end



  def create_post_user

      ar = params[:post_user]
      h_obj = Hash.new
      ar.each do |obj|
        h_obj = obj
      end

      @post_users = nil
      # Rails.logger.info('in create_post_user - ' + h_obj[:post_text])
      
      h_post_user = Hash.new
      h_post_user[:post_text] = h_obj[:post_text]

      if @@current_post_user.nil?
          post_user = current_user.post_users.build(h_post_user)
          if post_user.save
              #
          else
              # @feed_items = []
          end
      else
          @@current_post_user.update_attributes(h_post_user)        
      end

      @@current_post_user = nil
      @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 100)
    
  end
  

  def destroy_post_user
    
    post_user_id = params[:post_user_id]
    post_user = current_user.post_users.where("id = ?", post_user_id).first rescue nil
    if !post_user.nil?
        if post_user.destroy
            @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 100)
        else
            #
        end
    else
        #
    end
    
    
  end


  
  def create_post_user_like

      @nlist = params[:n_list]
      post_user_id = params[:post_user_id]
      @post_user = nil
      @b_has_like = false
            
      h_post_user_like = Hash.new
      h_post_user_like[:post_user_id] = post_user_id
      h_post_user_like[:user_id] = current_user.id
      post_user_like = PostUserLike.new(h_post_user_like)
      # post_user_like = current_user.post_users.build(post_user_like_params)
      if post_user_like.save
          post_user = PostUser.find_by_id(post_user_id) rescue nil
          if !post_user.nil?
              # Rails.logger.info('post_user not nil')
              @post_user = post_user
              @b_has_like = true
          else
              # Rails.logger.info('post_user = nil')
          end          
      else
          #
      end

      
  end
  
  
  def destroy_post_user_like
    
      @nlist = params[:n_list]
      post_user_id = params[:post_user_id]
      @post_user = nil
      @b_has_like = true
      
      post_user_likes = PostUserLike.where('post_user_id = ?', post_user_id)
      if post_user_likes.any?
          post_user_like = post_user_likes.where('user_id = ?', current_user.id).first rescue nil
          if !post_user_like.nil?
              if post_user_like.destroy
                  post_user = PostUser.find(post_user_id) rescue nil
                  if !post_user.nil?
                      @post_user = post_user
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



  def destroy_publisher_user_image

    @post_users = nil
    @publisher_user_image = nil
    publisher_user_image = UserImage.find(params[:id]) rescue nil
    if !publisher_user_image.nil?
        if publisher_user_image.destroy
            @post_users = current_user.feed
        else      
            #
        end
    else
      #
    end

    
  end
  


  def destroy_publisher_user_logo_image
    
    @publisher_user_logo_image = nil
    publisher_user_logo_image = PublisherUserLogoImage.find(params[:id]) rescue nil
    if !publisher_user_logo_image.nil?
        if publisher_user_logo_image.destroy
            # 
        else      
            # Rails.logger.info "publisher_user_logo_image destroy failed"
        end
    else
        #Rails.logger.info "publisher_user_logo_image = nil"
    end

    
  end
  

  
  def upload_publisher_user_image_primary

      Rails.logger.info "in upload_publisher_user_image_primary"
      
      @post_users = nil

      @id_image = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      h_user_image = Hash.new
      h_user_image[:user_id] = current_user.id
      h_user_image[:image] = params[:user_image][:image]
      h_user_image[:primary] = true
      h_user_image[:crop_x] = @crop_x
      h_user_image[:crop_y] = @crop_y
      h_user_image[:crop_w] = @crop_w
      h_user_image[:crop_h] = @crop_h
      
      @publisher_user_image_primary = nil
      user_image = UserImage.new(h_user_image)
      if request.xhr? || remotipart_submitted?
          if user_image.save
              user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil     
              if !user_image_primary.nil? 
                  # @id_image = user_image_primary.id
                  img = user_image_primary
                  # image = MiniMagick::Image.read("public" + img.image_url(:image_600_600))[0]
                  image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                  #w = image.columns
                  #h = image.rows
                  w = image.width
                  h = image.height
                  # Rails.logger.info "w = " + w.to_s
                  # Rails.logger.info "h = " + h.to_s
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
                  @crop_x = x
                  @crop_y = y
                  @crop_w = l
                  @crop_h = l
                  h_update = Hash.new
                  h_update[:crop_x] = x
                  h_update[:crop_y] = y
                  h_update[:crop_w] = l
                  h_update[:crop_h] = l
                  if user_image_primary.update_attributes(h_update)
                    #                      
                  else
                    #  
                  end
                  @publisher_user_image_primary = user_image_primary
                  @post_users = current_user.feed
              end
          else
            # error save
          end
      else
        # 
      end


  end  
  


  def upload_publisher_user_image_primary_change

      @post_users = nil

      @publisher_user_image = nil
      publisher_user_image = current_user.user_images.where( :primary => true ).first
      if !publisher_user_image.nil?
          if publisher_user_image.destroy
              #
          else      
              #
          end
      else
        #
      end
  
      # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
      # if !publisher_user.nil?
          # publisher_user_images = publisher_user.publisher_user_images     
          # publisher_user_image_primary = publisher_user_images.where( :primary => true ).first
          # if !publisher_user_image_primary.nil?
              # if publisher_user_image_primary.destroy
              # else      
                # #
              # end
          # else
            # #
          # end
      # end

      @id_image = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      h_user_image = Hash.new
      h_user_image[:user_id] = current_user.id
      h_user_image[:image] = params[:user_image][:image]
      h_user_image[:primary] = true
      h_user_image[:crop_x] = @crop_x
      h_user_image[:crop_y] = @crop_y
      h_user_image[:crop_w] = @crop_w
      h_user_image[:crop_h] = @crop_h
      
      @publisher_user_image_primary = nil
      user_image = UserImage.new(h_user_image)
      if request.xhr? || remotipart_submitted?
          if user_image.save
              user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil     
              if !user_image_primary.nil? 
                  # @id_image = user_image_primary.id
                  img = user_image_primary
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
                  @crop_x = x
                  @crop_y = y
                  @crop_w = l
                  @crop_h = l
                  h_update = Hash.new
                  h_update[:crop_x] = x
                  h_update[:crop_y] = y
                  h_update[:crop_w] = l
                  h_update[:crop_h] = l
                  if user_image_primary.update_attributes(h_update)
                    #                      
                  else
                    #  
                  end
                  @publisher_user_image_primary = user_image_primary
                  @post_users = current_user.feed
              end
          else
            # error save
          end
      else
        # 
      end


  end  



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



  def upload_publisher_user_logo_image
    
    @id_image_logo = nil
    @crop_x_logo = 0
    @crop_y_logo = 0
    @crop_w_logo = 200
    @crop_h_logo = 200
    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    if !publisher_user.nil?
        h_publisher_user_logo_image = Hash.new
        h_publisher_user_logo_image[:image] = params[:publisher_user_logo_image][:image]
        h_publisher_user_logo_image[:user_id] = publisher_user.user_id
        h_publisher_user_logo_image[:publisher_id] = publisher_user.publisher_id
        h_publisher_user_logo_image[:publisher_user_id] = publisher_user.id
        h_publisher_user_logo_image[:crop_x] = @crop_x
        h_publisher_user_logo_image[:crop_y] = @crop_y
        h_publisher_user_logo_image[:crop_w] = @crop_w
        h_publisher_user_logo_image[:crop_h] = @crop_h
        publisher_user_logo_image = PublisherUserLogoImage.new(h_publisher_user_logo_image)

        if request.xhr? || remotipart_submitted?
            if publisher_user_logo_image.save
                publisher_user_logo_image = publisher_user.publisher_user_logo_images.first rescue nil
                if !publisher_user_logo_image.nil? 

                    @id_image_logo = publisher_user_logo_image.id
                    @publisher_user_logo_image = publisher_user_logo_image

                    img = publisher_user_logo_image
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

                    @crop_x_logo = x
                    @crop_y_logo = y
                    @crop_w_logo = l
                    @crop_h_logo = l

                    h_update = Hash.new
                    h_update[:crop_x] = x
                    h_update[:crop_y] = y
                    h_update[:crop_w] = l
                    h_update[:crop_h] = l
                    if publisher_user_logo_image.update_attributes(h_update)
                      #                      
                    else
                      #  
                    end
                    
                else
                  Rails.logger.info "publisher_user_logo_image = nil"
                end
            else
              # error save
            end
        else
          # 
        end
    else
      #
    end
    
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher_user.nil?
        # h_publisher_user_logo_image = Hash.new
        # h_publisher_user_logo_image[:image] = params[:publisher_user_logo_image][:image]
        # h_publisher_user_logo_image[:user_id] = publisher_user.user_id
        # h_publisher_user_logo_image[:publisher_id] = publisher_user.publisher_id
        # h_publisher_user_logo_image[:publisher_user_id] = publisher_user.id
        # # h_publisher_user_logo_image[:primary] = false 
        # publisher_user_logo_image = PublisherUserLogoImage.new(h_publisher_user_logo_image)
        # if request.xhr? || remotipart_submitted?
            # if publisher_user_logo_image.save
              # # @publisher_user_logo_images = publisher_user.publisher_user_images.first     
              # # @publisher_user_logo_image = @publisher_user_logo_images.where().first
              # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", publisher_user.id).first rescue nil
            # else
              # # error save
            # end
        # else
          # # render text: 'Remote call failed'
        # end
    # else
      # #
    # end
    

  end  



  def upload_publisher_user_logo_image_change

    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
    if !publisher_user.nil?
        publisher_user_logo_images = publisher_user.publisher_user_logo_images     
        publisher_user_logo_image = publisher_user_logo_images.first
        if !publisher_user_logo_image.nil?
            if publisher_user_logo_image.destroy
            else      
              #
            end
        else
            #
        end
    end


    @id_image_logo = nil
    @crop_x_logo = 0
    @crop_y_logo = 0
    @crop_w_logo = 200
    @crop_h_logo = 200
    
    if !publisher_user.nil?
        h_publisher_user_logo_image = Hash.new
        h_publisher_user_logo_image[:image] = params[:publisher_user_logo_image][:image]
        h_publisher_user_logo_image[:user_id] = publisher_user.user_id
        h_publisher_user_logo_image[:publisher_id] = publisher_user.publisher_id
        h_publisher_user_logo_image[:publisher_user_id] = publisher_user.id
        h_publisher_user_logo_image[:crop_x] = @crop_x
        h_publisher_user_logo_image[:crop_y] = @crop_y
        h_publisher_user_logo_image[:crop_w] = @crop_w
        h_publisher_user_logo_image[:crop_h] = @crop_h
        publisher_user_logo_image = PublisherUserLogoImage.new(h_publisher_user_logo_image)

        if request.xhr? || remotipart_submitted?
            if publisher_user_logo_image.save
                publisher_user_logo_image = publisher_user.publisher_user_logo_images.first rescue nil
                if !publisher_user_logo_image.nil? 

                    @id_image_logo = publisher_user_logo_image.id
                    @publisher_user_logo_image = publisher_user_logo_image

                    img = publisher_user_logo_image
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

                    @crop_x_logo = x
                    @crop_y_logo = y
                    @crop_w_logo = l
                    @crop_h_logo = l

                    h_update = Hash.new
                    h_update[:crop_x] = x
                    h_update[:crop_y] = y
                    h_update[:crop_w] = l
                    h_update[:crop_h] = l
                    if publisher_user_logo_image.update_attributes(h_update)
                      #                      
                    else
                      #  
                    end
                else
                  Rails.logger.info "publisher_user_logo_image = nil"
                end
            else
              # error save
            end
        else
          # 
        end
    else
      #
    end

    # respond_to do |format|
      # format.html
      # # format.js
      # # format.js { render :js => "window.location.replace('#{article_path(@article)}');"}
      # format.js { render :js => { :id_image => id_image,
                                  # :crop_x => crop_x,
                                  # :crop_y => crop_y,
                                  # :crop_w => crop_w,
                                  # :crop_h => crop_h
                                # }
                # }
    # end


  end  



  def create_post_user_image
    
      post_user_images = nil
    
      @id_image = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200

    
      # post_user = current_user.post_users.where("id = ?", post_user_id).first rescue nil
      post_user = @@current_post_user
      Rails.logger.info('post_user id = ' + post_user.id.to_s)
    
      if !post_user.nil?
        
          h_post_user_image = Hash.new
          h_post_user_image[:user_id] = current_user.id
          h_post_user_image[:post_user_id] = post_user.id
          h_post_user_image[:image] = params[:post_user_image][:image]
          # h_post_user_image[:primary] = true
          h_post_user_image[:crop_x] = @crop_x
          h_post_user_image[:crop_y] = @crop_y
          h_post_user_image[:crop_w] = @crop_w
          h_post_user_image[:crop_h] = @crop_h
          
          # post_user_image = PostUserImage.new(h_post_user_image)
          post_user_image = post_user.post_user_images.build(h_post_user_image)
          
          if request.xhr? || remotipart_submitted?
              if post_user_image.save
                  # post_user = current_user.post_users.where("id = ?", post_user.id ).first rescue nil
                  # post_user_image = post_user.post_user_images.where("id = ?", post_user_image.id ).first rescue nil     
                  if !post_user_image.nil? 
                      img = post_user_image
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
                      @crop_x = x
                      @crop_y = y
                      @crop_w = l
                      @crop_h = l
                      h_update = Hash.new
                      h_update[:crop_x] = x
                      h_update[:crop_y] = y
                      h_update[:crop_w] = l
                      h_update[:crop_h] = l
                      if post_user_image.update_attributes(h_update)
                        #                      
                      else
                        #  
                      end
                      # post_user = post_user_image.post_user
                      post_user_images = post_user_image.post_user.post_user_images
                      # @post_user_created_id = post_user.id
                  else
                      Rails.logger.info "post_user_image = nil"
                  end
              else
                # error save
              end
          else
            # 
          end
      else
          Rails.logger.info "post_user = nil"
      end
    
    
      return post_user_images
  end





  def upload_post_user_image

      @post_user_images = nil
      
      # Rails.logger.info "current_post_user = " + @@post_user_id_created.to_s
      # if @@current_post_user.nil?
        # if add_post_user
            # Rails.logger.info "after add_post_user, current_post_user.id = " + @@current_post_user.id
            # post_user_images = create_post_user_image(@@current_user)          
        # end
      # else
        # post_user_images = create_post_user_image(@@post_user_id_created)
      # end    

      if @@current_post_user.nil?
        add_post_user
      end    

      @post_user_images = create_post_user_image
  end  


  def upload_publisher_user_plot_image
    
      publisher_user_plot_image = nil
    
      @id_image = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200

    
      # post_user = current_user.post_users.where("id = ?", post_user_id).first rescue nil
      # post_user = @@current_post_user
      # Rails.logger.info('post_user id = ' + post_user.id.to_s)
    
        
      h_publisher_user_plot_image = Hash.new
      h_publisher_user_plot_image[:user_id] = current_user.id
      h_publisher_user_plot_image[:publisher_id] = current_user.pubisher.id
      h_publisher_user_plot_image[:publisher_user_id] = current_user.pubisher_user.id
      h_publisher_user_plot_image[:publisher_user_plot_id] = current_user.publisher_user.publisher_user_plot.id
      h_publisher_user_plot_image[:image] = params[:publisher_user_plot_image][:image]
      h_publisher_user_plot_image[:primary] = true
      h_publisher_user_plot_image[:crop_x] = @crop_x
      h_publisher_user_plot_image[:crop_y] = @crop_y
      h_publisher_user_plot_image[:crop_w] = @crop_w
      h_publisher_user_plot_image[:crop_h] = @crop_h
      
      # publisher_user_plot_image = PostUserImage.new(h_publisher_user_plot_image)
      publisher_user_plot_image = current_user.publisher_user.publisher_user_plot.publisher_user_plot_images.build(h_publisher_user_plot_image)
      
      if request.xhr? || remotipart_submitted?
          if publisher_user_plot_image.save
              # publisher_user_plot = current_user.publisher_user_plots.where("id = ?", publisher_user_plot.id ).first rescue nil
              # publisher_user_plot_image = publisher_user_plot.publisher_user_plot_images.where("id = ?", publisher_user_plot_image.id ).first rescue nil     
              if !publisher_user_plot_image.nil? 
                  img = publisher_user_plot_image
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
                  @crop_x = x
                  @crop_y = y
                  @crop_w = l
                  @crop_h = l
                  h_update = Hash.new
                  h_update[:crop_x] = x
                  h_update[:crop_y] = y
                  h_update[:crop_w] = l
                  h_update[:crop_h] = l
                  if publisher_user_plot_image.update_attributes(h_update)
                    #                      
                  else
                    #  
                  end
                  # publisher_user_plot = publisher_user_plot_image.publisher_user_plot
                  # publisher_user_plot_images = publisher_user_plot_image.publisher_user_plot.publisher_user_plot_images
                  publisher_user_plot_image = current_user.publisher_user.publisher_user_plot.publisher_user_plot_images.where("primary = ?", true).first rescue nil
                  # @publisher_user_plot_created_id = publisher_user_plot.id
              else
                  Rails.logger.info "publisher_user_plot_image = nil"
              end
          else
            # error save
          end
      else
        # 
      end
    
      @publisher_user_plot_image = publisher_user_plot_image

    
  end


  def upload_publisher_user_interest_image
  end


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
      
  def crop_commit_user
    
      img = UserImage.find(params[:image_id])
      image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # Rails.logger.info "image.details = " + image.details.to_s
      
      # new_image_200_200 = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # new_image_100_100 = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # new_image_50_50   = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
      # new_image_34_34   = MiniMagick::Image.open("public" + img.image_url(:image_600_600))

      # new_image_200_200 = cropped_image(new_image_200_200, params)
      # new_image_100_100 = cropped_image(new_image_100_100, params)
      # new_image_50_50   = cropped_image(new_image_50_50, params)
      # new_image_34_34   = cropped_image(new_image_34_34, params)

      # new_image_200_200 = resize_to_fill(new_image_200_200, 200, 200)
      # new_image_100_100 = resize_to_fill(new_image_100_100, 100, 100)
      # new_image_50_50   = resize_to_fill(new_image_50_50, 50, 50)
      # new_image_34_34   = resize_to_fill(new_image_34_34, 34, 34)

      # new_image_200_200.write image_200_200_path
      # new_image_100_100.write image_100_100_path
      # new_image_50_50.write image_50_50_path
      # new_image_34_34.write image_34_34_path
      
      crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
      new_image = image.crop(crop_params)
      
      img_name = File.basename(img.image.to_s)
      img_dir = "public" + File.dirname(img.image.to_s)

      image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
      image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
      image_50_50_path   = img_dir + "/" + "image_50_50_" + img_name
      image_34_34_path   = img_dir + "/" + "image_34_34_" + img_name

      FileUtils.rm_rf(image_200_200_path) 
      FileUtils.rm_rf(image_100_100_path) 
      FileUtils.rm_rf(image_50_50_path) 
      FileUtils.rm_rf(image_34_34_path) 

      new_image.resize('200x200')
      new_image.write image_200_200_path
      new_image.resize('100x100')
      new_image.write image_100_100_path      
      new_image.resize('50x50')
      new_image.write image_50_50_path      
      new_image.resize('34x34')
      new_image.write image_34_34_path

      x = params[:crop_x]
      y = params[:crop_y]
      w = params[:crop_w]
      h = params[:crop_h]
      x = x.to_i
      y = y.to_i
      w = w.to_i
      h = h.to_i

      h_crop = Hash.new
      h_crop[:crop_x] = x
      h_crop[:crop_y] = y
      h_crop[:crop_w] = w
      h_crop[:crop_h] = h

      @post_users = nil    
      @publisher_user_image_primary = nil

      publisher_user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil
      if !publisher_user_image_primary.nil?
          if publisher_user_image_primary.update_attributes(h_crop)
              @publisher_user_image_primary = publisher_user_image_primary  
              @post_users = current_user.feed
          else
            #
          end
      else
        #
      end


  end



  def crop_commit_logo
    
      # x = params[:crop_x]
      # y = params[:crop_y]
      # w = params[:crop_w]
      # h = params[:crop_h]
#   
      # img = PublisherUserLogoImage.find(params[:image_id])
      # image = Magick::Image.read("public" + img.image_url(:image_600_600))[0]
#   
      # x = x.to_i
      # y = y.to_i
      # w = w.to_i
      # h = h.to_i
      # image_new = image.crop(x, y, w, h)
#   
      # new_user_200_200 = image_new.resize_to_fill(200, 200)    
      # new_user_100_100 = image_new.resize_to_fill(100, 100)    
      # new_user_50_50 = image_new.resize_to_fill(50, 50)
      # new_user_34_34 = image_new.resize_to_fill(34, 34)
#   
      # user_200_200 = Magick::Image.read("public" + img.image_url(:user_200_200))[0]    
      # user_100_100 = Magick::Image.read("public" + img.image_url(:user_100_100))[0]
      # user_50_50 = Magick::Image.read("public" + img.image_url(:user_50_50))[0]
      # user_34_34 = Magick::Image.read("public" + img.image_url(:user_34_34))[0]
#   
      # # public/uploads/publisher_user_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
#   
      # user_200_200_filename = user_200_200.filename
      # user_100_100_filename = user_100_100.filename
      # user_50_50_filename = user_50_50.filename
      # user_34_34_filename = user_34_34.filename
#   
      # FileUtils.rm_rf(Dir.glob(user_200_200.filename))
      # FileUtils.rm_rf(Dir.glob(user_100_100.filename))
      # FileUtils.rm_rf(Dir.glob(user_50_50.filename))
      # FileUtils.rm_rf(Dir.glob(user_34_34.filename))
#       
      # new_user_200_200.write user_200_200_filename
      # new_user_100_100.write user_100_100_filename
      # new_user_50_50.write user_50_50_filename
      # new_user_34_34.write user_34_34_filename
#   
      # h_crop = Hash.new
      # h_crop[:crop_x] = x
      # h_crop[:crop_y] = y
      # h_crop[:crop_w] = w
      # h_crop[:crop_h] = h
#   
      # @publisher_user_logo_image = nil
      # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
      # if !publisher_user.nil?
          # publisher_user_logo_image = publisher_user.publisher_user_logo_images.first rescue nil
          # if !publisher_user_logo_image.nil?
              # if publisher_user_logo_image.update_attributes(h_crop)
                  # @publisher_user_logo_image = publisher_user_logo_image  
              # else
                # #
              # end
          # else
            # #
          # end
      # else
        # #
      # end
    
    
  end


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
