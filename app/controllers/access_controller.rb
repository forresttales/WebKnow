class AccessController < ApplicationController
  # weblearn
  
  layout 'access'
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index    
    # menu
    # render('menu')
  end
  
  def menu
    # display text & links
  end

  def login
  end
  
  def show
     
  end
  
  # def update
        # render text: "in attempt login"
  # end
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      render('show')
      #redirect_to(:action => 'login')
      
      #redirect_to(:action => 'login')
      #redirect_to(:controller => 'contacts', :action => 'list')
      
      
      return false # halts the before_filter
    else
      redirect_to(:controller => 'admin_users')
      return true
    end
  end
  
  def attempt_login
    
    #render text: "in attempt login"
    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      
      if authorized_user.admin
        session[:admin] = TRUE
      else
        session[:admin] = FALSE        
      end
        
      
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
    
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end
  
end
