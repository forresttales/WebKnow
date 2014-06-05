class ProfilesController < ApplicationController

  layout 'profile'

  # force_ssl

  # before_action :already_signed_in, only: [:new]
  
  before_action :signed_in_user
  
  # before_action :signed_in_user,
                # only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy
#   
  # skip_before_filter :verify_authenticity_token
  
  # before_filter :force_http



  def index
    
    id = params[:id]
    # id_pre = id.slice(0..1)
    # id_pos = 0
    # if id_pre == "id"
      # id_pos = id.slice(2..3)
    # else
      # #
    # end
    
    # render text: id
    
    @user = nil
    # if id_pos != "no entry"
    @user = User.find_by_id(id)
    # else
    
    publishers = Publisher.where("user_id = ?", id)
    @publisher = publishers[0]
    @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", @publisher.id)     
    
    
    
    if @user.nil?
      redirect_to :action => 'new'
    end    
     
  end

  
  # def home

    # user = User.find_by_id(session[:user_id])
     
    # case account_type = user.account_type
    # when "institute"
      # redirect_to(:controller => 'institutes', :action => 'home')
    # when "teacher"
      # redirect_to(:controller => 'teachers', :action => 'home')
    # when "student"
      # redirect_to(:controller => 'students', :action => 'home')
    # when "publisher"
      # redirect_to(:controller => 'publishers', :action => 'home')
    # else
      # # alert error redirect
    # end
    
  # end
  
  
  def show
    # @user = User.find(session[:user_id])    
  end
  
    
    
  private

    # def user_params
      # params.require(:user).permit(
                                  # )
    # end

end
