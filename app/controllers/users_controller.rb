class UsersController < ApplicationController

  require 'RMagick'

  # layout 'user'
  layout 'newland'

  before_action :already_signed_in, only: [:new]
  
  # before_action :signed_in_user
  
  # before_action :signed_in_user,
                # only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy
#   
  # skip_before_filter :verify_authenticity_token
  
  # before_filter :force_http




  def test_rmagick
    image = Magick::Image.new(110, 30){ self.background_color = 'white' }
    image.write('/tmp/test.jpg')
  end


  def index
    
    @users = User.paginate(page: params[:page])
    
  end


  def new
    # @account_type = params[:id]
    @user = User.new
    @bd_years = BdYear.order("year_value ASC").all
    # render layout: "newland"
    
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
    
    bd_month = params[:user][:bd_month]
    case bd_month
    when "1"
      user.bd_month_text = "January"
    when "2"
      user.bd_month_text = "February"
    when "3"
      user.bd_month_text = "March"
    when "4"
      user.bd_month_text = "April"
    when "5"
      user.bd_month_text = "May"
    when "6"
      user.bd_month_text = "June"
    when "7"
      user.bd_month_text = "July"
    when "8"
      user.bd_month_text = "August"
    when "9"
      user.bd_month_text = "September"
    when "10"
      user.bd_month_text = "October"
    when "11"
      user.bd_month_text = "November"
    when "12"
      user.bd_month_text = "December"
    else
      # 
    end

    gender = params[:user][:gender]
    case gender
    when "0"
      user.gender_text = "Male"
    when "1"
      user.gender_text = "Female"
    else
      # 
    end
    
    if user.save
        sign_in user
        
        # flash[:success] = "Welcome to The Learning Counsel!"
      
        # mail = UserMailer.welcome_email(@user)
        # mail.deliver
 
        # case account_type
        # when "0"
          # # redirect_to(:controller => 'students', :action => 'new')
        # when "1"
          # # redirect_to(:controller => 'teachers', :action => 'new')
        # when "2"
          # # redirect_to '/Publishers'
        # when "3"
          # # redirect_to(:controller => 'institutes', :action => 'new')
        # when "4"
          # # redirect_to(:controller => 'recruiters', :action => 'new')
        # else
          # # alert error redirect
        # end
      
    else
      # flash.now[:notice] = "Password Creation Failed"
      render 'new'
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
          redirect_to '/Publisher'
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
                                    :gender_text,
                                    :account_type,
                                    :account_type_text,
                                  )
                                  
    end

    
  end