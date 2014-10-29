module SessionsHelper
    
  def sign_in(user)
    remember_token = User.new_remember_token
    
    # Rails.logger.info params[:remember_me]
    
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
    
    session[:username] = user.username
    session[:user_id] = user.id
    session[:signed_in] = true

    # if user.has_account    
      # session[:has_account] = user.has_account
      session[:account_type] = user.account_type    
      account_type = session[:account_type] 

      case user.account_type.to_s  
        when "1"
          session[:profile] = "/Student"
          account_type = "Student"
        when "2"
          session[:profile] = "/Teacher"          
          account_type = "Teacher"
        when "3"
          session[:profile] = "/Publisher"          
          account_type = "Publisher"
        when "4"
          session[:profile] = "/Institute"          
          account_type = "School"
        when "5"
          session[:profile] = "/Recruiter"          
          account_type = "Recruiter"
          # redirect_to(:controller => 'students', :action => 'index')          
        else
          session[:profile] = "/Signup"
          account_type = ""          
          #        
      end

      # self.current_user_account_type = user
      
      # session[:profile] = "/" + user.account_type + "s/home"
    # else
      # session[:profile] = "/Signup"      
    # end

    
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
    if signed_in?
      redirect_to session[:profile]
    end
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to '/'
      # redirect_to signin_url, notice: "Please sign in"
    end
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    
    
    session[:username] = nil
    #session[:admin] = nil
    session[:has_account] = nil
    session[:user_id] = nil
    session[:signed_in] = nil
    session[:account_type] = nil
    session[:profile] = nil
    
    session[:institute_id] = nil        
    session[:publisher_id] = nil
    session[:recruiter_id] = nil
    session[:student_id] = nil
    session[:teacher_id] = nil
        
    session[:poster] = nil        
    session[:publisher_journalposter_id] = nil
    session[:publisher_has_journalposter] = nil
        
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


  def redirect_to_profile_type(profile_type)

      case profile_type.to_s
        when "0"
          # redirect_to '/Institutes'          
        when "1"
          # redirect_to '/Publishers'          
          # redirect_to(:controller => 'publishers', :action => 'index')          
        when "2"
          # redirect_to "/Publisher"
          # redirect_to(:controller => 'recruiters', :action => 'index')          
        when "3"
          redirect_to "/Publisher"
          # redirect_to(:controller => 'teachers', :action => 'index')          
        when "4"
          # redirect_to(:controller => 'students', :action => 'index')          
        else
          #        
      end
    
  end



  def store_location
    session[:return_to] = request.url
  end  
  
  
  def user_profile_image_nav
    user_profile_image_nav = UserProfileImage.where("user_id = ?", current_user.id).first     
  end

  
  def current_user_account_type
      account_type = ""
      case current_user.account_type.to_s  
        when "1"
          account_type = "Student"          
        when "2"
          account_type = "Teacher"          
        when "3"
          account_type = "Publisher"          
        when "4"
          account_type = "School"          
        when "5"
          account_type = "Recruiter"          
          # redirect_to(:controller => 'students', :action => 'index')          
        else
          account_type = ""
      end
    
    @current_user_account_type = account_type
  end

  
  
end
