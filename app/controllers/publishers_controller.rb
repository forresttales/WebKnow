class PublishersController < ApplicationController
  
  #require 'RMagick'
  
  layout 'publisher'

  respond_to :html, :js, :json  

  #before_filter :confirm_logged_in

  # before_filter :force_http

  before_action :signed_in_user, only: [:index, :index_demo]
  before_action :verify_id, only: [:index, :index_demo]
  before_action :fill_left_directory, only: [:index, :index_demo]

  @@current_post_publisher = nil
    
  def verify_id

    id_passed = params[:id]
    if !id_passed.nil?
        publisher_passed = Publisher.friendly.find(id_passed) rescue nil
        if !publisher_passed.nil?
            publisher_current = current_user.publisher
            if !(publisher_passed.id == publisher_current.id)
                raise ActionController::RoutingError.new('Not Found')
            end
        else
          #
        end
    else
        user_my_story_url = '/puid' + current_user.slug
        redirect_to user_my_story_url
    end
    
    
  end    


  def fill_left_directory

    slug_user = current_user.slug
    slug_publisher = current_user.publisher.slug

    @url_my_story        = '/puid' + slug_user
    @url_corporate_story = '/pcid' + slug_publisher

    @url_my_story_demo        = '/puid-demo' + slug_user
    @url_corporate_story_demo = '/pcid-demo' + slug_publisher

  end
    
  def index_demo
    
    publisher = current_user.publisher
    slug_publisher = publisher.slug
    @url_corporate_story_public = '/ppcid-demo' + slug_publisher
    
  end
  
  
  def index

    @url_corporate_story_public = ""
    
    @publisher = nil
    @publisher_profile_image_primary = nil
    
    publisher = current_user.publisher rescue nil
    # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    if !publisher.nil?
        @publisher = publisher
        publisher_id = publisher.id
        publisher_logo_image_primary = PublisherLogoImage.where("publisher_id = ?", publisher_id).where( :primary => true ).first rescue nil
        if !publisher_logo_image_primary.nil?
            @publisher_logo_image_primary = publisher_logo_image_primary  
        else
          #
        end
        
        @url_corporate_story_public = '/ppcid' + publisher.slug
    else
        # exit if publisher nil
    end    
    
    
    gon.id_logo_image = nil
    @crop_x = 0
    @crop_y = 0
    @crop_w = 200
    @crop_h = 200
    if !@publisher_logo_image_primary.nil? 
      gon.id_logo_image = @publisher_logo_image_primary.id
      @crop_x = @publisher_logo_image_primary.crop_x
      @crop_y = @publisher_logo_image_primary.crop_y
      @crop_w = @publisher_logo_image_primary.crop_w
      @crop_h = @publisher_logo_image_primary.crop_h
    end
    
    # name_company                    
    # address1        
    # address2       
    # city            
    # state          
    # country                             
    # zip    
    # phone_company      
    # website       
    # email_info      
    # email_admin     
    # name_admin     
    # tagline_logo  
    # story_corporate
    
    gon.name_company = ""
    gon.b_name_company = false
    gon.b_required_name_company = true
    if !((publisher.name_company.blank?) or (publisher.name_company.empty?) or (publisher.name_company.nil?)) 
        # @b_name_company = true
        gon.name_company = publisher.name_company
        gon.b_name_company = true
        gon.b_required_name_company = false
    end
    
    gon.address1 = ""
    gon.b_address1 = false
    gon.b_required_address1 = true
    if !((publisher.address1.blank?) or (publisher.address1.empty?) or (publisher.address1.nil?)) 
        # @b_address1 = true
        gon.address1 = publisher.address1
        gon.b_address1 = true
        gon.b_required_address1 = false
    end

    gon.address2 = ""
    gon.b_address2 = false
    gon.b_required_address2 = true
    if !((publisher.address2.blank?) or (publisher.address2.empty?) or (publisher.address2.nil?)) 
        # @b_address2 = true
        gon.address2 = publisher.address2
        gon.b_address2 = true
        gon.b_required_address2 = false
    end

    gon.city = ""
    gon.b_city = false
    gon.b_required_city = true
    if !((publisher.city.blank?) or (publisher.city.empty?) or (publisher.city.nil?)) 
        # @b_city = true
        gon.city = publisher.city
        gon.b_city = true
        gon.b_required_city = false
    end

    gon.state = ""
    gon.b_state = false
    gon.b_required_state = true
    if !((publisher.state.blank?) or (publisher.state.empty?) or (publisher.state.nil?)) 
        # @b_state = true
        gon.state = publisher.state
        gon.b_state = true
        gon.b_required_state = false
    end

    gon.country = ""
    gon.b_country = false
    gon.b_required_country = true
    if !((publisher.country.blank?) or (publisher.country.empty?) or (publisher.country.nil?)) 
        # @b_country = true
        gon.country = publisher.country
        gon.b_country = true
        gon.b_required_country = false
    end

    gon.zip = ""
    gon.b_zip = false
    gon.b_required_zip = true
    if !((publisher.zip.blank?) or (publisher.zip.empty?) or (publisher.zip.nil?)) 
        # @b_zip = true
        gon.zip = publisher.zip
        gon.b_zip = true
        gon.b_required_zip = false
    end

    gon.phone_company = ""
    gon.b_phone_company = false
    gon.b_required_phone_company = true
    if !((publisher.phone_company.blank?) or (publisher.phone_company.empty?) or (publisher.phone_company.nil?)) 
        # @b_phone_company = true
        gon.phone_company = publisher.phone_company
        gon.b_phone_company = true
        gon.b_required_phone_company = false
    end

    gon.website = ""
    gon.b_website = false
    gon.b_required_website = true
    if !((publisher.website.blank?) or (publisher.website.empty?) or (publisher.website.nil?)) 
        # @b_website = true
        gon.website = publisher.website
        gon.b_website = true
        gon.b_required_website = false
    end
    
    gon.email_info = ""
    gon.b_email_info = false
    gon.b_required_email_info = true
    if !((publisher.email_info.blank?) or (publisher.email_info.empty?) or (publisher.email_info.nil?)) 
        # @b_email_info = true
        gon.email_info = publisher.email_info
        gon.b_email_info = true
        gon.b_required_email_info = false
    end

    gon.email_admin = ""
    gon.b_email_admin = false
    gon.b_required_email_admin = true
    if !((publisher.email_admin.blank?) or (publisher.email_admin.empty?) or (publisher.email_admin.nil?)) 
        # @b_email_admin = true
        gon.email_admin = publisher.email_admin
        gon.b_email_admin = true
        gon.b_required_email_admin = false
    end

    gon.name_admin = ""
    gon.b_name_admin = false
    gon.b_required_name_admin = true
    if !((publisher.name_admin.blank?) or (publisher.name_admin.empty?) or (publisher.name_admin.nil?)) 
        # @b_name_admin = true
        gon.name_admin = publisher.name_admin
        gon.b_name_admin = true
        gon.b_required_name_admin = false
    end

    gon.tagline_logo = ""
    gon.b_tagline_logo = false
    gon.b_required_tagline_logo = true
    if !((publisher.tagline_logo.blank?) or (publisher.tagline_logo.empty?) or (publisher.tagline_logo.nil?)) 
        # @b_tagline_logo = true
        gon.tagline_logo = publisher.tagline_logo
        gon.b_tagline_logo = true
        gon.b_required_tagline_logo = false
    end

    gon.story_corporate = ""
    gon.b_story_corporate = false
    gon.b_required_story_corporate = true
    if !((publisher.story_corporate.blank?) or (publisher.story_corporate.empty?) or (publisher.story_corporate.nil?)) 
        # @b_story_corporate = true
        gon.story_corporate = publisher.story_corporate
        gon.b_story_corporate = true
        gon.b_required_story_corporate = false
    end

    
    
    slug_publisher = publisher.slug
    @url_corporate_story_public = '/ppcid' + slug_publisher
    
    
    # result = ActiveRecord::Base.connection.exec_query('SELECT id, title, body FROM posts')
    # @publisher_profile_image_primary = ActiveRecord::Base.connection.exec_query('SELECT * FROM publisher_profile_images WHERE publisher_id = 1 AND order = 1')

    
  end
  
  
  def get_feed_post
    @post_publishers = current_user.publisher.feed
  end


  def get_feed_log
    # @log_users = current_user.feed_log.paginate(:page => params[:page], :per_page => 5)
  end


  def create_post_publisher

    # @post_publishers = nil    
    h_post_publisher = Hash.new
    h_post_publisher[:post_text] = params[:post_publisher][:post_text]

    if @@current_post_publisher.nil?
        h_post_publisher[:user_id] = current_user.id
        post_publisher = current_user.publisher.post_publishers.build(h_post_publisher)
        if post_publisher.save
            #
        else
            #
        end
    else
        if @@current_post_publisher.update_attributes(h_post_publisher)
            #
        else
            #
        end
    end

    @@current_post_publisher = nil
    @post_publishers = current_user.publisher.feed # .paginate(:page => params[:page], :per_page => 5)  
    
  end


  def destroy_post_publisher
    
    post_publisher_id = params[:post_publisher_id]
    post_publisher = current_user.publisher.post_publishers.where("id = ?", post_publisher_id).first rescue nil
    if !post_publisher.nil?
        if post_publisher.destroy
            # @post_publishers = current_user.publisher.feed.paginate(:page => params[:page], :per_page => 100)
            @post_publishers = current_user.publisher.feed
        else
            #
        end
    else
        #
    end
    
    
  end
  
  
  def cancel_post_publisher
      if @@current_post_publisher
          @@current_post_publisher.destroy
      end    
      @@current_post_publisher = nil
  end


  def cancel_post_publisher_on_close
      Rails.logger.info('cancel_post_publisher_on_close called')
      if @@current_post_publisher
          if @@current_post_publisher.destroy
              # Rails.logger.info('@@current_post_publisher.destroy successful')
          else
              # Rails.logger.info('@@current_post_publisher.destroy failed')
          end
      else
          Rails.logger.info('@@current_post_publisher = nil')
      end    
      @@current_post_publisher = nil
  end
  
  
  
  def create_post_publisher_image
    
      post_publisher_images = nil
    
      @id_image = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200

    
      post_publisher = @@current_post_publisher
      Rails.logger.info('post_publisher id = ' + post_publisher.id.to_s)
    
      if !post_publisher.nil?
        
          h_post_publisher_image = Hash.new
          h_post_publisher_image[:user_id] = current_user.id
          h_post_publisher_image[:publisher_id] = current_user.publisher.id
          h_post_publisher_image[:post_publisher_id] = post_publisher.id
          h_post_publisher_image[:image] = params[:post_publisher_image][:image]
          # h_post_publisher_image[:primary] = true
          h_post_publisher_image[:crop_x] = @crop_x
          h_post_publisher_image[:crop_y] = @crop_y
          h_post_publisher_image[:crop_w] = @crop_w
          h_post_publisher_image[:crop_h] = @crop_h
          
          # post_publisher_image = PostPublisherImage.new(h_post_publisher_image)
          post_publisher_image = post_publisher.post_publisher_images.build(h_post_publisher_image)
          
          if request.xhr? || remotipart_submitted?
              if post_publisher_image.save
                  # post_publisher = current_user.post_publishers.where("id = ?", post_publisher.id ).first rescue nil
                  # post_publisher_image = post_publisher.post_publisher_images.where("id = ?", post_publisher_image.id ).first rescue nil     
                  if !post_publisher_image.nil? 
                      img = post_publisher_image
                      image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                      w = image.columns
                      h = image.rows
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
                      if post_publisher_image.update_attributes(h_update)
                        #                      
                      else
                        #  
                      end
                      # post_publisher = post_publisher_image.post_publisher
                      post_publisher_images = post_publisher_image.post_publisher.post_publisher_images
                      # @post_publisher_created_id = post_publisher.id
                  else
                      Rails.logger.info "post_publisher_image = nil"
                  end
              else
                # error save
              end
          else
            # 
          end
      else
          Rails.logger.info "post_publisher = nil"
      end
    
    
      return post_publisher_images
  end


  def upload_post_publisher_image

      @post_publisher_images = nil
      
      if @@current_post_publisher.nil?
        add_post_publisher
      end    

      @post_publisher_images = create_post_publisher_image
  end  

  
  def add_post_publisher

      b_save = false
      
      h_post_publisher = Hash.new
      h_post_publisher[:user_id] = current_user.id
      
      post_publisher = current_user.publisher.post_publishers.build(h_post_publisher)
      if post_publisher.save
          @@current_post_publisher = post_publisher
          b_save = true    
      else
        # @feed_items = []
      end
      
      return b_save
  end


  def cancel_post_publisher
      if @@current_post_publisher
          @@current_post_publisher.destroy
      end    
      @@current_post_publisher = nil
  end
  
  
  def create_post_publisher_comment
    
      @post_publisher_comments = nil
      @post_publisher_id = nil
      
      post_publisher_id = params[:post_publisher_comment][:post_publisher_id]

      if !post_publisher_id.nil?
          post_publisher = PostPublisher.where("id = ?", post_publisher_id).first rescue nil
          if !post_publisher.nil?

              h_post_publisher_comment = Hash.new
              h_post_publisher_comment[:post_publisher_id] = post_publisher_id
              h_post_publisher_comment[:publisher_id] = post_publisher.publisher.id
              h_post_publisher_comment[:user_id] = current_user.id
              h_post_publisher_comment[:comment_text] = params[:post_publisher_comment][:comment_text]

              post_publisher_comment = post_publisher.post_publisher_comments.build(h_post_publisher_comment)
              if post_publisher_comment.save
                  @post_publisher_comments = post_publisher.post_publisher_comments.order('created_at DESC')
                  @post_publisher_id = post_publisher_id                    
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
  
  
  def destroy_post_publisher_comment
    
    @post_publisher_comments = nil
    @post_publisher_id = nil
    
    post_publisher_comment_id = params[:post_publisher_comment_id]
    post_publisher_id = params[:post_publisher_id]
    
    # post_publisher_comment = current_user.publisher.post_publisher_comments.where("id = ?", post_publisher_comment_id).first rescue nil
    
    post_publisher = PostPublisher.where("id = ?", post_publisher_id).first rescue nil
    if !post_publisher.nil?
        post_publisher_comment = post_publisher.post_publisher_comments.where("id = ?", post_publisher_comment_id).first rescue nil
        if !post_publisher_comment.nil?
            if post_publisher_comment.destroy
                @post_publisher_comments = post_publisher.post_publisher_comments.order('created_at DESC')
                @post_publisher_id = post_publisher.id
            else
                #
            end
        else
            #
        end
    else
        #
    end

    
    # if !post_publisher_comment.nil?
        # if post_publisher_comment.destroy
            # post_publisher = PostPublisher.where("id = ?", post_publisher_id).first rescue nil
            # if !post_publisher.nil?
                # @post_publisher_comments = post_publisher.post_publisher_comments
                # @post_publisher_id = post_publisher.id                
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
  
  
  
  def create_post_publisher_like

      @nlist = params[:n_list]
      post_publisher_id = params[:post_publisher_id]
      @post_publisher = nil
      @b_has_like = false
            
      h_post_publisher_like = Hash.new
      h_post_publisher_like[:post_publisher_id] = post_publisher_id
      h_post_publisher_like[:publisher_id] = current_user.publisher.id
      h_post_publisher_like[:user_id] = current_user.id
      post_publisher_like = PostPublisherLike.new(h_post_publisher_like)
      # post_publisher_like = current_publisher.post_publishers.build(post_publisher_like_params)
      if post_publisher_like.save
          post_publisher = PostPublisher.find_by_id(post_publisher_id) rescue nil
          if !post_publisher.nil?
              # Rails.logger.info('post_publisher not nil')
              @post_publisher = post_publisher
              @b_has_like = true
          else
              # Rails.logger.info('post_publisher = nil')
          end          
      else
          #
      end

      
  end
  
  
  def destroy_post_publisher_like
    
      @nlist = params[:n_list]
      post_publisher_id = params[:post_publisher_id]
      @post_publisher = nil
      @b_has_like = true
      
      post_publisher_likes = PostPublisherLike.where('post_publisher_id = ?', post_publisher_id)
      if post_publisher_likes.any?
          post_publisher_like = post_publisher_likes.where('user_id = ?', current_user.id).first rescue nil
          if !post_publisher_like.nil?
              if post_publisher_like.destroy
                  post_publisher = PostPublisher.find(post_publisher_id) rescue nil
                  if !post_publisher.nil?
                      @post_publisher = post_publisher
                      @b_has_like = false
                  else
                      #
                  end          
                  # Rails.logger.info "post_publisher_like destroyed"
              else      
                  # Rails.logger.info "publisher_publisher_logo_image destroy failed"
              end
          else
              # Rails.logger.info "post_publisher_like = nil"
          end
      else
          #
      end

    
  end
  
  
  
  
  def update_story_1
    
    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    name_company = h_obj[:name_company]
    address1 = h_obj[:address1]
    address2 = h_obj[:address2]
    city = h_obj[:city]
    state = h_obj[:state]
    country = h_obj[:country]
    zip = h_obj[:zip]
    phone_company = h_obj[:phone_company]
    website = h_obj[:website]
    email_info = h_obj[:email_info]
    email_admin = h_obj[:email_admin]
    tagline_logo = h_obj[:tagline_logo]    
    
    h_publisher = Hash.new
    h_publisher[:name_company] = name_company
    h_publisher[:address1] = address1 
    h_publisher[:address2] = address2
    h_publisher[:city] = city
    h_publisher[:state] = state
    h_publisher[:country] = country
    h_publisher[:zip] = zip
    h_publisher[:phone_company] = phone_company
    h_publisher[:website] = website
    h_publisher[:email_info] = email_info
    h_publisher[:email_admin] = email_admin 
    h_publisher[:tagline_logo] = tagline_logo
    
    publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    if !publisher.nil?
        if publisher.update_attributes(h_publisher)
            #
        else
            # Rails.logger.info('user update failed')
        end
    else
        # Rails.logger.info('user = nil')      
    end
    
    publisher = nil    
    publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    
    name_company = publisher.name_company
    b_name_company = true
    address1 = publisher.address1
    b_address1 = true
    address2 = publisher.address2
    b_address2 = true
    city = publisher.city
    b_city = true
    state = publisher.state
    b_state = true
    country = publisher.country
    b_country = true
    zip = publisher.zip
    b_zip = true
    phone_company = publisher.phone_company
    b_phone_company = true
    website = publisher.website
    b_website = true
    email_info = publisher.email_info
    b_email_info = true
    email_admin = publisher.email_admin
    b_email_admin = true
    name_admin = publisher.name_admin
    b_name_admin = true
    tagline_logo = publisher.tagline_logo
    b_tagline_logo = true
    
    respond_to do |format|
      format.html {}
      format.json { render :json => {
                                      :b_name_company => b_name_company,
                                      :name_company => name_company, 
                                      :b_address1 => b_address1,
                                      :address1 => address1,
                                      :b_address2 => b_address2,
                                      :address2 => address2,
                                      :b_city => b_city,
                                      :city => city,
                                      :b_state => b_state,
                                      :state => state,
                                      :b_country => b_country,
                                      :country => country,
                                      :b_zip => b_zip,
                                      :zip => zip,
                                      :b_phone_company => b_phone_company,
                                      :phone_company => phone_company,
                                      :b_website => b_website,
                                      :website => website,
                                      :b_email_info => b_email_info,
                                      :email_info => email_info,
                                      :b_email_admin => b_email_admin,
                                      :email_admin => email_admin,
                                      :b_name_admin => b_name_admin,
                                      :name_admin => name_admin,
                                      :b_tagline_logo => b_tagline_logo,
                                      :tagline_logo => tagline_logo
                                    } 
                  }
    end

    
  end



  def update_description

    # ar = params[:publisher_product_description_description]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    publisher_product_description_id = params[:publisher_product_description_id]
    # description = h_obj[:description]
    description = params[:description]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:description] = description

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    @publisher_product_description_description = publisher_product_description_updated.description
    
    # @b_description = false
    @b_required_description = false                    
    if (publisher_product_description_updated.description.blank?) or (publisher_product_description_updated.description.empty?) or (publisher_product_description_updated.description.nil?)
        # @b_description = true
        @b_required_description = true              
    end
    
    
    respond_to do |format|
      format.html {}
      format.js
      # format.json { render :json => { :description => publisher_product_description_updated.description,
                                      # :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  



  def update_publisher_plot

    plot_text = params[:publisher_plot][:plot_text]
    h_publisher_plot = Hash.new
    h_publisher_plot[:plot_text] = plot_text
    # publisher_plot = PublisherPlot.where("publisher_plot_id = ?", current_publisher.publisher.publisher_plot.id).first rescue nil
    publisher_plot = current_user.publisher.publisher_plot rescue nil
    if !publisher_plot.nil?
        if publisher_plot.update_attributes(h_publisher_plot)
            #
        else
            Rails.logger.info('publisher_plot update failed')
        end
    else
        Rails.logger.info('publisher_plot = nil')      
    end

    @publisher = nil
    publisher = current_user.publisher rescue nil
    if !publisher.nil?
        @publisher = publisher
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
    # # story_corporate = h_obj[:story_corporate]
    # story_corporate = params[:story_corporate]
    # # Rails.logger.info("story_corporate = " + story_corporate)
    # h_publisher = Hash.new
    # h_publisher[:story_corporate] = story_corporate
    # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher.nil?
        # if publisher.update_attributes(h_publisher)
            # #
        # else
            # # Rails.logger.info('user update failed')
        # end
    # else
        # # Rails.logger.info('user = nil')      
    # end
    # publisher = nil    
    # @publisher = nil
    # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    # if !publisher.nil?
      # @publisher = publisher
    # else
      # #
    # end
    # # respond_to do |format|
      # # format.html {}
      # # format.js
    # # end
    # # story_corporate = publisher.story_corporate
    # # b_story_corporate = true
    # # respond_to do |format|
      # # format.html {}
      # # format.json { render :json => {
                                      # # :b_story_corporate => b_story_corporate,
                                      # # :story_corporate => story_corporate
                                    # # } 
                  # # }
    # # end
  # end


  
  def destroy_publisher_logo_image

    @post_publishers=nil
    @publisher_logo_image = nil
    publisher_logo_image = PublisherLogoImage.find(params[:id]) rescue nil
    if !publisher_logo_image.nil?
        if publisher_logo_image.destroy
            @post_publishers = current_user.publisher.feed # .paginate(:page => params[:page], :per_page => 5)  
        else      
            #
        end
    else
      #
    end

    
  end

  
  
  def upload_publisher_logo_image_primary

    @id_logo_image = nil
    @crop_x = 0
    @crop_y = 0
    @crop_w = 200
    @crop_h = 200
    
    publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    if !publisher.nil?
        h_publisher_logo_image = Hash.new
        h_publisher_logo_image[:image] = params[:publisher_logo_image][:image]
        h_publisher_logo_image[:user_id] = publisher.user_id
        h_publisher_logo_image[:publisher_id] = publisher.id
        # h_publisher_user_image[:publisher_user_id] = publisher_user.id
        h_publisher_logo_image[:primary] = true
        h_publisher_logo_image[:crop_x] = @crop_x
        h_publisher_logo_image[:crop_y] = @crop_y
        h_publisher_logo_image[:crop_w] = @crop_w
        h_publisher_logo_image[:crop_h] = @crop_h
        publisher_logo_image = PublisherLogoImage.new(h_publisher_logo_image)

        if request.xhr? || remotipart_submitted?
            if publisher_logo_image.save
                publisher_logo_images = publisher.publisher_logo_images     
                publisher_logo_image_primary = publisher_logo_images.where( :primary => true ).first rescue nil
                if !publisher_logo_image_primary.nil? 

                    @id_logo_image = publisher_logo_image_primary.id
                    @publisher_logo_image_primary = publisher_logo_image_primary
                    @post_publishers = current_user.publisher.feed # .paginate(:page => params[:page], :per_page => 5)  

                    img = publisher_logo_image_primary
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
                    if publisher_logo_image_primary.update_attributes(h_update)
                      #                      
                    else
                      #  
                    end
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
  


  def upload_publisher_logo_image_primary_change

    publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    if !publisher.nil?
        publisher_logo_images = publisher.publisher_logo_images     
        publisher_logo_image_primary = publisher_logo_images.where( :primary => true ).first
        if !publisher_logo_image_primary.nil?
            if publisher_logo_image_primary.destroy
            else      
              #
            end
        else
          #
        end
    end

    @id_logo_image = nil
    @crop_x = 0
    @crop_y = 0
    @crop_w = 200
    @crop_h = 200
    
    publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
    if !publisher.nil?
        h_publisher_logo_image = Hash.new
        h_publisher_logo_image[:image] = params[:publisher_logo_image][:image]
        h_publisher_logo_image[:user_id] = publisher.user_id
        h_publisher_logo_image[:publisher_id] = publisher.id
        # h_publisher_user_image[:publisher_user_id] = publisher_user.id
        h_publisher_logo_image[:primary] = true
        h_publisher_logo_image[:crop_x] = @crop_x
        h_publisher_logo_image[:crop_y] = @crop_y
        h_publisher_logo_image[:crop_w] = @crop_w
        h_publisher_logo_image[:crop_h] = @crop_h
        publisher_logo_image = PublisherLogoImage.new(h_publisher_logo_image)

        if request.xhr? || remotipart_submitted?
            if publisher_logo_image.save
                publisher_logo_images = publisher.publisher_logo_images     
                publisher_logo_image_primary = publisher_logo_images.where( :primary => true ).first rescue nil
                if !publisher_logo_image_primary.nil? 

                    @id_logo_image = publisher_logo_image_primary.id
                    @publisher_logo_image_primary = publisher_logo_image_primary
                    @post_publishers = current_user.publisher.feed # .paginate(:page => params[:page], :per_page => 5)  

                    img = publisher_logo_image_primary
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
                    if publisher_logo_image_primary.update_attributes(h_update)
                      #                      
                    else
                      #  
                    end
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


  end  

  

  def crop_commit_logo
    
      Rails.logger.info "in crop_commit_logo"
      
      img = PublisherLogoImage.find(params[:image_id])
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

      @post_publishers = nil    

      @publisher_logo_image_primary = nil
      publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      if !publisher.nil?
          publisher_logo_images = publisher.publisher_logo_images rescue nil
          if !publisher_logo_images.nil?
              publisher_logo_image_primary = publisher_logo_images.where( :primary => true ).first rescue nil
              if !publisher_logo_image_primary.nil?
                  Rails.logger.info "publisher_logo_image_primary not nil"
                  if publisher_logo_image_primary.update_attributes(h_crop)
                      @publisher_logo_image_primary = publisher_logo_image_primary  
                      @post_publishers = current_user.publisher.feed
                  else
                      Rails.logger.info "publisher_logo_image_primary.update_attributes failed"
                  end
              else
                  Rails.logger.info "publisher_logo_image_primary nil"
              end
          else
              Rails.logger.info "publisher_logo_images nil"
          end
      else
          Rails.logger.info "publisher nil"
      end


  end

  def upload_publisher_logo_bkgrnd_image

      @publisher_logo_bkgrnd_image = nil
      @bkgrnd_crop_x = 0
      @bkgrnd_crop_y = 0
      @bkgrnd_crop_w = 1200
      @bkgrnd_crop_h = 300
      
      publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      if !publisher.nil?
          h_publisher_logo_bkgrnd_image = Hash.new
          h_publisher_logo_bkgrnd_image[:image] = params[:publisher_logo_bkgrnd_image][:image]
          h_publisher_logo_bkgrnd_image[:user_id] = publisher.user_id
          h_publisher_logo_bkgrnd_image[:publisher_id] = publisher.id
          h_publisher_logo_bkgrnd_image[:primary] = true
          h_publisher_logo_bkgrnd_image[:crop_x] = @bkgrnd_crop_x
          h_publisher_logo_bkgrnd_image[:crop_y] = @bkgrnd_crop_y
          h_publisher_logo_bkgrnd_image[:crop_w] = @bkgrnd_crop_w
          h_publisher_logo_bkgrnd_image[:crop_h] = @bkgrnd_crop_h
          publisher_logo_bkgrnd_image = PublisherLogoBkgrndImage.new(h_publisher_logo_bkgrnd_image)

          publisher_logo_bkgrnd_images = publisher.publisher_logo_bkgrnd_images
          publisher_logo_bkgrnd_image_old = publisher_logo_bkgrnd_images.where( :primary => true ).first rescue nil
   
          if request.xhr? || remotipart_submitted?
              if publisher_logo_bkgrnd_image.save
                  if !publisher_logo_bkgrnd_image_old.nil?
                      # TODO Check if image destroyed
                      # publisher_logo_bkgrnd_image_old.update_attributes( :primary => false )
                      publisher_logo_bkgrnd_image_old.destroy
                  end
                  
                  publisher_logo_bkgrnd_image = publisher_logo_bkgrnd_images.where( :primary => true ).last rescue nil
                  
                  if !publisher_logo_bkgrnd_image.nil? 
                      @publisher_logo_bkgrnd_image = publisher_logo_bkgrnd_image

                      img = publisher_logo_bkgrnd_image
                      image = MiniMagick::Image.open("public" + img.image_url(:image_800_500))

                      # Background aspect ratio (1200:300 or 4:1)
                      bkgrnd_asp_ratio = 4

                      crop_w = image.width
                      crop_h = image.width / bkgrnd_asp_ratio
                      crop_x = 0
                      crop_y = (image.height - crop_h) / 2

                      @bkgrnd_crop_x = crop_x
                      @bkgrnd_crop_y = crop_y
                      @bkgrnd_crop_w = crop_w
                      @bkgrnd_crop_h = crop_h

                      h_update = Hash.new
                      h_update[:crop_x] = crop_x
                      h_update[:crop_y] = crop_y
                      h_update[:crop_w] = crop_w
                      h_update[:crop_h] = crop_h

                      if publisher_logo_bkgrnd_image.update_attributes(h_update)
                          #                      
                      else
                          #  
                      end                      
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
  end

  def destroy_publisher_logo_bkgrnd_image

      @publisher_logo_bkgrnd_image = nil

      publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil

      if !publisher.nil?
          publisher_logo_bkgrnd_images = publisher.publisher_logo_bkgrnd_images
          if publisher_logo_bkgrnd_images.destroy(params[:publisher_logo_bkgrnd_image][:id])
              publisher_logo_bkgrnd_image_new = publisher_logo_bkgrnd_images.last rescue nil
              if !publisher_logo_bkgrnd_image_new.nil?
                  # TODO Check if attributes updated
                  publisher_logo_bkgrnd_image_new.update_attributes( :primary => true )
              end

              publisher_logo_bkgrnd_image = publisher_logo_bkgrnd_images.where( :primary => true ).last rescue nil
              if !publisher_logo_bkgrnd_image.nil? 
                  @publisher_logo_bkgrnd_image = publisher_logo_bkgrnd_image
              end
          else
            # Error
          end
      end

  end

  def crop_publisher_logo_bkgrnd_image
      @publisher_logo_bkgrnd_image = nil

      publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil

      if !publisher.nil?
          
          publisher_logo_bkgrnd_images = publisher.publisher_logo_bkgrnd_images
          img = publisher_logo_bkgrnd_images.find(params[:image_id]) rescue nil
          
          if !img.nil?
              image = MiniMagick::Image.open("public" + img.image_url)
              image_800_500 = MiniMagick::Image.open("public" + img.image_url(:image_800_500))

              if(image.width >= image.height)
                  crop_scale = image.width / image_800_500.width.to_f
              else
                  crop_scale = image.height / image_800_500.height.to_f
              end
              
              crop_x = (params[:crop_x].to_i * crop_scale).to_i
              crop_y = (params[:crop_y].to_i * crop_scale).to_i
              crop_w = (params[:crop_w].to_i * crop_scale).to_i
              crop_h = (params[:crop_h].to_i * crop_scale).to_i

              crop_params = "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
              new_image = image.crop(crop_params)

              img_name = File.basename(img.image.to_s)
              img_dir = "public" + File.dirname(img.image.to_s)

              image_1200_300_path = img_dir + "/" + "image_1200_300_fill_" + img_name

              FileUtils.rm_rf(image_1200_300_path)

              new_image.resize('1200x300')
              new_image.write image_1200_300_path

              publisher_logo_bkgrnd_image = publisher_logo_bkgrnd_images.where( :primary => true ).last rescue nil
              if !publisher_logo_bkgrnd_image.nil? 
                  @publisher_logo_bkgrnd_image = publisher_logo_bkgrnd_image

                  h_update = Hash.new
                  h_update[:crop_x] = params[:crop_x]
                  h_update[:crop_y] = params[:crop_y]
                  h_update[:crop_w] = params[:crop_w]
                  h_update[:crop_h] = params[:crop_h]
                  
                  if publisher_logo_bkgrnd_image.update_attributes(h_update)
                      #                      
                  else
                      #  
                  end
              end

          else
            #Error
          end
          
      end
      

  end


  # def crop_commit_logo
#     
      # # render text: params[:image_id]
#   
      # x = params[:crop_x]
      # y = params[:crop_y]
      # w = params[:crop_w]
      # h = params[:crop_h]
#   
      # img = PublisherLogoImage.find(params[:image_id])
      # image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
#   
      # # require 'rmagick'
      # # img = Magick::Image.read( 'demo.png' ).first
      # # width = img.columns
      # # height = img.rows
#   
      # # render text: image.filename
#   
      # # version :user_0_200 do
        # # # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
        # # process :resize_to_limit => [0, 200]
      # # end
# 
#   
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
      # new_user_200_200_fit = image_new.resize_to_fit(200, 200)    
# 
      # user_200_200 = Magick::Image.read("public" + img.image_url(:user_200_200))[0]    
      # user_100_100 = Magick::Image.read("public" + img.image_url(:user_100_100))[0]
      # user_50_50 = Magick::Image.read("public" + img.image_url(:user_50_50))[0]
      # user_34_34 = Magick::Image.read("public" + img.image_url(:user_34_34))[0]
      # user_200_200_fit = Magick::Image.read("public" + img.image_url(:user_200_200_fit))[0]    
#   
      # # public/uploads/publisher_user_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
#   
      # user_200_200_filename = user_200_200.filename
      # user_100_100_filename = user_100_100.filename
      # user_50_50_filename = user_50_50.filename
      # user_34_34_filename = user_34_34.filename
      # user_200_200_fit_filename = user_200_200_fit.filename
#   
      # FileUtils.rm_rf(Dir.glob(user_200_200.filename))
      # FileUtils.rm_rf(Dir.glob(user_100_100.filename))
      # FileUtils.rm_rf(Dir.glob(user_50_50.filename))
      # FileUtils.rm_rf(Dir.glob(user_34_34.filename))
      # FileUtils.rm_rf(Dir.glob(user_200_200_fit.filename))
#       
      # new_user_200_200.write user_200_200_filename
      # new_user_100_100.write user_100_100_filename
      # new_user_50_50.write user_50_50_filename
      # new_user_34_34.write user_34_34_filename
      # new_user_200_200_fit.write user_200_200_fit_filename
#   
      # # # image.recreate_versions!
      # # image_100_100 = nil    
      # # image_50_50 = nil
      # # image_34_34 = nil
      # # profile_100_100 = nil
      # # profile_50_50 = nil
      # # profile_34_34 = nil
#   
      # h_crop = Hash.new
      # h_crop[:crop_x] = x
      # h_crop[:crop_y] = y
      # h_crop[:crop_w] = w
      # h_crop[:crop_h] = h
#   
      # @publisher_logo_image_primary = nil
      # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      # if !publisher.nil?
          # publisher_logo_images = publisher.publisher_logo_images rescue nil
          # if !publisher_logo_images.nil?
              # publisher_logo_image_primary = publisher_logo_images.where( :primary => true ).first rescue nil
              # if !publisher_logo_image_primary.nil?
                  # if publisher_logo_image_primary.update_attributes(h_crop)
                      # @publisher_logo_image_primary = publisher_logo_image_primary  
                  # else
                    # #
                  # end
              # else
                # #
              # end
          # else
            # #
          # end
      # else
        # #
      # end
#     
#     
  # end
  
  
  # def crop_commit_logo
    
      # x = params[:crop_x]
      # y = params[:crop_y]
      # w = params[:crop_w]
      # h = params[:crop_h]
#   
      # img = PublisherLogoImage.find(params[:image_id])
      # image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
#   
      # # require 'rmagick'
      # # img = Magick::Image.read( 'demo.png' ).first
      # # width = img.columns
      # # height = img.rows
#   
      # # render text: image.filename
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
      # # # image.recreate_versions!
      # # image_100_100 = nil    
      # # image_50_50 = nil
      # # image_34_34 = nil
      # # profile_100_100 = nil
      # # profile_50_50 = nil
      # # profile_34_34 = nil
#   
      # # redirect_to '/Publisher-Admin'    
#   
      # h_crop = Hash.new
      # h_crop[:crop_x] = x
      # h_crop[:crop_y] = y
      # h_crop[:crop_w] = w
      # h_crop[:crop_h] = h
# 
      # @post_users = nil    
      # @publisher_logo_image_primary = nil
      # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
      # # if !publisher_user.nil?
          # # publisher_user_images = publisher_user.publisher_user_images rescue nil
          # # if !publisher_user_images.nil?
              # publisher_logo_image_primary = current_user.publisher.publisher_logo_images.where( :primary => true ).first rescue nil
              # if !publisher_logo_image_primary.nil?
                  # if publisher_logo_image_primary.update_attributes(h_crop)
                      # @publisher_logo_image_primary = publisher_logo_image_primary  
                      # @post_publishers = current_user.publisher.feed # .paginate(:page => params[:page], :per_page => 5)
                  # else
                    # #
                  # end
              # else
                # #
              # end
          # # else
            # # #
          # # end
      # # else
        # # #
      # # end
# 
      # # @publisher_user_image_primary = nil
      # # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
      # # if !publisher_user.nil?
          # # publisher_user_images = publisher_user.publisher_user_images rescue nil
          # # if !publisher_user_images.nil?
              # # publisher_user_image_primary = publisher_user_images.where( :primary => true ).first rescue nil
              # # if !publisher_user_image_primary.nil?
                  # # if publisher_user_image_primary.update_attributes(h_crop)
                      # # @publisher_user_image_primary = publisher_user_image_primary  
                  # # else
                    # # #
                  # # end
              # # else
                # # #
              # # end
          # # else
            # # #
          # # end
      # # else
        # # #
      # # end
    
    
  # end

  
  def dbdelete
      # PublisherProfileImage.dbdelete
      # PublisherProfileImage.dbclear
      # redirect_to '/Publisher'      
      # # respond_to do |format|
        # # # format.html
        # # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # # format.js { redirect_to('/Publishers') }
      # # end
  end
  
  
  
  private

    # def publisher_params
      # params.require(:publisher).permit(
                                        # :user_id,
                                        # :name, 
                                        # :address, 
                                        # :city, 
                                        # :state, 
                                        # :country, 
                                        # :zip,
                                        # :phone, 
                                        # :url, 
                                        # :description, 
                                        # :company_contact_name_first, 
                                        # :company_contact_name_last,
                                        # :company_contact_phone, 
                                        # :company_contact_email 
                                       # )
    # end
  
  
  
end


# Your Ubuntu release is not supported anymore.
# For upgrade information, please visit:
# http://www.ubuntu.com/releaseendoflife
# 
# New release '14.04.2 LTS' available.
# Run 'do-release-upgrade' to upgrade to it.
