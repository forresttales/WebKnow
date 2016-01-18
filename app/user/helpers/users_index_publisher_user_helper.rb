module UsersIndexPublisherUserHelper

  def index_publisher_user
      
      begin
          # Rails.logger.info('render_index_publisher_user')
          
          # @new_user = false
          # if session[:new_user]
            # @new_user = true
          # end
      
          @user = current_user
          @publisher_user = nil
          # @publisher_user_image_primary = nil
          # @publisher_user_bkimage = nil
          # @user_image_primary = nil
          @post_users = nil
          @post_user = nil
          # gon.publisher_user_image_primary_url = nil
          gon.publisher_user_interest_interest_text = nil
  
          @background_1_images = nil
          @background_1_image = nil        
          @background_1_image_url = nil
          @background_1_image_id = nil
          gon.background_1_image_id = nil          
          @crop_x_background_1_image = nil
          @crop_y_background_1_image = nil
          @crop_w_background_1_image = nil
          @crop_h_background_1_image = nil
          
          @primary_1_image = nil
          @crop_x_primary_1_image = nil
          @crop_y_primary_1_image = nil
          @crop_w_primary_1_image = nil
          @crop_h_primary_1_image = nil
          gon.primary_1_image_url = nil
          gon.primary_1_image_id = nil

          @list_1_images = nil

          
          # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
          publisher_user = current_user.publisher_user rescue nil        
          if !publisher_user.nil?
              # Rails.logger.info('publisher_user not nil')
              @publisher_user = publisher_user
              @publisher_id = publisher_user.publisher_id
              @publisher_user_id = publisher_user.id
              
              # publisher = Publisher.find_by_id(@publisher_id)
              publisher = current_user.publisher rescue nil
              if !publisher.nil?
                
                  # # background_image_1 = publisher_product.publisher_user_background_images rescue nil
                  # publisher_user_background_image = publisher_user.publisher_user_background_images.where( :primary => true ).first rescue nil
                  # # @image_5 = image_5
                  # if !publisher_user_background_image.nil?
                    # @background_image_1 = publisher_user_background_image
                    # gon.background_image_1_id = publisher_user_background_image.id
                    # @background_image_1_id = publisher_user_background_image.id
                    # @background_image_1_url = publisher_user_background_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                    # @crop_x_background_image_1 = publisher_user_background_image.crop_x
                    # @crop_y_background_image_1 = publisher_user_background_image.crop_y
                    # @crop_w_background_image_1 = publisher_user_background_image.crop_w
                    # @crop_h_background_image_1 = publisher_user_background_image.crop_h
                  # else
                    # # Rails.logger.info('image_5 was nil in index')
                    # @background_image_1 = nil
                    # gon.background_image_1_id = nil
                    # @background_image_1_id = nil
                    # @background_image_1_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                  # end
      
                  background_1_image = publisher_user.publisher_user_background_images.where( :primary => true ).first rescue nil
                  if !background_1_image.nil?
                    @background_1_image = background_1_image
                    gon.background_1_image_id = background_1_image.id
                    @background_1_image_id = background_1_image.id
                    @background_1_image_url = background_1_image.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                    @crop_x_background_1_image = background_1_image.crop_x
                    @crop_y_background_1_image = background_1_image.crop_y
                    @crop_w_background_1_image = background_1_image.crop_w
                    @crop_h_background_1_image = background_1_image.crop_h
                  else
                    @background_1_image_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                  end
      
                  primary_1_image = current_user.publisher_user.publisher_user_images.where( :primary => true ).first rescue nil
                  if !primary_1_image.nil?
                    @primary_1_image = primary_1_image
                    gon.primary_1_image_id = primary_1_image.id
                    @crop_x_primary_1_image = primary_1_image.crop_x
                    @crop_y_primary_1_image = primary_1_image.crop_y
                    @crop_w_primary_1_image = primary_1_image.crop_w
                    @crop_h_primary_1_image = primary_1_image.crop_h
                  end
      
                  list_1_images = current_user.publisher_user.publisher_user_images.order('created_at DESC') rescue nil
                  if !list_1_images.nil?
                    @list_1_images = list_1_images
                  end
      
                  @user_friend_invitations_received = current_user.get_relate_user_friend_invitations_received rescue nil
                  @user_friend_invitations_sent = current_user.get_relate_user_friend_invitations_sent rescue nil
      
                  received = @user_friend_invitations_received.count
                  sent = @user_friend_invitations_sent.count
      
                  # Rails.logger.info('get_relate_user_friend_invitations_received = ' + received.to_s)
                  # Rails.logger.info('get_relate_user_friend_invitations_sent = ' + sent.to_s)




      
                  # user_followed_users = @user.followed_users
                  # user_followed_users.each do |user_followed_user| 
                  # user_id = user_followed_user.id                              
                  # user = User.find_by_id(user_id) rescue nil              
                  # user_image_primary = user.user_images.where( :primary => true ).first
                  # # user.slug
                  # if !user_image_primary.nil?                     
                  # user_image_primary.image_url(:user_100_100) if user_image_primary.image?
                  # else
                  # # src="../images_avatar/avatar_generic_1_w100_h100.png"        
                  # end                           
      
                  # @user_friends = current_user.user_friends
                  # @user_friends = nil
      
                  # user_friend_invited_ids = current_user.user_friends_invited
                  # @user_friend_invitations_received = current_user.user_friend_invitations_received rescue nil
                  # @user_friend_invitations_sent = current_user.user_friend_invitations_sent rescue nil
                  

                  # user_friends_invited.each do |user_friend_invited|
                    # #Rails.logger.info('user_friend_invited_id = ' + user_friend_invited_id.id.to_s)
                  # end
                  # list_user_friend_invited_images = current_user.publisher_user.publisher_user_images.order('created_at DESC') rescue nil
                  # if !list_1_images.nil?
                    # @list_1_images = list_1_images
                  # end


                  
                  # user_friend_invited_ids.each do |user_friend_invited_id|
                    # Rails.logger.info('user_friend_invited_id = ' + user_friend_invited_id.id.to_s)
                  # end
      
      
                  # @user_friends_invited_count = user_friends_invited.count
                  # Rails.logger.info('user_friend_invited_ids_count = ' + @user_friend_invited_ids_count.to_s)
                  
                  # user_friendships status 1 - invited
                  # user_invited_friends = current_user.user_friendships.where("status = ?", 1) rescue nil
                  # user_invited_friends_images = current_user.user_friendships.where("status = ?", 1) rescue nil
      
      
                  # @publisher_user_plot_text = publisher_user.publisher_user_plot.plot_text
                  # @post_user = current_user.post_users.build
                  # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
              
                  # @log_users = current_user.post_users.paginate(:page => params[:page], :per_page => 5)
                  # @log_users = current_user.feed_log
      
                  # @post_users = current_user.feed_log
                  
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
                  
                  gon.new_user = current_user.new_user
      
                  gon.user_name_first = ""
                  gon.b_user_name_first = false
                  gon.b_required_user_name_first = true
                  if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
                      gon.user_name_first = current_user.name_first
                      gon.b_user_name_first = true
                      gon.b_required_user_name_first = false
                  end
                  
                  gon.user_name_last = ""
                  gon.b_user_name_last = false
                  gon.b_required_user_name_last = true
                  if !((current_user.name_last.blank?) or (current_user.name_last.empty?) or (current_user.name_last.nil?)) 
                      gon.user_name_last = current_user.name_last
                      gon.b_user_name_last = true
                      gon.b_required_user_name_last = false
                  end
              
                  gon.user_email = ""
                  gon.b_user_email = false
                  gon.b_required_user_email = true
                  if !((current_user.email.blank?) or (current_user.email.empty?) or (current_user.email.nil?)) 
                      gon.user_email = current_user.email
                      gon.b_user_email = true
                      gon.b_required_user_email = false
                  end
                
                  gon.user_gender = current_user.gender
                  gon.b_user_gender = true
                  gon.b_required_user_gender = false
      
                  gon.user_gender_text = current_user.gender_text
                  gon.b_user_gender_text = true
                  gon.b_required_user_gender_text = false
                  
                  gon.user_bd_day = current_user.bd_day
                  gon.b_user_bd_day = true
                  gon.b_required_user_bd_day = false
      
                  gon.user_bd_month = current_user.bd_month
                  gon.user_bd_month = current_user.bd_month
                  gon.b_user_bd_month = true
                  gon.b_required_user_bd_month = false
                  
                  gon.user_bd_month_text = current_user.bd_month_text
                  gon.user_bd_month_text = current_user.bd_month_text
                  gon.b_user_bd_month_text = true
                  gon.b_required_user_bd_month_text = false
                  
                  gon.user_bd_year = current_user.bd_year
                  gon.b_user_bd_year = true
                  gon.b_required_user_bd_year = false
                  
                  
                  gon.name_first = ""
                  gon.b_name_first = false
                  gon.b_required_name_first = true
                  if !((current_user.name_first.blank?) or (current_user.name_first.empty?) or (current_user.name_first.nil?)) 
                      gon.name_first = current_user.name_first
                      gon.b_name_first = true
                      gon.b_required_name_first = false
                  end
                  
                  gon.name_last = ""
                  gon.b_name_last = false
                  gon.b_required_name_last = true
                  if !((current_user.name_last.blank?) or (current_user.name_last.empty?) or (current_user.name_last.nil?)) 
                      gon.name_last = current_user.name_last
                      gon.b_name_last = true
                      gon.b_required_name_last = false
                  end
              
                  gon.email = ""
                  gon.b_email = false
                  gon.b_required_email = true
                  if !((publisher_user.email.blank?) or (publisher_user.email.empty?) or (publisher_user.email.nil?)) 
                      gon.email = publisher_user.email
                      gon.b_email = true
                      gon.b_required_email = false
                  end
              
                  gon.location = ""
                  gon.b_location = false
                  gon.b_required_location = true
                  if !((publisher_user.location.blank?) or (publisher_user.location.empty?) or (publisher_user.location.nil?)) 
                      gon.location = publisher_user.location
                      gon.b_location = true
                      gon.b_required_location = false
                  end
              
                  gon.name_alias = ""
                  gon.b_name_alias = false
                  gon.b_required_name_alias = true
                  if !((publisher_user.name_alias.blank?) or (publisher_user.name_alias.empty?) or (publisher_user.name_alias.nil?)) 
                      gon.name_alias = publisher_user.name_alias
                      gon.b_name_alias = true
                      gon.b_required_name_alias = false
                  end
              
                  gon.job_title = ""
                  gon.b_job_title = false
                  gon.b_required_job_title = true
                  if !((publisher_user.job_title.blank?) or (publisher_user.job_title.empty?) or (publisher_user.job_title.nil?)) 
                      gon.job_title = publisher_user.job_title
                      gon.b_job_title = true
                      gon.b_required_job_title = false
                  end
              
                  gon.name_company = ""
                  gon.b_name_company = false
                  gon.b_required_name_company = true
                  if !((publisher_user.name_company.blank?) or (publisher_user.name_company.empty?) or (publisher_user.name_company.nil?)) 
                      gon.name_company = publisher_user.name_company
                      gon.b_name_company = true
                      gon.b_required_name_company = false
                  end
              
                  gon.time_at_company = ""
                  gon.b_time_at_company = false
                  gon.b_required_time_at_company = true
                  if !((publisher_user.time_at_company.blank?) or (publisher_user.time_at_company.empty?) or (publisher_user.time_at_company.nil?)) 
                      gon.time_at_company = publisher_user.time_at_company
                      gon.b_time_at_company = true
                      gon.b_required_time_at_company = false
                  end
              
                  gon.website = ""
                  gon.b_website = false
                  gon.b_required_website = true
                  if !((publisher_user.website.blank?) or (publisher_user.website.empty?) or (publisher_user.website.nil?)) 
                      gon.website = publisher_user.website
                      gon.b_website = true
                      gon.b_required_website = false
                  end
              
                  gon.phone_company = ""
                  gon.b_phone_company = false
                  gon.b_required_phone_company = true
                  if !((publisher_user.phone_company.blank?) or (publisher_user.phone_company.empty?) or (publisher_user.phone_company.nil?)) 
                      gon.phone_company = publisher_user.phone_company
                      gon.b_phone_company = true
                      gon.b_required_phone_company = false
                  end
                  
                  # slug_user = current_user.slug
                  # @url_my_story_public = '/ppuid' + slug_user
      
                  publisher_user_interest = publisher_user.publisher_user_interest rescue nil
                  if !publisher_user_interest.nil?
                      gon.publisher_user_interest_interest_text = publisher_user_interest.interest_text rescue nil
                  end
                
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'index_publisher_user', :description => 'publisher was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'index_publisher_user', :description => 'publisher_user was nil')
              raise
          end
        
          prepend_view_path 'app/views/publisher'
          render 'publisher_users/index', :layout => 'publisher_users_index'

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'index_publisher_user', :description => e.message.to_s)
          @errors = true
          
      end

      
  end

  
end