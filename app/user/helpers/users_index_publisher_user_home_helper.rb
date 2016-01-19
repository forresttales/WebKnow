module UsersIndexPublisherUserHomeHelper

  def index_publisher_user_home

      Rails.logger.info('render_index_publisher_user_home')

      begin
                
          @primary_1_image = nil
          gon.primary_1_image_url = nil
          gon.primary_1_image_id = nil
                
          # @user = current_user
          # @publisher_user = nil
          # @publisher_user_image_primary = nil
          # @user_image_primary = nil
          @post_users = nil
          @post_user = nil
          # gon.publisher_user_image_primary_url = nil
        
        
          publisher_user = current_user.publisher_user rescue nil        
          if !publisher_user.nil?
              # Rails.logger.info('publisher_user not nil')
              @publisher_user = publisher_user
              @publisher_id = publisher_user.publisher_id
              @publisher_user_id = publisher_user.id
              
              # publisher = Publisher.find_by_id(@publisher_id)
              publisher = current_user.publisher rescue nil
              if !publisher.nil?

                  primary_1_image = current_user.publisher_user.publisher_user_images.where( :primary => true ).first rescue nil
                  if !primary_1_image.nil?
                    @primary_1_image = primary_1_image
                    gon.primary_1_image_id = primary_1_image.id
                  end
        
                  # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
                  # publisher_user = current_user.publisher_user
                  # if !publisher_user.nil?
                      # @publisher_user = publisher_user
                      # @publisher_id = publisher_user.publisher_id
                      # @publisher_user_id = publisher_user.id
                      # # publisher = Publisher.find_by_id(@publisher_id)
                      # publisher = current_user.publisher
                      # if !publisher.nil?
                          # @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil
                          # if !@publisher_user_image_primary.nil?
                            # gon.publisher_user_image_primary_url = @publisher_user_image_primary.image_url()
                          # end
                          # # @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first
                          # # gon.publisher_user_image_primary_url = @publisher_user_image_primary.image_url()
                          # # # <%= @publisher_user_image_primary.image_url() + '?' + (rand(10..90) * rand(100..900)).to_s if @publisher_user_image_primary.image? %>
                          # # n = @publisher_user_image_primary.nil?
                          # # Rails.logger.info('@publisher_user_image_primary nil = ' + n.to_s)
                          # # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
                      # else
                        # #
                      # end
          
          
            

                  # @post_user = current_user.post_users.build
                  # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)

                  @post_users = current_user.feed
                  # @post_user_files = current_user.post_users.post_user_files rescue nil          

                  # if !@post_user_files.nil?
                      # Rails.logger.info('post_user_files not nil')
                  # else
                      # Rails.logger.info('post_user_files was nil')
                  # end
                  # Rails.logger.info('render_index_publisher_user_home')
       
              
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
            
                  prepend_view_path 'app/views/publisher/user'
                  render 'publisher_user_homes/index', :layout => 'publisher_user_homes_index'
        
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'index_publisher_user_home', :description => 'publisher was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'index_publisher_user_home', :description => 'publisher_user was nil')
              raise
          end
        
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'index_publisher_user_home', :description => e.message.to_s)
          @errors = true
          
      end
        

  end

  
end