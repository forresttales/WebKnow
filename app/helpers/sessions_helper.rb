module SessionsHelper
    
  def sign_in(user)
    remember_token = User.new_remember_token
    
    # Rails.logger.info params[:remember_me]
    session[:remember_token] = remember_token
    
    if params[:remember_me].to_s == "1"
      cookies.permanent[:remember_token] = remember_token
      # cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:remember_token] = remember_token
      # cookies[:auth_token] = user.auth_token
    end
    # cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
    
    signin_init
    
    # self.user_34_avatar = user_34_avatar(user)
    
    # session[:username] = user.username
    # session[:user_id] = user.id
    # session[:signed_in] = true

    # if user.has_profile    
      # session[:has_profile] = user.has_profile
      # session[:profile_type] = user.profile_type    
      # profile_type = session[:profile_type] 
      # case user.profile_type.to_s  
        # when "1"
          # session[:profile] = "/Student"
          # profile_type = "Student"
        # when "2"
          # session[:profile] = "/Teacher"          
          # profile_type = "Teacher"
        # when "3"
          # session[:profile] = "/Publisher"          
          # profile_type = "Publisher"
        # when "4"
          # session[:profile] = "/Institute"          
          # profile_type = "School"
        # when "5"
          # session[:profile] = "/Recruiter"          
          # profile_type = "Recruiter"
          # # redirect_to(:controller => 'students', :action => 'index')          
        # else
          # session[:profile] = "/Signup"
          # profile_type = ""          
          # #        
      # end

      # self.current_user_profile_type = user
      
      # session[:profile] = "/" + user.profile_type + "s/home"
    # else
      # session[:profile] = "/Signup"      
    # end

    
  end


  def signin_init
    
      profile_type = ""
      case current_user.profile_type.to_s  
        when "1"
          signin_init_student
        when "2"
          signin_init_teacher
        when "3"
          signin_init_publisher
        when "4"
          signin_init_school
        when "5"
          signin_init_recruiter          
        else
          #
      end
      
    
  end

  def signin_init_student
  end
  def signin_init_teacher
  end
  
  def signin_init_publisher

      publisher_product_current = current_user.publisher.publisher_product_current rescue nil
      if !publisher_product_current.nil?
          publisher_product_current.current_publisher_product_id = 0
          publisher_product_current.current_publisher_product_gen_id = 0
          if publisher_product_current.save
              #
          else
              Rails.logger.info("publisher_product_current save to 0 failed")
          end
      else
          Rails.logger.info("publisher_product_current was nil")
      end

    
  end

  def signin_init_school
  end
  def signin_init_recruiter
  end



  def signed_in?
    !current_user.nil?
  end


  def current_user=(user)
    @current_user = user
  end


  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end


  def current_user?(user)
    user == current_user
  end


  def already_signed_in
    if !signed_in?
      # # redirect_to session[:profile]
      # redirect_to '/'
    # else
      redirect_to '/Signin'
    end
  end


  def signed_in_user
    unless signed_in?
      store_location
      redirect_to '/'
      # redirect_to '/current_user.slug'
      # redirect_to signin_url, notice: "Please sign in"
    end
  end


  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    session.delete(:remember_token)
    
    
    # session[:username] = nil
    # #session[:admin] = nil
    # session[:has_profile] = nil
    # session[:user_id] = nil
    # session[:signed_in] = nil
    # session[:profile_type] = nil
    # session[:profile] = nil
    # session[:institute_id] = nil        
    # session[:publisher_id] = nil
    # session[:recruiter_id] = nil
    # session[:student_id] = nil
    # session[:teacher_id] = nil
    # session[:poster] = nil        
    # session[:publisher_journalposter_id] = nil
    # session[:publisher_has_journalposter] = nil
        
    #cookies.delete(:remember_token)        
        
    # session[:return_to] = nil    
    
    # if user.admin
      # session[:admin] = true
    
    #flash[:logout] = "Logged out"
    
    #redirect_to("login_path")
    # redirect_to(:controller => 'users', :action => 'home')
    
    
  end


  def redirect_back_or(default)
    # redirect_to(session[:return_to] || default)
    # session.delete(:return_to)
  end


  # def redirect_to_profile_type(profile_type)
  # def redirect_to_profile(user)
      # s_url = ""
      # s_id_gen = user.id_gen
      # s_id_per = user.id_per
      # s_id = ""
      # if s_id_per == ""
        # s_id = s_id_gen
      # else
        # s_id = s_id_per
      # end
      # case user.profile_type.to_s
        # when "0"
          # # redirect_to '/Institutes'          
        # when "1"
          # # redirect_to '/Publishers'          
          # # redirect_to(:controller => 'publishers', :action => 'index')          
        # when "2"
          # # redirect_to "/Publisher"
          # # redirect_to(:controller => 'recruiters', :action => 'index')          
        # when "3"
          # redirect_to "/Publisher"
          # # redirect_to(:controller => 'teachers', :action => 'index')          
        # when "4"
          # # redirect_to(:controller => 'students', :action => 'index')          
        # else
          # #        
      # end
  # end



  def store_location
    session[:return_to] = request.url
  end  
  
  
  def user_profile_image_nav
    user_profile_image_nav = UserProfileImage.where("user_id = ?", current_user.id).first     
  end

  
  def current_user_profile_type
      profile_type = ""
      case current_user.profile_type.to_s  
        when "1"
          profile_type = "Student"          
        when "2"
          profile_type = "Teacher"          
        when "3"
          profile_type = "Publisher"          
        when "4"
          profile_type = "School"          
        when "5"
          profile_type = "Recruiter"          
          # redirect_to(:controller => 'students', :action => 'index')          
        else
          profile_type = ""
      end
    
    @current_user_profile_type = profile_type
  end

  
  # def user_34_avatar=(user)
    # @user_34_avatar = user_34_avatar
  # end
  
  # def user_34_avatar
      # @user_34_avatar = user_34_avatar(current_user)
  # end
  
  
  def avatar_test
    avatar_test = "avatar test"
    return avatar_test 
  end
  
  
  def avatar34
      avatar34 = user_34_avatar
      # avatar34 = nil
      return avatar34
  end
  
  
  def user_34_avatar
    
      user = self.current_user
      avatar = nil
      if !user.nil?
        user_id = user.id
        case user.profile_type.to_s  
          when "1"  # student
          when "2" # teacher
          when "3" # publisher
            avatar = avatar_34_publisher(user_id)         
          when "4" # institute
          when "5" # recruiter
          else
            #        
        end
      else
        Rails.logger.info("current_user is nil")
      end
      
      return avatar
      
  end
  
  
  def avatar_34_publisher(user_id)

    user_avatar = nil
    publisher_user = PublisherUser.where("user_id = ?", user_id).first
    if !publisher_user.nil?
      publisher_user_id = publisher_user.id
      publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", publisher_user_id).where( :primary => true ).first rescue nil
      if !publisher_user_image_primary.nil?
        if publisher_user_image_primary.image?
          user_avatar = publisher_user_image_primary.image_url(:image_34_34)
        else
          Rails.logger.info("publisher_user_image_primary image is nil")
        end
      else
        Rails.logger.info("publisher_user_image_primary is nil")
      end 
    else
      Rails.logger.info("publisher_user is nil")
      # user_avatar = avatar_generic_1_w34_h34.png
    end
    
    return user_avatar
        
  end
  

  def avatar50
      avatar50 = user_50_avatar
      # avatar50 = nil
      return avatar50
  end
  
  
  def user_50_avatar
    
      user = self.current_user
      avatar = nil
      if !user.nil?
        avatar = avatar_50_user(user.id)
        # case user.profile_type.to_s  
          # when "1"  # student
          # when "2" # teacher
          # when "3" # publisher
            # avatar = avatar_50_publisher(user_id)         
          # when "4" # institute
          # when "5" # recruiter
          # else
            # #        
        # end
      else
        # Rails.logger.info("current_user is nil")
      end
      
      return avatar
      
  end
  

  def avatar_50_user(user_id)

      user_avatar = nil
      user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil
      if !user_image_primary.nil?
          if user_image_primary.image?
              user_avatar = user_image_primary.image_url(:image_50_50)
          else
              # Rails.logger.info("user_image_primary image is nil")
          end
      else
          # Rails.logger.info("user_image_primary is nil")
      end 
      
      return user_avatar
        
  end
  
  # def avatar_50_publisher(user_id)
    # user_avatar = nil
    # publisher_user = PublisherUser.where("user_id = ?", user_id).first
    # if !publisher_user.nil?
      # publisher_user_id = publisher_user.id
      # publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", publisher_user_id).where( :primary => true ).first rescue nil
      # if !publisher_user_image_primary.nil?
        # if publisher_user_image_primary.image?
          # user_avatar = publisher_user_image_primary.image_url(:user_50_50)
        # else
          # Rails.logger.info("publisher_user_image_primary image is nil")
        # end
      # else
        # Rails.logger.info("publisher_user_image_primary is nil")
      # end 
    # else
      # Rails.logger.info("publisher_user is nil")
      # # user_avatar = avatar_generic_1_w50_h50.png
    # end
    # return user_avatar
  # end


  
end
