module SessionsHelper
    
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
    
    
    session[:username] = user.username
    session[:user_id] = user.id
    session[:signed_in] = true

    if user.has_account    
      session[:has_account] = user.has_account
      session[:account_type] = user.account_type    
      
      account_type = session[:account_type] 
      case account_type  
        when "institute"
          session[:profile] = "/Institutes"          
        when "publisher"
          session[:profile] = "/Publishers"          
        when "recruiter"
          # session[:profile] = "/Recruiters"          
          redirect_to(:controller => 'recruiters', :action => 'index')          
        when "teacher"
          # session[:profile] = "/Teachers"          
          redirect_to(:controller => 'teachers', :action => 'index')          
        when "student"
          # session[:profile] = "/Students"                      
          redirect_to(:controller => 'students', :action => 'index')          
        else
          #        
      end
      
      # session[:profile] = "/" + user.account_type + "s/home"
    else
      session[:profile] = "users/show"      
    end

    
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

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in"
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

    controller_action = ":controller => 'users', :action => 'show'"
    
    if session[:has_account]

      account_type = session[:account_type] 

      case account_type  
        when "institute"
          redirect_to '/Institutes'          
        when "publisher"
          redirect_to '/Publishers'          
          # redirect_to(:controller => 'publishers', :action => 'index')          
        when "recruiter"
          redirect_to(:controller => 'recruiters', :action => 'index')          
        when "teacher"
          redirect_to(:controller => 'teachers', :action => 'index')          
        when "student"
          redirect_to(:controller => 'students', :action => 'index')          
        else
          #        
      end
       
    else
      redirect_to(:controller => 'users', :action => 'show')      
    end
    
    
  end

  def store_location
    session[:return_to] = request.url
  end  
end
