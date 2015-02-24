class UsersController < ApplicationController


  layout 'newland'

  respond_to :html, :js, :json  

  # require 'RMagick'
  # before_action :already_signed_in, only: [:new]
  # before_action :signed_in_user
  # before_action :signed_in_user,
                # only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy
  # skip_before_filter :verify_authenticity_token
  # before_filter :force_http
  # def test_rmagick
    # image = Magick::Image.new(110, 30){ self.background_color = 'white' }
    # image.write('/tmp/test.jpg')
  # end

  before_action :fill_left_directory, only: [:index, 
                                             :render_index_publisher, 
                                             :render_index_publisher_home,
                                             :render_index_publisher_user,
                                             :render_index_publisher_user_home]
  
  
  def fill_left_directory

    @url_user_story = '#'
    @url_profile_story = '#'
    @url_profile_story_home = '#' 

    if signed_in?
        # signed in
        @url_user_story = current_user.slug
        
        case current_user.profile_type.to_s
          when "1"
              # student user
          when "2"
              # teacher user
          when "3"
              # publisher user
              publisher = current_user.publisher
              @url_profile_story = publisher.slug
              @url_profile_story_home = "Publisher"
          when "4"
              # institute user
          when "5"
              # recruiter user
          else
              #
        end
    else
        # not signed
    end
  end



  def index

    # id_passed = params[:id]
    # # redirect_to index_post_publisher_users_path(:id_publisher_user => id_passed)
    # redirect_to index_post_publisher_users_path

    Rails.logger.info('in users index')
    
    id_passed = params[:id]

    b_signed_in = signed_in?

    if id_passed.nil?
        if b_signed_in
            # home_url = get_user_url(id_passed)
            # redirect_to home_url
            render_index_publisher_user_home
        else
            redirect_to '/Signin'
        end        
    else
      
        Rails.logger.info('id_passed not nil')
        # b_id_exists = IssuedGenId.exists?(:gen_id => id_passed)
        issued_gen_id = IssuedGenId.where(:gen_id => id_passed).first rescue nil
        # issued_gen_id = IssuedGenId.find(:gen_id => 818282524022) rescue nil
        # if b_id_exists
        if !issued_gen_id.nil?
            # user_passed = User.friendly.find(id_passed) rescue nil
            profile_type = issued_gen_id.profile_type
            if !profile_type.nil?
                case profile_type.to_s
                  when "1"
                      # student user
                  when "2"
                      # teacher user
                  when "3"
                      # publisher user
                      user_passed = issued_gen_id.user
                      if !user_passed.nil?
                          if b_signed_in
                              if ( user_passed.id == current_user.id )
                                  Rails.logger.info('called render_index_publisher_user')
                                  render_index_publisher_user
                              else
                                  Rails.logger.info('called render_index_public_publisher_user')
                                  render_index_public_publisher_user(user_passed)
                              end                
                          else
                              Rails.logger.info('called render_index_public_publisher_user_signedout')
                              render_index_public_publisher_user_signedout(user_passed)
                              # render 'index_public_publisher_user'
                              # user_url = get_user_url_public(user_passed, id_passed)                      
                          end
                      else
                          Rails.logger.info('user_passed was nil')
                          # id passed exists, but user not found -> error
                      end
                  when "4"
                      # institute/school user
                  when "5"
                      #recruiter user
                  when "11"
                    # student
                  when "22"
                    # teacher
                  when "33"
                    # publisher
                      publisher_passed = issued_gen_id.publisher
                      if !publisher_passed.nil?
                          if b_signed_in
                              # current_user_profile_type = current_user.profile_type  
                              if current_user.profile_type == 3
                                  # same profile type. is this the user's own publisher?
                                  if publisher_passed == current_user.publisher
                                      # is this the publisher admin?
                                      render_index_publisher
                                  else
                                      # -> public_publisher
                                      render_index_public_publisher(publisher_passed)
                                  end
                              else
                                  # user is a different profile type
                                render_index_public_publisher(publisher_passed)
                              end
                          else
                            # -> public_publishers, no signin
                            # render_index_public_publisher_no_signin(publisher)
                            render_index_public_publisher(publisher_passed)
                          end
                      else
                          Rails.logger.info('publisher_passed was nil')
                          # id passed exists, but publisher not found -> error
                      end
                  when "44"
                    # institute/school
                  when "55"
                    #recruiter
                  else
                    #        
                end

            end
        else
            Rails.logger.info('issued_gen_id was nil')
            if b_signed_in
                # Rails.logger.info('b_signed_in was true')
                # signed in user manually entered an invalid url. he should know better. display error page 404
                raise ActionController::RoutingError.new('Not Found')  
            else
                # invalid url and no signed-in user. display Signin/Signup
                Rails.logger.info('user not signed-in')
                redirect_to '/Signin'
            end
            
        end
        
    end



    
  end



  def render_index_publisher_home
    
      if signed_in?
          # @url_corporate_story_public = ""
          
          @publisher = nil
          @publisher_profile_image_primary = nil
          @post_publishers = nil
                    
          publisher = current_user.publisher rescue nil
          # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
          if !publisher.nil?
              @publisher = publisher
              publisher_id = publisher.id
              # publisher_logo_image_primary = PublisherLogoImage.where("publisher_id = ?", publisher_id).where( :primary => true ).first rescue nil
              publisher_logo_image_primary = publisher.publisher_logo_images.first rescue nil
              if !publisher_logo_image_primary.nil?
                  @publisher_logo_image_primary = publisher_logo_image_primary  
              else
                #
              end
              
              @post_publishers = publisher.feed
              
              # @url_corporate_story_public = '/ppcid' + publisher.slug
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

          render 'publishers/index_home', :layout => 'publisher'
      else
          redirect_to '/'      
      end

      
      # slug_publisher = publisher.slug
      # @url_corporate_story_public = '/ppcid' + slug_publisher
      
      
      # result = ActiveRecord::Base.connection.exec_query('SELECT id, title, body FROM posts')
      # @publisher_profile_image_primary = ActiveRecord::Base.connection.exec_query('SELECT * FROM publisher_profile_images WHERE publisher_id = 1 AND order = 1')
    
    
  end



  def render_index_publisher
    
      @url_corporate_story_public = ""
      
      @publisher = nil
      @publisher_profile_image_primary = nil
      @log_publishers = nil
      
      publisher = current_user.publisher rescue nil
      # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      if !publisher.nil?
          @publisher = publisher
          publisher_id = publisher.id
          # publisher_logo_image_primary = PublisherLogoImage.where("publisher_id = ?", publisher_id).where( :primary => true ).first rescue nil
          publisher_logo_image_primary = publisher.publisher_logo_images.first rescue nil
          if !publisher_logo_image_primary.nil?
              @publisher_logo_image_primary = publisher_logo_image_primary  
          else
            #
          end
          
          @publisher = publisher
          # @log_publishers = publisher.feed_log
          @post_publishers = publisher.feed_log


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

          render 'publishers/index', :layout => 'publisher'
  
      else
          redirect_to '/'
      end    

    
  end



  def render_index_public_publisher(publisher)
    

      # fill left nav
      # @url_my_story        = '#'
      # @url_corporate_story = '#'
      # if signed_in?
        # @url_my_story = current_user.slug
      # end 
  

      
      @signed_in_user_options = signed_in?
      @b_signed_in = signed_in?
  
      # id_passed = params[:id]
      # @friendly_id = id_passed
      # publisher = Publisher.friendly.find(id_passed) rescue nil
      
      if !publisher.nil?
        @publisher_id = publisher.id
        @publisher_name = publisher.name
        # @publisher_profile_images = publisher.publisher_profile_images     
        # @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ?", @publisher_id).where( :primary => true ).first
        @publisher_profile_image_primary = publisher.publisher_profile_images.first rescue nil
      else
        # catch error, here, which should not be necessary, as the passed id has already been verified.
      end
    
      render 'publishers/index_public', :layout => 'publisher'
  end


  def render_index_publisher_user_home
    
        @user = current_user
        @publisher_user = nil
        @publisher_user_image_primary = nil
        @user_image_primary = nil
        @post_users = nil
        @post_user = nil
        
        # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
        publisher_user = current_user.publisher_user
        if !publisher_user.nil?
            @publisher_user = publisher_user
            @publisher_id = publisher_user.publisher_id
            @publisher_user_id = publisher_user.id
            # publisher = Publisher.find_by_id(@publisher_id)
            publisher = current_user.publisher
            if !publisher.nil?
                @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first
                @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
            else
              #
            end
            

            # @post_user = current_user.post_users.build
            # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
            @post_users = current_user.feed
        
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
            
            # gon.email = ""
            # gon.b_email = false
            # gon.b_required_email = true
            # if !((publisher_user.email.blank?) or (publisher_user.email.empty?) or (publisher_user.email.nil?)) 
                # gon.email = publisher_user.email
                # gon.b_email = true
                # gon.b_required_email = false
            # end
            # gon.location = ""
            # gon.b_location = false
            # gon.b_required_location = true
            # if !((publisher_user.location.blank?) or (publisher_user.location.empty?) or (publisher_user.location.nil?)) 
                # gon.location = publisher_user.location
                # gon.b_location = true
                # gon.b_required_location = false
            # end
            # gon.name_alias = ""
            # gon.b_name_alias = false
            # gon.b_required_name_alias = true
            # if !((publisher_user.name_alias.blank?) or (publisher_user.name_alias.empty?) or (publisher_user.name_alias.nil?)) 
                # gon.name_alias = publisher_user.name_alias
                # gon.b_name_alias = true
                # gon.b_required_name_alias = false
            # end
            # gon.job_title = ""
            # gon.b_job_title = false
            # gon.b_required_job_title = true
            # if !((publisher_user.job_title.blank?) or (publisher_user.job_title.empty?) or (publisher_user.job_title.nil?)) 
                # gon.job_title = publisher_user.job_title
                # gon.b_job_title = true
                # gon.b_required_job_title = false
            # end
            # gon.name_company = ""
            # gon.b_name_company = false
            # gon.b_required_name_company = true
            # if !((publisher_user.name_company.blank?) or (publisher_user.name_company.empty?) or (publisher_user.name_company.nil?)) 
                # gon.name_company = publisher_user.name_company
                # gon.b_name_company = true
                # gon.b_required_name_company = false
            # end
            # gon.time_at_company = ""
            # gon.b_time_at_company = false
            # gon.b_required_time_at_company = true
            # if !((publisher_user.time_at_company.blank?) or (publisher_user.time_at_company.empty?) or (publisher_user.time_at_company.nil?)) 
                # gon.time_at_company = publisher_user.time_at_company
                # gon.b_time_at_company = true
                # gon.b_required_time_at_company = false
            # end
            # gon.website = ""
            # gon.b_website = false
            # gon.b_required_website = true
            # if !((publisher_user.website.blank?) or (publisher_user.website.empty?) or (publisher_user.website.nil?)) 
                # gon.website = publisher_user.website
                # gon.b_website = true
                # gon.b_required_website = false
            # end
            # gon.phone_company = ""
            # gon.b_phone_company = false
            # gon.b_required_phone_company = true
            # if !((publisher_user.phone_company.blank?) or (publisher_user.phone_company.empty?) or (publisher_user.phone_company.nil?)) 
                # gon.phone_company = publisher_user.phone_company
                # gon.b_phone_company = true
                # gon.b_required_phone_company = false
            # end
            
            # slug_user = current_user.slug
            # @url_my_story_public = '/ppuid' + slug_user



            
        else
          # exit if publisher_user nil 
        end
        
        
        render 'publisher_users/index_home', :layout => 'publisher'
    
  end

  def render_index_publisher_user
    
        @user = current_user
        @publisher_user = nil
        @publisher_user_image_primary = nil
        @user_image_primary = nil
        @post_users = nil
        @post_user = nil
        
        # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first rescue nil
        publisher_user = current_user.publisher_user        
        if !publisher_user.nil?
            Rails.logger.info('publisher_user not nil')
            @publisher_user = publisher_user
            @publisher_id = publisher_user.publisher_id
            @publisher_user_id = publisher_user.id
            # publisher = Publisher.find_by_id(@publisher_id)
            publisher = current_user.publisher
            if !publisher.nil?
                Rails.logger.info('publisher not nil')
                @publisher_user_image_primary = current_user.user_images.where( :primary => true ).first
                @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", @publisher_user_id).first
            else
                Rails.logger.info('publisher was nil')
            end
            

            # @post_user = current_user.post_users.build
            # @post_users = current_user.feed.paginate(:page => params[:page], :per_page => 5)
        
            # @log_users = current_user.post_users.paginate(:page => params[:page], :per_page => 5)
            # @log_users = current_user.feed_log
            @post_users = current_user.feed_log
            
            gon.id_image = nil
            @crop_x = 0
            @crop_y = 0
            @crop_w = 200
            @crop_h = 200
            if !@publisher_user_image_primary.nil? 
              gon.id_image = @publisher_user_image_primary.id
              @crop_x = @publisher_user_image_primary.crop_x
              @crop_y = @publisher_user_image_primary.crop_y
              @crop_w = @publisher_user_image_primary.crop_w
              @crop_h = @publisher_user_image_primary.crop_h
            end
        
            gon.id_image_logo = nil
            @crop_x_logo = 0
            @crop_y_logo = 0
            @crop_w_logo = 200
            @crop_h_logo = 200
            if !@publisher_user_logo_image.nil? 
              gon.id_image_logo = @publisher_user_logo_image.id
              @crop_x_logo = @publisher_user_logo_image.crop_x
              @crop_y_logo = @publisher_user_logo_image.crop_y
              @crop_w_logo = @publisher_user_logo_image.crop_w
              @crop_h_logo = @publisher_user_logo_image.crop_h
            end
            
            
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



            
        else
          Rails.logger.info('publisher_user was nil') 
        end
        
        
        render 'publisher_users/index', :layout => 'publisher'
    
  end


  def render_index_public_publisher_user(user)
    
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
      # publisher_user = PublisherUser.friendly.find(id_passed) rescue nil
      publisher_user = user.publisher_user
      if !publisher_user.nil?
          # publisher_user_id = publisher_user.id
          # @publisher_user_id = publisher_user_id
          @user = user
          @publisher_user_image_primary = user.user_images.where( :primary => true ).first
          @name_first = user.name_first
          @name_last = user.name_last
  
          # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", publisher_user_id).first
          @publisher_user_logo_image = publisher_user.publisher_user_logo_images.first
          @email = publisher_user.email
          @location = publisher_user.location
          @name_alias = publisher_user.name_alias
          @job_title = publisher_user.job_title
          @name_company = publisher_user.name_company
          @time_at_company = publisher_user.time_at_company
          @website = publisher_user.website
          @phone_company = publisher_user.phone_company
          
          render 'publisher_users/index_public', :layout => 'publisher'
      else
          # Catch error, here, which shouldn't be necessary, as the passed id was already verified.
          Rails.logger.info('render_index_public_publisher_user publisher_user = nil')
          redirect_to '/Signin'
      end
    
    
  end



  def render_index_public_publisher_user_signedout(user)
    
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
      # publisher_user = PublisherUser.friendly.find(id_passed) rescue nil
      publisher_user = user.publisher_user
      if !publisher_user.nil?
          # publisher_user_id = publisher_user.id
          # @publisher_user_id = publisher_user_id
          @user = user
          @publisher_user_image_primary = user.user_images.where( :primary => true ).first
          @name_first = user.name_first
          @name_last = user.name_last
  
          # @publisher_user_logo_image = PublisherUserLogoImage.where("publisher_user_id = ?", publisher_user_id).first
          @publisher_user_logo_image = publisher_user.publisher_user_logo_images.first
          @email = publisher_user.email
          @location = publisher_user.location
          @name_alias = publisher_user.name_alias
          @job_title = publisher_user.job_title
          @name_company = publisher_user.name_company
          @time_at_company = publisher_user.time_at_company
          @website = publisher_user.website
          @phone_company = publisher_user.phone_company
          
          render 'publisher_users/index_public_signedout', :layout => 'publisher'
      else
          # Catch error, here, which shouldn't be necessary, as the passed id was already verified.
          Rails.logger.info('render_index_public_publisher_user_signedout publisher_user = nil')
          redirect_to '/Signin'
      end
    
    
  end














  def get_user_url(id)
      
      profile_type = current_user.profile_type.to_s
      case profile_type
        when "1"
          # student
        when "2"
          # teacher
        when "3"
          # publisher
          # redirect_to :controller => 'publisher_users', :action => 'index', :id_publisher_user => id_passed
          user_url = { :id_publisher_user => id }
        when "4"
          # institute/school
        when "5"
          #recruiter
        else
          #        
      end
      
      return user_url
  end

  def get_user_url_public(user, id)
      
      profile_type = user.profile_type.to_s
      case profile_type
        when "1"
          # student
        when "2"
          # teacher
        when "3"
          # publisher
          # redirect_to :controller => 'publisher_users', :action => 'index', :id_publisher_user => id_passed
          user_url = { :id_public_publisher_user => id }
        when "4"
          # institute/school
        when "5"
          #recruiter
        else
          #        
      end
      
      return user_url
  end



  def show
  end


  def new
    
    if signed_in?
      redirect_to '/'
    else
      @bd_years = BdYear.order("year_value ASC").all
    end
    
  end

  
  def create

      # id_gen
      # id_per
      # id_per_b
      # slug
      # slug_pre_id
      # name_first
      # name_last
      # email 
      # username 
      # profile_type 
      # has_profile 
      # password 
      # password_confirmation 
      # bd_month
      # bd_month_text
      # bd_day
      # bd_year
      # gender
      # gender_text
      # profile_type
      # profile_type_text
      # avatar_image
  
      params_user = params[:user]
      
      profile_type = params_user[:profile_type]
  
      profile_type = 3 # force this...for now
  
      case profile_type.to_s
      when "1"
        user = create_user_student(params_user)
      when "2"
        user = create_user_teacher(params_user)
      when "3"
        user = create_user_publisher(params_user)
      when "4"
        user = create_user_institute(params_user)
      when "5"
        user = create_user_recruiter(params_user)
      else
        # 
      end

      if !user.nil?
          sign_in user
          redirect_to '/'
      else
          render_error('log_errors', 
                       'create', 
                       '3', 
                       'publisher',
                       'Create User failed')
      end  

  end
    
    
  def render_error(controller, action, profile_index, profile_description, description)
    
      error_url = '/Error'
      
      h_log_error = Hash.new
      h_log_error[:controller] = controller
      h_log_error[:action] = action
      h_log_error[:profile_index] = profile_index
      h_log_error[:profile_description] = profile_description
      h_log_error[:description] = description

      log_error = LogError.new(h_log_error)
      if log_error.save
          error_url = '/Error/' + log_error.id.to_s
      else
          #
      end
    
      redirect_to error_url 
  end    
    
    

  def get_random

      # r = 0
      # case profile_type.to_s
      # when "1"
          # # student
          # r = rand(100000000001..999999999999) # 999,999,999,999  12
      # when "2"
          # # teacher
          # r = rand(10000000001..99999999999) # 99,999,999,999   11
      # when "3"
          # # publisher
          # r = rand(1000000001..9999999999) # 9,999,999,999  10
      # when "4"
          # # school
          # r = rand(100000001..999999999) #999,999,999  9
      # when "5"
          # # recruiter
          # r = rand(10000001..99999999) #99,999,999  8
      # else
        # # 
      # end

      r = rand(100000000001..999999999999) # 999,999,999,999  12
      
      b_r = true
      while b_r do
        b_r = IssuedGenId.exists?(:gen_id => r)
        if b_r
          r += 1  
        end      
      end
      
      return r
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
      
      case bd_month
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
  
  
  def create_user_publisher(params_user)
  
      Rails.logger.info('in create_user_publisher')
  
      publisher_user = nil


      h_user = Hash.new
      h_user[:name_first] = params_user[:name_first]
      h_user[:name_last] = params_user[:name_last]
      h_user[:email] = params_user[:email]
      h_user[:username] = params_user[:username]
      h_user[:profile_type] = params_user[:profile_type]
      h_user[:profile_type_text] = 'publisher' 
      # h_user[:has_profile] = params_user[:name_first]
      h_user[:password] = params_user[:password]
      h_user[:password_confirmation] = params_user[:password_confirmation]
      h_user[:bd_month] = params_user[:bd_month]
      h_user[:bd_month_text] = get_bd_month_text(params_user[:bd_month])
      h_user[:bd_day] = params_user[:bd_day]
      h_user[:bd_year] = params_user[:bd_year]
      h_user[:gender] = params_user[:gender]
      h_user[:gender_text] = get_gender_text(params_user[:gender])
      user = User.new(h_user)
      if user.save
          user_gen_id = get_random
          h_issued_gen_id = Hash.new
          h_issued_gen_id[:gen_id] = user_gen_id
          h_issued_gen_id[:profile_type] = 3 
          h_issued_gen_id[:user_id] = user.id            
          issued_gen_id = IssuedGenId.new(h_issued_gen_id)
          if issued_gen_id.save
              if user.update_attributes(:slug => issued_gen_id.gen_id.to_s)
                  h_publisher_user = Hash.new
                  h_publisher_user[:user_id] = user.id
                  publisher_user = PublisherUser.new(h_publisher_user)
                  if publisher_user.save
                      h_publisher = Hash.new
                      h_publisher[:user_id] = user.id
                      publisher = Publisher.new(h_publisher)
                      if publisher.save
                          publisher_gen_id = get_random
                          h_issued_gen_id_publisher = Hash.new
                          h_issued_gen_id_publisher[:gen_id] = publisher_gen_id
                          h_issued_gen_id_publisher[:profile_type] = 33
                          h_issued_gen_id_publisher[:publisher_id] = publisher.id  
                          issued_gen_id_publisher = IssuedGenId.new(h_issued_gen_id_publisher)
                          if issued_gen_id_publisher.save
                              if publisher.update_attributes(:slug => issued_gen_id_publisher.gen_id.to_s)
                                  #
                              else
                                  Rails.logger.info('publisher update failed')
                              end
                          else
                              Rails.logger.info('issued_gen_id_publisher not saved')
                          end            
                      else
                          Rails.logger.info('publisher not saved')
                      end
                  else
                      Rails.logger.info('publisher_user not saved')
                  end
              else
                  Rails.logger.info('user update failed')                
              end
          else
              Rails.logger.info('issued_gen_id not saved')
          end
      else
          Rails.logger.info('user not saved')
      end
      
      return user
  end






    
    
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
    
    
    
  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end




  # def new_pwd_reset
    # ar = params[:user]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
    # email = h_obj[:email]
    # user = User.find_by_email(params[:email])
    # user.send_password_reset if user
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :email => email } }
    # end
  # end
  # def edit_pwd_reset
    # # ar = params[:publisher_product_description]
    # # h_obj = Hash.new
    # # ar.each do |obj|
      # # h_obj = obj
    # # end
    # # publisher_product_description_id = h_obj[:publisher_product_description_id]
  # end
    
  # def dbdelete
      # User.dbdelete
      # User.dbclear
      # redirect_to :action => 'index'      
  # end

    
  def reset_users

      # LogError.dbdelete
      # LogError.dbclear
# 
      # LogUser.dbdelete
      # LogUser.dbclear
      # RelateLogUser.dbdelete
      # RelateLogUser.dbclear
# 
      # LogPublisher.dbdelete
      # LogPublisher.dbclear
      # RelateLogPublisher.dbdelete
      # RelateLogPublisher.dbclear
# 
      # PostPublisher.dbdelete
      # PostPublisher.dbclear
      # RelatePublisherFollow.dbdelete
      # RelatePublisherFollow.dbclear
# 
# 
# 
      # PostUser.dbdelete
      # PostUser.dbclear
      # RelateFollow.dbdelete
      # RelateFollow.dbclear
      # PostUserLike.dbdelete
      # PostUserLike.dbclear
      
      PostUserImage.dbdelete
      PostUserImage.dbclear
      
      # PostUserComment.dbdelete
      # PostUserComment.dbclear
# 
      # FriendlyIdSlug.dbdelete
      # FriendlyIdSlug.dbclear
#       
      # User.dbdelete
      # User.dbclear
# 
      # UserImage.dbdelete
      # UserImage.dbclear
# 
      # # UserProfileImage.dbdelete
      # # UserProfileImage.dbclear
# 
      # IssuedGenId.dbdelete
      # IssuedGenId.dbclear
# 
      # IssuedPerId.dbdelete
      # IssuedPerId.dbclear
# 
      # Publisher.dbdelete
      # Publisher.dbclear
# 
      # PublisherUser.dbdelete
      # PublisherUser.dbclear
# 
      # PublisherMember.dbdelete
      # PublisherMember.dbclear
# 
      # PublisherUserImage.dbdelete
      # PublisherUserImage.dbclear
# 
      # PublisherUserLogoImage.dbdelete
      # PublisherUserLogoImage.dbclear
# 
      # PublisherLogoImage.dbdelete
      # PublisherLogoImage.dbclear
# 
      # # PublisherProfileImage.dbdelete
      # # PublisherProfileImage.dbclear
# 
      # PublisherProduct.dbdelete
      # PublisherProduct.dbclear
# 
      # PublisherProductDescription.dbdelete
      # PublisherProductDescription.dbclear
# 
      # PublisherProductImage.dbdelete
      # PublisherProductImage.dbclear
# 
      # PublisherProduct1Image.dbdelete
      # PublisherProduct1Image.dbclear
# 
      # PublisherProduct2Image.dbdelete
      # PublisherProduct2Image.dbclear
# 
      # # PublisherProductLogo.dbdelete
      # # PublisherProductLogo.dbclear
# 
      # PublisherProductLogo1Image.dbdelete
      # PublisherProductLogo1Image.dbclear
# 
      # PublisherProductCorporateLogo.dbdelete
      # PublisherProductCorporateLogo.dbclear
# 
      # PublisherProductPdf.dbdelete
      # PublisherProductPdf.dbclear
# 
      # PublisherProductPdfImage.dbdelete
      # PublisherProductPdfImage.dbclear
# 
      # PublisherProductContentType.dbdelete
      # PublisherProductContentType.dbclear
# 
      # PublisherProductCategorySubject.dbdelete
      # PublisherProductCategorySubject.dbclear
# 
      # PublisherProductAppropriateAge.dbdelete
      # PublisherProductAppropriateAge.dbclear
# 
      # PublisherProductAppropriateGrade.dbdelete
      # PublisherProductAppropriateGrade.dbclear
# 
      # PublisherProductMarketTarget.dbdelete
      # PublisherProductMarketTarget.dbclear
# 
      # PublisherProductPlatform.dbdelete
      # PublisherProductPlatform.dbclear
# 
      # PublisherProductFileType.dbdelete
      # PublisherProductFileType.dbclear
# 
      # PublisherProductCharacter.dbdelete
      # PublisherProductCharacter.dbclear
# 
      # PublisherProductEnhancement.dbdelete
      # PublisherProductEnhancement.dbclear
# 
      # PublisherProductByReview.dbdelete
      # PublisherProductByReview.dbclear
# 
      # PublisherProductPricingModel.dbdelete
      # PublisherProductPricingModel.dbclear
# 
      # PublisherProductPrice.dbdelete
      # PublisherProductPrice.dbclear
# 
      # PublisherProductLessonTime.dbdelete
      # PublisherProductLessonTime.dbclear
# 
      # PublisherProductCoreLiteracyStandard.dbdelete
      # PublisherProductCoreLiteracyStandard.dbclear
# 
      # PublisherProductCoreMathStandard.dbdelete
      # PublisherProductCoreMathStandard.dbclear

 
      redirect_to '/'      
  end
    
    
    
  private

    def user_params
      params.require(:user).permit(
                                    :name_first,
                                    :name_last,
                                    :email, 
                                    :username, 
                                    :profile_type, 
                                    :has_profile, 
                                    :password, 
                                    :password_confirmation, 
                                    :bd_month,
                                    :bd_day,
                                    :bd_year,
                                    :gender,
                                    :gender_text,
                                    :profile_type,
                                    :profile_type_text,
                                  )
                                  
    end


    # def gender_text(x)
        # gender = "Female"
        # if (x == 0)
            # gender = "Male"
        # end
        # # x ? "Female" : "Male"        
        # return gender
    # end
  
  





    
  end