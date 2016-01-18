class UsersController < ApplicationController

  prepend_view_path 'app/views/user'
  
  # fill_left_directory
  # index
  # render_index_publisher_home
  # render_index_publisher
  # render_index_public_publisher(publisher)
  # render_index_publisher_user_home
  # render_index_publisher_user
  # render_index_public_publisher_user(user)
  # render_index_public_publisher_user_signedout(user)
  # get_user_url(id)
  # get_user_url_public(user, id)
  # # show
  # new
  # create
  # render_error(controller, action, profile_index, profile_description, description)
  # get_random
  # get_gender_text(gender)
  # get_bd_month_text(bd_month)
  # create_user_publisher(params_user)
  # following
  # followers
  # # edit
  # # update
  # # delete
  # # destroy
  # reset_users
  # private

  layout 'users_new'

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

  # before_action :verify_params, only: :index
  # before_action :fill_left_directory, only: [:index, 
                                             # :render_index_publisher, 
                                             # :render_index_publisher_home,
                                             # :render_index_publisher_user,
                                             # :render_index_publisher_user_home]
  
  
  # def verify_params
      # id_passed = params[:id]
      # b_signed_in = signed_in?
      # if id_passed.nil?
          # if b_signed_in
              # @user = current_user
              # case current_user.profile_type.to_s
                # when "1"
                    # # student user
                # when "2"
                    # # teacher user
                # when "3"
                    # # publisher user
                    # # Rails.logger.info("current_user.publisher_user.slug = " + current_user.publisher_user.slug)
                    # redirect_to user_publisher_user_url(@user)
                    # # redirect_to user_publisher_users_url(:user_id => current_user.id, :id => current_user.slug)
                    # # redirect_to index_home_user_publisher_user_url(@user)
                    # # redirect_to user_publisher_user_publisher_users_index_home_url
                    # # redirect_to publisher_user_publisher_users_path
                    # # redirect_to publisher_users_index_home_path
                    # # redirect_to publisher_users_index_path
                    # # redirect_to '/publisher_user/publisher_users/index'
                    # # redirect_to '/publisher_users/index'
                    # # redirect_to '/publisher_user/publisher_users'
                    # # redirect_to '/publisher_user/'
                # when "4"
                    # # institute user
                # when "5"
                    # # recruiter user
                # else
                    # #
              # end
              # # home_url = get_user_url(id_passed)
              # # redirect_to home_url
              # # render_index_publisher_user_home
          # else
              # redirect_to '/Signin'
          # end        
      # else
          # issued_gen_id = IssuedGenId.where(:gen_id => id_passed).first rescue nil
          # if !issued_gen_id.nil?
              # # user_passed = User.friendly.find(id_passed) rescue nil
              # profile_type = issued_gen_id.profile_type
              # if !profile_type.nil?
                  # case profile_type.to_s
                    # when "1"
                        # # student user
                    # when "2"
                        # # teacher user
                    # when "3"
                        # # publisher user
                        # user_passed = issued_gen_id.user
                        # if !user_passed.nil?
                            # if b_signed_in
                                # if ( user_passed.id == current_user.id )
                                    # redirect_to 'publisher_users/index'
                                    # Rails.logger.info('called render_index_publisher_user')
                                    # # render_index_publisher_user
                                # else
                                    # redirect_to 'public_publisher_users/index'
                                    # Rails.logger.info('called render_index_public_publisher_user')
                                    # # render_index_public_publisher_user(user_passed)
                                # end                
                            # else
                                # redirect_to 'public_publisher_users_signedout/index'
                                # Rails.logger.info('called render_index_public_publisher_user_signedout')
                                # # render_index_public_publisher_user_signedout(user_passed)
                                # # render 'index_public_publisher_user'
                                # # user_url = get_user_url_public(user_passed, id_passed)                      
                            # end
                        # else
                            # Rails.logger.info('user_passed was nil')
                            # # id passed exists, but user not found -> error
                        # end
                    # when "4"
                        # # institute/school user
                    # when "5"
                        # #recruiter user
                    # when "11"
                        # # student
                    # when "22"
                        # # teacher
                    # when "33"
                        # # publisher
                        # publisher_passed = issued_gen_id.publisher
                        # if !publisher_passed.nil?
                            # if b_signed_in
                                # # current_user_profile_type = current_user.profile_type  
                                # if current_user.profile_type == 3
                                    # # same profile type. is this the user's own publisher?
                                    # if publisher_passed == current_user.publisher
                                        # # is this the publisher admin?
                                        # redirect_to 'publishers/index'
                                        # # render_index_publisher
                                    # else
                                        # # -> public_publisher
                                        # redirect_to 'public_publishers/index'
                                        # # render_index_public_publisher(publisher_passed)
                                    # end
                                # else
                                    # # user is a different profile type
                                    # redirect_to 'public_publishers/index'
                                    # # render_index_public_publisher(publisher_passed)
                                # end
                            # else
                              # # -> public_publishers, no signin
                              # redirect_to 'public_publishers_signedout/index'
                              # # render_index_public_publisher_no_signin(publisher)
                              # # render_index_public_publisher_signedout(publisher_passed)
                            # end
                        # else
                            # Rails.logger.info('publisher_passed was nil')
                            # # id passed exists, but publisher not found -> error
                        # end
                    # when "44"
                        # # institute/school
                    # when "55"
                        # #recruiter
                    # else
                        # #        
                  # end
              # end
          # else
              # Rails.logger.info('issued_gen_id was nil')
              # if b_signed_in
                  # # Rails.logger.info('b_signed_in was true')
                  # # signed in user manually entered an invalid url. he should know better. display error page 404
                  # raise ActionController::RoutingError.new('Not Found')  
              # else
                  # # invalid url and no signed-in user. display Signin/Signup
                  # Rails.logger.info('user not signed-in')
                  # redirect_to '/Signin'
              # end
          # end
      # end
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



  def index

    # @logger = TorqueBox::Logger.new( YourModule::YourClass )
    # @logger.debug("Will code for food")
        
    # id_passed = params[:id]
    # # redirect_to index_post_publisher_users_path(:id_publisher_user => id_passed)
    # redirect_to index_post_publisher_users_path

    # Rails.logger.info('in users index')
    
    id_passed = params[:id]
    
    # Rails.logger.info('in users id_passed = ' + id_passed.to_s)
    
    b_signed_in = signed_in?

    if id_passed.nil?
        if b_signed_in
            #render_index_publisher_user_home
            index_publisher_user_home
        else
            redirect_to '/Signin'
        end        
    else
      
        # Rails.logger.info('id_passed not nil')
        # b_id_exists = IssuedGenId.exists?(:gen_id => id_passed)
        issued_gen_id = IssuedGenId.where(:gen_id => id_passed).first rescue nil
        # issued_gen_id = IssuedGenId.find(:gen_id => 818282524022) rescue nil
        # if b_id_exists
        if !issued_gen_id.nil?
            # user_passed = User.friendly.find(id_passed) rescue nil
            profile_type = issued_gen_id.profile_type rescue nil
            if !profile_type.nil?
                case profile_type.to_s
                  when "1"
                      # student user
                  when "2"
                      # teacher user
                  when "3"
                      # publisher user
                      user_passed = issued_gen_id.user rescue nil
                      if !user_passed.nil?
                          if b_signed_in
                              if ( user_passed.id == current_user.id )
                                  Rails.logger.info('called index_publisher_user')
                                  index_publisher_user
                              else
                                  Rails.logger.info('called render_index_public_publisher_user')
                                  # render_index_public_publisher_user(user_passed)
                                  index_publisher_user_public(user_passed)
                              end                
                          else
                              Rails.logger.info('called render_index_public_publisher_user_signedout')
                              # render_index_public_publisher_user_signedout(user_passed)
                              index_publisher_user_signedout(user_passed)
                          end
                      else
                          # Rails.logger.info('user_passed was nil')
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
                                      # render_index_publisher
                                      Rails.logger.info('called index_publisher')
                                      index_publisher
                                  else
                                      # -> public_publisher
                                      # render_index_public_publisher(publisher_passed)
                                      Rails.logger.info('called index_publisher_public 1')
                                      index_publisher_public(publisher_passed)
                                  end
                              else
                                  # user is a different profile type
                                # render_index_public_publisher(publisher_passed)
                                Rails.logger.info('called index_publisher_public 2')
                                index_publisher_public(publisher_passed)
                              end
                          else
                            # -> public_publishers, no signin
                            # render_index_public_publisher_no_signin(publisher)
                            # render_index_public_publisher_signedout(publisher_passed)
                            index_publisher_signedout(publisher_passed)
                          end
                      else
                          # Rails.logger.info('publisher_passed was nil')
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
            # Rails.logger.info('issued_gen_id was nil')
            if b_signed_in
                # Rails.logger.info('b_signed_in was true')
                # signed in user manually entered an invalid url. he should know better. display error page 404
                raise ActionController::RoutingError.new('Not Found')  
            else
                # invalid url and no signed-in user. display Signin/Signup
                # Rails.logger.info('user not signed-in')
                redirect_to '/Signin'
            end
            
        end
        
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



  def learn_more
    @bd_years = BdYear.order("year_value ASC").all
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

      Rails.logger.info('profile_type = ' + profile_type.to_s)
      
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
          # new_user = sign_in_new user
          # redirect_to '/' + new_user.slug
          sign_in user
          if signed_in?
              # session[:new_user] = true
              redirect_to '/' + current_user.slug
          else
              # log an error. flag user on signin page.
              redirect_to '/'  
          end
      else
          render_error('log_errors', 
                       'create', 
                       '3', 
                       'publisher',
                       'Create User failed')
      end  
      

  end
    
    
    
  def check_duplicate_signup
    
      email = params[:email]
      b_email_exists = User.exists?(:email => email) rescue nil
      if b_email_exists
          # Rails.logger.info('b_email_exists true')
      else
          # Rails.logger.info('b_email_exists nil or false')
          b_email_exits = false
      end

      respond_to do |format|
        format.html {}
        format.json { render :json => { 
                                        :b_email_exists => b_email_exists
                                      } 
                    }
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

  

  def get_random_11

      begin
      
          r = rand(10000000000..99999999999) # 99,999,999,999 11
                
      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 0, :profile_description => 'none', :controller => 'users', :action => 'get_random_11', :description => e.message.to_s)
      end

      
  end



  def get_random_12

      begin
      
          r = rand(100000000000..999999999999) # 999,999,999,999 12
                
      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 0, :profile_description => 'none', :controller => 'users', :action => 'get_random_12', :description => e.message.to_s)
      end

      
  end



  def increment_gen_id_user(r)
    
      begin

          r_return = nil

          r += 1
          
          if r < 999999999999
              r_return = r  
          end

          return r_return

      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 0, :profile_description => 'none', :controller => 'users', :action => 'increment_gen_id_user', :description => e.message.to_s)
      end
        
        
  end
  
  
  
  def increment_gen_id_genre(r)
    
      begin

          r_return = nil

          r += 1
          
          if r < 99999999999
              r_return = r  
          end

          return r_return

      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 0, :profile_description => 'none', :controller => 'users', :action => 'increment_gen_id_user', :description => e.message.to_s)
      end
        
  end



  def get_gen_id_user

      begin

          r = get_random_12
          
          b_r = true
          while b_r do
              b_r = IssuedGenId.exists?(:gen_id => r)
              if b_r
                  r = increment_gen_id_user(r)
                  if r.nil?
                      r = get_random_12
                  end
              end      
          end
          
          return r
      
      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 0, :profile_description => 'none', :controller => 'users', :action => 'get_gen_id_user', :description => e.message.to_s)
      end

      
  end



  def get_gen_id_genre

      begin

          r = get_random_11
          
          b_r = true
          while b_r do
              b_r = IssuedGenId.exists?(:gen_id => r)
              if b_r
                  r = increment_gen_id_genre(r)
                  if r.nil?
                      r = get_random_11
                  end
              end      
          end
          
          return r
      
      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 0, :profile_description => 'none', :controller => 'users', :action => 'get_gen_id_genre', :description => e.message.to_s)
      end

      
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
      # h_user[:profile_type] = params_user[:profile_type]
      h_user[:profile_type] = 3
      h_user[:profile_type_text] = 'publisher' 
      h_user[:password] = params_user[:password]
      h_user[:password_confirmation] = params_user[:password_confirmation]
      h_user[:bd_month] = params_user[:bd_month]
      h_user[:bd_month_text] = get_bd_month_text(params_user[:bd_month])
      h_user[:bd_day] = params_user[:bd_day]
      h_user[:bd_year] = params_user[:bd_year]
      h_user[:gender] = params_user[:gender]
      h_user[:gender_text] = get_gender_text(params_user[:gender])
      user = User.new(h_user) rescue nil
      if !user.nil?
          if user.save
              user_gen_id = get_gen_id_user
              # increment_gen_id_user(user_gen_id, 3)
              h_issued_gen_id = Hash.new
              h_issued_gen_id[:gen_id] = user_gen_id
              h_issued_gen_id[:profile_type] = 3 
              h_issued_gen_id[:user_id] = user.id            
              issued_gen_id = IssuedGenId.new(h_issued_gen_id) rescue nil
              if !issued_gen_id.nil?
                  if issued_gen_id.save
                      if user.update_attributes(:slug => issued_gen_id.gen_id.to_s)
                          h_publisher = Hash.new
                          h_publisher[:user_id] = user.id
                          publisher = Publisher.new(h_publisher) rescue nil
                          if !publisher.nil?
                              if publisher.save
                                  publisher_gen_id = get_gen_id_genre
                                  # increment_gen_id_genre(publisher_gen_id, 3)
                                  h_issued_gen_id_publisher = Hash.new
                                  h_issued_gen_id_publisher[:gen_id] = publisher_gen_id
                                  h_issued_gen_id_publisher[:profile_type] = 33
                                  h_issued_gen_id_publisher[:publisher_id] = publisher.id  
                                  issued_gen_id_publisher = IssuedGenId.new(h_issued_gen_id_publisher) rescue nil
                                  if !issued_gen_id_publisher.nil?
                                      if issued_gen_id_publisher.save
                                          if publisher.update_attributes(:slug => issued_gen_id_publisher.gen_id.to_s)
                                              h_publisher_plot = Hash.new
                                              h_publisher_plot[:user_id] = user.id
                                              h_publisher_plot[:publisher_id] = publisher.id                                              
                                              # h_publisher_plot[:publisher_user_id] = publisher_user.id
                                              publisher_plot = PublisherPlot.new(h_publisher_plot) rescue nil
                                              if !publisher_plot.nil?
                                                  if publisher_plot.save
                                                      h_publisher_user = Hash.new
                                                      h_publisher_user[:user_id] = user.id
                                                      h_publisher_user[:publisher_id] = publisher.id
                                                      publisher_user = PublisherUser.new(h_publisher_user) rescue nil
                                                      if !publisher_user.nil?
                                                          if publisher_user.save
                                                              h_publisher_user_plot = Hash.new
                                                              h_publisher_user_plot[:user_id] = user.id
                                                              h_publisher_user_plot[:publisher_id] = publisher.id
                                                              h_publisher_user_plot[:publisher_user_id] = publisher_user.id
                                                              publisher_user_plot = PublisherUserPlot.new(h_publisher_user_plot) rescue nil
                                                              if !publisher_user_plot.nil?
                                                                  if publisher_user_plot.save
                                                                      h_publisher_user_interest = Hash.new
                                                                      h_publisher_user_interest[:user_id] = user.id
                                                                      h_publisher_user_interest[:publisher_id] = publisher.id
                                                                      h_publisher_user_interest[:publisher_user_id] = publisher_user.id
                                                                      publisher_user_interest = PublisherUserInterest.new(h_publisher_user_interest) rescue nil
                                                                      if !publisher_user_interest.nil?
                                                                          if publisher_user_interest.save
                                                                              h_publisher_product_current = Hash.new
                                                                              h_publisher_product_current[:user_id] = user.id
                                                                              h_publisher_product_current[:publisher_id] = publisher.id
                                                                              publisher_product_current = PublisherProductCurrent.new(h_publisher_product_current) rescue nil
                                                                              if !publisher_product_current.nil?
                                                                                  if publisher_product_current.save
                                                                                      #
                                                                                  else
                                                                                      Rails.logger.info('publisher_product_current save failed')
                                                                                  end
                                                                              else
                                                                                  Rails.logger.info('publisher_product_current new returned nil')
                                                                              end
                                                                          else
                                                                              Rails.logger.info('publisher_user_interest save failed')
                                                                          end
                                                                      else
                                                                          Rails.logger.info('publisher_user_interest new returned nil')
                                                                      end
                                                                  else
                                                                      Rails.logger.info('publisher_user_plot save failed')
                                                                  end
                                                              else
                                                                  Rails.logger.info('publisher_user_plot new returned nil')
                                                              end
                                                          else
                                                              Rails.logger.info('publisher_user save failed')
                                                          end
                                                      else
                                                          Rails.logger.info('publisher_user new returned nil')
                                                      end
                                                  else
                                                      Rails.logger.info('publisher_plot save failed')                                            
                                                  end
                                              else
                                                  Rails.logger.info('publisher_plot new returned nil')
                                              end                                        
                                          else
                                              Rails.logger.info('publisher update failed')
                                          end
                                      else
                                          Rails.logger.info('issued_gen_id_publisher save failed')
                                      end
                                  else
                                      Rails.logger.info('issued_gen_id_publisher new returned nil')
                                  end            
                              else
                                  Rails.logger.info('publisher save failed')
                              end
                          else
                              Rails.logger.info('publisher new returned nil')
                          end
                      else
                          Rails.logger.info('user update failed')                
                      end
                  else
                      Rails.logger.info('issued_gen_id save failed')
                  end
              else
                  Rails.logger.info('issued_gen_id new returned nil')
              end              
          else
              Rails.logger.info('user save failed')
          end
      else
          Rails.logger.info('user new returned nil')
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
    
    
    
  def update_new_user
    
      if current_user.update_attributes(:new_user => false)
          Rails.logger.info('current_user.update_attributes succeeded')
          # Rails.logger.info('current_user.save succeeded')
      else
          Rails.logger.info('current_user.update_attributes failed')
          # Rails.logger.info('current_user.save failed')
      end
      
      
  end    
    
    
    

  def upload_user_background1_image

      @user_bkgrnd_image = nil
      @bkgrnd_crop_x = 0
      @bkgrnd_crop_y = 0
      @bkgrnd_crop_w = 1200
      @bkgrnd_crop_h = 300
      
      # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      # if !publisher.nil?
      if signed_in?
          h_user_bkgrnd_image = Hash.new
          h_user_bkgrnd_image[:image] = params[:user_bkgrnd_image][:image]
          h_user_bkgrnd_image[:user_id] = current_user.id
          # h_user_bkgrnd_image[:publisher_id] = publisher.id
          h_user_bkgrnd_image[:primary] = true
          h_user_bkgrnd_image[:crop_x] = @bkgrnd_crop_x
          h_user_bkgrnd_image[:crop_y] = @bkgrnd_crop_y
          h_user_bkgrnd_image[:crop_w] = @bkgrnd_crop_w
          h_user_bkgrnd_image[:crop_h] = @bkgrnd_crop_h
          user_bkgrnd_image = UserBkgrndImage.new(h_user_bkgrnd_image)

          user_bkgrnd_images = current_user.user_bkgrnd_images
          user_bkgrnd_image_old = user_bkgrnd_images.where( :primary => true ).first rescue nil
   
          if request.xhr? || remotipart_submitted?
              if user_bkgrnd_image.save
                  if !user_bkgrnd_image_old.nil?
                      # TODO Check if image destroyed
                      # user_bkgrnd_image_old.update_attributes( :primary => false )
                      user_bkgrnd_image_old.destroy
                  end
                  
                  user_bkgrnd_image = user_bkgrnd_images.where( :primary => true ).last rescue nil
                  
                  if !user_bkgrnd_image.nil? 
                      @user_bkgrnd_image = user_bkgrnd_image

                      img = user_bkgrnd_image
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

                      if user_bkgrnd_image.update_attributes(h_update)
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



  def destroy_user_background1_image
      @user_bkgrnd_image = nil

      # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      # if !publisher.nil?
      if signed_in?
          user_bkgrnd_images = current_user.user_bkgrnd_images
          if user_bkgrnd_images.destroy(params[:user_bkgrnd_image][:id])
              user_bkgrnd_image_new = user_bkgrnd_images.last rescue nil
              if !user_bkgrnd_image_new.nil?
                  # TODO Check if attributes updated
                  user_bkgrnd_image_new.update_attributes( :primary => true )
              end

              user_bkgrnd_image = user_bkgrnd_images.where( :primary => true ).last rescue nil
              if !user_bkgrnd_image.nil? 
                  @user_bkgrnd_image = user_bkgrnd_image
              end
          else
            # Error
          end
      end
  end 



  def crop_user_background1_image

      @user_bkgrnd_image = nil

      # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil

      # if !publisher.nil?
      if signed_in?
          
          user_bkgrnd_images = current_user.user_bkgrnd_images
          img = user_bkgrnd_images.find(params[:image_id]) rescue nil
          
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

              user_bkgrnd_image = user_bkgrnd_images.where( :primary => true ).last rescue nil
              if !user_bkgrnd_image.nil? 
                  @user_bkgrnd_image = user_bkgrnd_image

                  h_update = Hash.new
                  h_update[:crop_x] = params[:crop_x]
                  h_update[:crop_y] = params[:crop_y]
                  h_update[:crop_w] = params[:crop_w]
                  h_update[:crop_h] = params[:crop_h]
                  
                  if user_bkgrnd_image.update_attributes(h_update)
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



  def reset_users

      LogError.dbdelete
      LogError.dbclear

      LogUser.dbdelete
      LogUser.dbclear
      RelateLogUser.dbdelete
      RelateLogUser.dbclear

      LogPublisher.dbdelete
      LogPublisher.dbclear
      RelateLogPublisher.dbdelete
      RelateLogPublisher.dbclear

      PostPublisher.dbdelete
      PostPublisher.dbclear
      RelatePublisherFollow.dbdelete
      RelatePublisherFollow.dbclear
      PostPublisherImage.dbdelete
      PostPublisherImage.dbclear
      PostPublisherComment.dbdelete
      PostPublisherComment.dbclear

      PublisherUserPlot.dbdelete
      PublisherUserPlot.dbclear
      PublisherUserInterest.dbdelete
      PublisherUserInterest.dbclear
      PublisherUserPlotImage.dbdelete
      PublisherUserPlotImage.dbclear
      PublisherUserInterestImage.dbdelete
      PublisherUserInterestImage.dbclear

      PublisherPlot.dbdelete
      PublisherPlot.dbclear

      PostUser.dbdelete
      PostUser.dbclear
      RelateFollow.dbdelete
      RelateFollow.dbclear
      PostUserLike.dbdelete
      PostUserLike.dbclear      
      PostUserImage.dbdelete
      PostUserImage.dbclear      
      PostUserComment.dbdelete
      PostUserComment.dbclear

      # FriendlyIdSlug.dbdelete
      # FriendlyIdSlug.dbclear
      
      User.dbdelete
      User.dbclear
      UserImage.dbdelete
      UserImage.dbclear
      IssuedGenId.dbdelete
      IssuedGenId.dbclear
      IssuedPerId.dbdelete
      IssuedPerId.dbclear

      # UserProfileImage.dbdelete
      # UserProfileImage.dbclear

      IssuedPublisherProductId.dbdelete
      IssuedPublisherProductId.dbclear

      Publisher.dbdelete
      Publisher.dbclear

      PublisherUser.dbdelete
      PublisherUser.dbclear

      PublisherMember.dbdelete
      PublisherMember.dbclear

      PublisherUserImage.dbdelete
      PublisherUserImage.dbclear

      PublisherUserLogoImage.dbdelete
      PublisherUserLogoImage.dbclear

      PublisherLogoImage.dbdelete
      PublisherLogoImage.dbclear

      # PublisherProfileImage.dbdelete
      # PublisherProfileImage.dbclear

      PublisherProduct.dbdelete
      PublisherProduct.dbclear

      PublisherProductManifest.dbdelete
      PublisherProductManifest.dbclear

      PublisherProductDescription.dbdelete
      PublisherProductDescription.dbclear

      PublisherProductCurrent.dbdelete
      PublisherProductCurrent.dbclear

      PublisherProductPos1Image.dbdelete
      PublisherProductPos1Image.dbclear
      PublisherProductPos2Image.dbdelete
      PublisherProductPos2Image.dbclear
      PublisherProductPos3Image.dbdelete
      PublisherProductPos3Image.dbclear

      PublisherProductImage.dbdelete
      PublisherProductImage.dbclear

      PublisherProduct1Image.dbdelete
      PublisherProduct1Image.dbclear

      PublisherProduct2Image.dbdelete
      PublisherProduct2Image.dbclear

      # PublisherProductLogo.dbdelete
      # PublisherProductLogo.dbclear

      # PublisherProductLogo1Image.dbdelete
      # PublisherProductLogo1Image.dbclear

      PublisherProductCorporateLogo.dbdelete
      PublisherProductCorporateLogo.dbclear

      PublisherProductPdf.dbdelete
      PublisherProductPdf.dbclear

      PublisherProductPdfImage.dbdelete
      PublisherProductPdfImage.dbclear

      PublisherProductContentType.dbdelete
      PublisherProductContentType.dbclear

      PublisherProductCategorySubject.dbdelete
      PublisherProductCategorySubject.dbclear

      PublisherProductAppropriateAge.dbdelete
      PublisherProductAppropriateAge.dbclear

      PublisherProductFromAge.dbdelete
      PublisherProductFromAge.dbclear

      PublisherProductToAge.dbdelete
      PublisherProductToAge.dbclear

      PublisherProductAppropriateGrade.dbdelete
      PublisherProductAppropriateGrade.dbclear

      PublisherProductFromGrade.dbdelete
      PublisherProductFromGrade.dbclear

      PublisherProductToGrade.dbdelete
      PublisherProductToGrade.dbclear

      PublisherProductMarketTarget.dbdelete
      PublisherProductMarketTarget.dbclear

      PublisherProductPlatform.dbdelete
      PublisherProductPlatform.dbclear

      PublisherProductFileType.dbdelete
      PublisherProductFileType.dbclear

      PublisherProductCharacter.dbdelete
      PublisherProductCharacter.dbclear

      PublisherProductEnhancement.dbdelete
      PublisherProductEnhancement.dbclear

      PublisherProductByReview.dbdelete
      PublisherProductByReview.dbclear

      PublisherProductPricingModel.dbdelete
      PublisherProductPricingModel.dbclear

      PublisherProductPrice.dbdelete
      PublisherProductPrice.dbclear

      PublisherProductLessonTime.dbdelete
      PublisherProductLessonTime.dbclear

      PublisherProductCoreLiteracyStandard.dbdelete
      PublisherProductCoreLiteracyStandard.dbclear

      PublisherProductCoreMathStandard.dbdelete
      PublisherProductCoreMathStandard.dbclear

 
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



    # def render(*args)
      # options = args.extract_options!
      # # options[:template] = "/mycustomfolder/#{params[:action]}"
      # options[:template] = "/user/#{params[:action]}"
      # super(*(args << options))
    # end

    # def gender_text(x)
        # gender = "Female"
        # if (x == 0)
            # gender = "Male"
        # end
        # # x ? "Female" : "Male"        
        # return gender
    # end
  

    
  end