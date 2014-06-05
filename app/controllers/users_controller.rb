class UsersController < ApplicationController

  layout 'user'

  before_action :already_signed_in, only: [:new]
  
  # before_action :signed_in_user
  
  # before_action :signed_in_user,
                # only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy
#   
  # skip_before_filter :verify_authenticity_token
  
  # before_filter :force_http



  def index
  end


  def new
    # @account_type = params[:id]
    @user = User.new
    @bd_years = BdYear.order("year_value ASC").all
  end

  
  def show
    #@user = User.find(params[:id])
    # @user = User.find(session[:user_id])    
  end

  
  def create

    user = User.new(user_params)
    
    account_type = params[:user][:account_type]
    
    case account_type
    when "0"
      user.account_type_text = "student"
    when "1"
      user.account_type_text = "teacher"
    when "2"
      user.account_type_text = "publisher"
    when "3"
      user.account_type_text = "school"
    when "4"
      user.account_type_text = "recruiter"
    else
      # 
    end
    
    
    if user.save
        sign_in user
        
        # flash[:success] = "Welcome to The Learning Counsel!"
      
        # mail = UserMailer.welcome_email(@user)
        # mail.deliver
 
        case account_type
        when "0"
          # redirect_to(:controller => 'students', :action => 'new')
        when "1"
          # redirect_to(:controller => 'teachers', :action => 'new')
        when "2"
          # redirect_to '/Publishers'
        when "3"
          # redirect_to(:controller => 'institutes', :action => 'new')
        when "4"
          # redirect_to(:controller => 'recruiters', :action => 'new')
        else
          # alert error redirect
        end
      
    else
      # flash.now[:notice] = "Password Creation Failed"
      # render 'new'
    end

    h_new = Hash.new
    h_new[:user_id] = user.id    
    publisher = Publisher.new(h_new)
    if publisher.save
        case account_type
        when "0"
          # redirect_to(:controller => 'students', :action => 'new')
        when "1"
          # redirect_to(:controller => 'teachers', :action => 'new')
        when "2"
          redirect_to '/Publishers'
        when "3"
          # redirect_to(:controller => 'institutes', :action => 'new')
        when "4"
          # redirect_to(:controller => 'recruiters', :action => 'new')
        else
          # alert error redirect
        end
        
        # flash[:success] = "Welcome to The Learning Counsel!"
    else
      # flash.now[:notice] = "Password Creation Failed"
    end
    
    # render text: user.id


  end
    
    
  def edit
  end

  
  def update
  end


  def delete
  end


  def destroy
  end

    
  def dbdelete
      User.dbdelete
      User.dbclear

      redirect_to :action => 'index'      
  end
    
    
    
    
  private

    def user_params
      params.require(:user).permit(
                                    :name_first,
                                    :name_last,
                                    :email, 
                                    :username, 
                                    :account_type, 
                                    :has_account, 
                                    :password, 
                                    :password_confirmation, 
                                    :bd_month,
                                    :bd_day,
                                    :bd_year,
                                    :gender,
                                    :account_type,
                                    :account_type_text,
                                  )
                                  
    end

    
  end