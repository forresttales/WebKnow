class PublisherUserHomesController < ApplicationController

  prepend_view_path 'app/views/publisher'
  
  layout 'publisher_user_homes_index'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  before_action :verify_signin


  @@current_post_user = nil


  def verify_signin
    
      if !signed_in?
          redirect_to '/Signin'
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
      Rails.logger.info('cancel_post_user called')
      if !@@current_post_user.nil?
          @@current_post_user.destroy
      end    
      @@current_post_user = nil
  end


  # def cancel_post_user_on_close
      # Rails.logger.info('cancel_post_user_on_close called')
      # if @@current_post_user
          # if @@current_post_user.destroy
              # # Rails.logger.info('@@current_post_user.destroy successful')
          # else
              # # Rails.logger.info('@@current_post_user.destroy failed')
          # end
      # else
          # Rails.logger.info('@@current_post_user = nil')
      # end    
      # @@current_post_user = nil
  # end



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
              @@current_post_user = nil
              # @post_user_presave = nil
              @post_users = current_user.post_users
              # @post_user_files_presave = nil              
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



  def create_post_user_image

      begin
            
          @id_image = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
    
          post_user = @@current_post_user rescue nil
        
          if !post_user.nil?
            
              h_post_user_image = Hash.new
              h_post_user_image[:user_id] = current_user.id
              h_post_user_image[:post_user_id] = post_user.id
              h_post_user_image[:image] = params[:post_user_image][:image]
              h_post_user_image[:image_name] = params[:post_user_image][:image].original_filename
              # Rails.logger.info "filename = " + params[:post_user_image][:image].original_filename
              
              # h_post_user_image[:primary] = true
              h_post_user_image[:crop_x] = @crop_x
              h_post_user_image[:crop_y] = @crop_y
              h_post_user_image[:crop_w] = @crop_w
              h_post_user_image[:crop_h] = @crop_h
              
              # post_user_image = PostUserImage.new(h_post_user_image)
              post_user_image = post_user.post_user_images.build(h_post_user_image) rescue nil
              if !post_user_image.nil?
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
                                  post_user_id = @@current_post_user.id rescue nil
                                  if !post_user_id.nil?
                                      post_user_updated = current_user.post_users.where("id = ?", post_user_id).first rescue nil
                                      if !post_user_updated.nil?
                                          post_user = post_user_updated
                                      else
                                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user_updated was nil')
                                          raise
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user_id was nil')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user_image update_attributes failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user_image was nil after save')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'request.xhr remotipart_submitted failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => 'post_user was nil')
              raise
          end
        
          return post_user
      
      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'create_post_user_image', :description => e.message.to_s)
      end
      
      
  end



  def upload_post_user_image

      begin
        
          @post_user = nil
          
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
    
          @post_user = create_post_user_image
      
      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'upload_post_user_image', :description => e.message.to_s)
      end
      
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



  def upload_post_user_file

      # @post_user_presave = nil
      @post_user = nil
      # @post_user_files_presave = nil

      if @@current_post_user.nil?
          add_post_user
      end 

      Rails.logger.info params.to_yaml
      post_user = @@current_post_user
      Rails.logger.info('post_user id = ' + post_user.id.to_s)
      Rails.logger.info('post_user user_id = ' + post_user.user_id.to_s)

      if !post_user.nil?
          h_post_user_file = Hash.new
          #h_post_user_file[:user_id] = current_user.id
          #h_post_user_file[:post_user_id] = post_user.id
          h_post_user_file[:file] = params[:post_user_file][:file]
          h_post_user_file[:file_name] = params[:post_user_file][:file].original_filename.to_s
      
          # post_user_image = PostUserImage.new(h_post_user_file)
          post_user_file = post_user.post_user_files.build(h_post_user_file)

          if request.xhr? || remotipart_submitted?
              if post_user_file.save
                  if !post_user_file.nil?
                      # @post_user_files = post_user_file.post_user.post_user_files
                      # @post_user_presave = post_user_file.post_user
                      # @post_user_presave = post_user
                      @post_user = post_user
                      # @post_user_files_presave = post_user.post_user_files
                  else
                      Rails.logger.info "post_user_file = nil"
                  end
              else
                  Rails.logger.info "post_user_file: save error"
              end
          else
              #
          end
      else
          Rails.logger.info "post_user = nil"
      end


  end



  def destroy_post_user_file
    
      begin    

          post_user_id = params[:post_user_id]
          post_user_file_id = params[:post_user_file_id]
          
          post_user = current_user.post_users.where("id = ?", post_user_id).first rescue nil
          if !post_user.nil?
              post_user_file = post_user.post_user_files.where("id = ?", post_user_file_id).first rescue nil
              if !post_user_file.nil?
                  if post_user_file.destroy
                      post_user_updated = current_user.post_users.where("id = ?", post_user_id).first rescue nil
                      if !post_user_updated.nil?
                          # @post_user_presave = post_user_updated
                          @post_user = post_user_updated
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_file', :description => 'post_user_updated was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_file', :description => 'post_user_file destroy failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_file', :description => 'post_user_file was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_file', :description => 'post_user was nil')
              raise
          end

      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_file', :description => e.message.to_s)
      end

    
  end



  def destroy_post_user_image
    
      begin    

          post_user_id = params[:post_user_id]
          post_user_image_id = params[:post_user_image_id]
          
          post_user = current_user.post_users.where("id = ?", post_user_id).first rescue nil
          if !post_user.nil?
              post_user_image = post_user.post_user_images.where("id = ?", post_user_image_id).first rescue nil
              if !post_user_image.nil?
                  if post_user_image.destroy
                      post_user_updated = current_user.post_users.where("id = ?", post_user_id).first rescue nil
                      if !post_user_updated.nil?
                          # @post_user_presave = post_user_updated
                          @post_user = post_user_updated
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_image', :description => 'post_user_updated was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_image', :description => 'post_user_image destroy failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_image', :description => 'post_user_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_image', :description => 'post_user was nil')
              raise
          end

      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'destroy_post_user_image', :description => e.message.to_s)
      end

    
  end



  def test_download

      begin
            
          post_user_id = params[:post_user_id]
          post_user_file_id = params[:post_user_file_id]

          post_users = current_user.post_users
          post_user = post_users.where('id = ?', post_user_id).first rescue nil
          post_user_file = post_user.post_user_files.where('id = ?', post_user_file_id).first rescue nil
          post_user_file_file = 'public' + post_user_file.file.to_s 
          
          # Rails.logger.info('test_download post_user_file_id = ' + post_user_file.id.to_s)
          # Rails.logger.info('test_download post_user_file_file = ' + post_user_file_file)

          # send_file '/home/clyde/test.txt', :type=>"application/txt", :x_sendfile=>true      
          send_file post_user_file_file
          
      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_user_homes', :action => 'test_download', :description => e.message.to_s)
      end      
      
  end
  

  
end
