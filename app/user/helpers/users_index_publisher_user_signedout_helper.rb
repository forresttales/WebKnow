module UsersIndexPublisherUserSignedoutHelper

  def index_publisher_user_signedout(user)

      begin
        
          Rails.logger.info('in index_public_publisher_user_signedout')
          
          @public_user = nil    
          @public_publisher_user = nil
          # @public_publisher_user_image_primary = nil
          # @public_publisher_user_logo_image = nil
          
          @signed_in_user_options = signed_in?
          @b_signed_in = signed_in?
          @b_relate_user_friend = false
          # id_passed = params[:id]
          # @url_my_story = '/puid' + id_passed
          # @friendly_id = id_passed
          # publisher_user = PublisherUser.friendly.find(id_passed) rescue nil
    
          @relate_user_friend_invitation_exists = false
          @relate_user_friend_invitation_received = false
          @relate_user_friend_invitation_sent = false
    
          public_publisher_user = user.publisher_user rescue nil
          if !public_publisher_user.nil?
              @public_user = user          
              @public_publisher_user = public_publisher_user
              # @public_publisher_user_image_primary = user.user_images.where( :primary => true ).first
              
              
              # relate_user_friend = current_user.get_relate_user_friend(current_user.id, user.id) rescue nil
              # if relate_user_friend.nil?
                  # # Rails.logger.info('relate_user_friend id = ' + relate_user_friend.id.to_s)
                  # relate_user_friend_invitation = current_user.get_relate_user_friend_invitation rescue nil
                  # # Rails.logger.info('relate_user_friend_invitation id = ' + relate_user_friend_invitation.id.to_s)
                  # if !relate_user_friend_invitation.nil?
                      # # Rails.logger.info('relate_user_friend_invitation was not nil')
                      # user_friend_to_id = relate_user_friend_invitation.user_friend_to_id rescue nil 
                      # if !user_friend_to_id.nil?
                          # if (user_friend_to_id == current_user.id)
                              # @relate_user_friend_invitation_received = true
                              # @relate_user_friend_invitation_exists = true
                          # else
                              # user_friend_from_id = relate_user_friend_invitation.user_friend_from_id rescue nil
                              # if !user_friend_from_id.nil?
                                  # if (user_friend_from_id == current_user.id)
                                      # @relate_user_friend_invitation_sent = true
                                      # @relate_user_friend_invitation_exists = true
                                  # else
                                      # #
                                  # end
                              # else
                                  # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_public_publisher_user', :description => 'user_friend_to_id and user_friend_from_id were both nil')
                                  # raise
                                  # # Rails.logger.info('user_friend_to_id and user_friend_from_id were both nil')
                              # end
                          # end
                      # else
                          # #
                      # end
                  # else
                      # # Rails.logger.info('relate_user_friend_invitation was nil')
                  # end
              # else
                  # @b_relate_user_friend = true
                  # # Rails.logger.info('relate_user_friend was nil')
              # end

              
              background_1_image = public_publisher_user.publisher_user_background_images.where( :primary => true ).first rescue nil
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
  
              primary_1_image = public_publisher_user.publisher_user_images.where( :primary => true ).first rescue nil
              if !primary_1_image.nil?
                @primary_1_image = primary_1_image
                gon.primary_1_image_id = primary_1_image.id
                @crop_x_primary_1_image = primary_1_image.crop_x
                @crop_y_primary_1_image = primary_1_image.crop_y
                @crop_w_primary_1_image = primary_1_image.crop_w
                @crop_h_primary_1_image = primary_1_image.crop_h
              end
  
              list_1_images = public_publisher_user.publisher_user_images.order('created_at DESC') rescue nil
              if !list_1_images.nil?
                @list_1_images = list_1_images
              end
  
              # @user_friend_invitations_received = user.get_relate_user_friend_invitations_received rescue nil
              # @user_friend_invitations_sent = user.get_relate_user_friend_invitations_sent rescue nil
              # received = @user_friend_invitations_received.count
              # sent = @user_friend_invitations_sent.count
  
              # Rails.logger.info('get_relate_user_friend_invitations_received = ' + received.to_s)
              # Rails.logger.info('get_relate_user_friend_invitations_sent = ' + sent.to_s)




              
              # gon.new_user = user.new_user
  
              # gon.user_name_first = ""
              # gon.b_user_name_first = false
              # gon.b_required_user_name_first = true
              # if !((user.name_first.blank?) or (user.name_first.empty?) or (user.name_first.nil?)) 
                  # gon.user_name_first = user.name_first
                  # gon.b_user_name_first = true
                  # gon.b_required_user_name_first = false
              # end
              # gon.user_name_last = ""
              # gon.b_user_name_last = false
              # gon.b_required_user_name_last = true
              # if !((user.name_last.blank?) or (user.name_last.empty?) or (user.name_last.nil?)) 
                  # gon.user_name_last = user.name_last
                  # Rails.logger.info('name_last = ' + user.name_last)
                  # gon.b_user_name_last = true
                  # gon.b_required_user_name_last = false
              # end
              # gon.user_email = ""
              # gon.b_user_email = false
              # gon.b_required_user_email = true
              # if !((user.email.blank?) or (user.email.empty?) or (user.email.nil?)) 
                  # gon.user_email = user.email
                  # gon.b_user_email = true
                  # gon.b_required_user_email = false
              # end
            
              gon.user_gender = user.gender
              gon.b_user_gender = true
              gon.b_required_user_gender = false
  
              gon.user_gender_text = user.gender_text
              gon.b_user_gender_text = true
              gon.b_required_user_gender_text = false
              
              gon.user_bd_day = user.bd_day
              gon.b_user_bd_day = true
              gon.b_required_user_bd_day = false
  
              gon.user_bd_month = user.bd_month
              gon.user_bd_month = user.bd_month
              gon.b_user_bd_month = true
              gon.b_required_user_bd_month = false
              
              gon.user_bd_month_text = user.bd_month_text
              gon.user_bd_month_text = user.bd_month_text
              gon.b_user_bd_month_text = true
              gon.b_required_user_bd_month_text = false
              
              gon.user_bd_year = user.bd_year
              gon.b_user_bd_year = true
              gon.b_required_user_bd_year = false
              
              
              gon.name_first = ""
              gon.b_name_first = false
              gon.b_required_name_first = true
              if !((user.name_first.blank?) or (user.name_first.empty?) or (user.name_first.nil?)) 
                  gon.name_first = user.name_first
                  gon.b_name_first = true
                  gon.b_required_name_first = false
              end
              
              gon.name_last = ""
              gon.b_name_last = false
              gon.b_required_name_last = true
              if !((user.name_last.blank?) or (user.name_last.empty?) or (user.name_last.nil?)) 
                  gon.name_last = user.name_last
                  gon.b_name_last = true
                  gon.b_required_name_last = false
              end
          
              gon.email = ""
              gon.b_email = false
              gon.b_required_email = true
              if !((public_publisher_user.email.blank?) or (public_publisher_user.email.empty?) or (public_publisher_user.email.nil?)) 
                  gon.email = public_publisher_user.email
                  gon.b_email = true
                  gon.b_required_email = false
              end
          
              gon.location = ""
              gon.b_location = false
              gon.b_required_location = true
              if !((public_publisher_user.location.blank?) or (public_publisher_user.location.empty?) or (public_publisher_user.location.nil?)) 
                  gon.location = public_publisher_user.location
                  gon.b_location = true
                  gon.b_required_location = false
              end
          
              gon.name_alias = ""
              gon.b_name_alias = false
              gon.b_required_name_alias = true
              if !((public_publisher_user.name_alias.blank?) or (public_publisher_user.name_alias.empty?) or (public_publisher_user.name_alias.nil?)) 
                  gon.name_alias = public_publisher_user.name_alias
                  gon.b_name_alias = true
                  gon.b_required_name_alias = false
              end
          
              gon.job_title = ""
              gon.b_job_title = false
              gon.b_required_job_title = true
              if !((public_publisher_user.job_title.blank?) or (public_publisher_user.job_title.empty?) or (public_publisher_user.job_title.nil?)) 
                  gon.job_title = public_publisher_user.job_title
                  gon.b_job_title = true
                  gon.b_required_job_title = false
              end
          
              gon.name_company = ""
              gon.b_name_company = false
              gon.b_required_name_company = true
              if !((public_publisher_user.name_company.blank?) or (public_publisher_user.name_company.empty?) or (public_publisher_user.name_company.nil?)) 
                  gon.name_company = public_publisher_user.name_company
                  gon.b_name_company = true
                  gon.b_required_name_company = false
              end
          
              gon.time_at_company = ""
              gon.b_time_at_company = false
              gon.b_required_time_at_company = true
              if !((public_publisher_user.time_at_company.blank?) or (public_publisher_user.time_at_company.empty?) or (public_publisher_user.time_at_company.nil?)) 
                  gon.time_at_company = public_publisher_user.time_at_company
                  gon.b_time_at_company = true
                  gon.b_required_time_at_company = false
              end
          
              gon.website = ""
              gon.b_website = false
              gon.b_required_website = true
              if !((public_publisher_user.website.blank?) or (public_publisher_user.website.empty?) or (public_publisher_user.website.nil?)) 
                  gon.website = public_publisher_user.website
                  gon.b_website = true
                  gon.b_required_website = false
              end
          
              gon.phone_company = ""
              gon.b_phone_company = false
              gon.b_required_phone_company = true
              if !((public_publisher_user.phone_company.blank?) or (public_publisher_user.phone_company.empty?) or (public_publisher_user.phone_company.nil?)) 
                  gon.phone_company = public_publisher_user.phone_company
                  gon.b_phone_company = true
                  gon.b_required_phone_company = false
              end
              
              # slug_user = user.slug
              # @url_my_story_public = '/ppuid' + slug_user
  
              publisher_user_interest = public_publisher_user.publisher_user_interest rescue nil
              if !publisher_user_interest.nil?
                  gon.publisher_user_interest_interest_text = publisher_user_interest.interest_text rescue nil
              end
              
              # Rails.logger.info('user_friend_invitation_exists = ' + @user_friend_invitation_exists.to_s)
              
              prepend_view_path 'app/views/publisher/user'
              render 'publisher_user_signedouts/index', :layout => 'publisher_user_signedouts_index'
          else
              # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_public_publisher_user', :description => 'public_publisher_user was nil')
              # raise
              # Catch error, here, which shouldn't be necessary, as the passed id was already verified.
              # Rails.logger.info('render_index_public_publisher_user public_publisher_user = nil')
              # redirect_to '/Signin'
          end
    
      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_public_publisher_user_signedout', :description => e.message.to_s)
      end



      # Rails.logger.info('render_index_public_publisher_user_signedout')
      # @user = nil    
      # @publisher_user = nil
      # @publisher_user_image_primary = nil
      # @publisher_user_logo_image = nil
      # @signed_in_user_options = signed_in?
      # @b_signed_in = signed_in?
      # # id_passed = params[:id]
      # publisher_user = user.publisher_user
      # if !publisher_user.nil?
          # @user = user          
          # @publisher_user = publisher_user
          # @publisher_user_image_primary = user.user_images.where( :primary => true ).first
          # @publisher_user_logo_image = publisher_user.publisher_user_logo_images.first
          # @post_users = user.feed_log # .paginate(:page => params[:page], :per_page => 5)
          # render 'public_publisher_users_signedout/index', :layout => 'public_publisher_user'
      # else
          # # Catch error, here, which shouldn't be necessary, as the passed id was already verified.
          # Rails.logger.info('render_index_public_publisher_user_signedout publisher_user = nil')
          # redirect_to '/Signin'
      # end
    
  
  end
  
    
end