class ProfileUsersController < ApplicationController

  layout 'profile'

  # force_ssl
  # before_action :already_signed_in, only: [:new]



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
    
    @publisher = Publisher.where("user_id = ?", id).first
    # @publisher = publishers[0]
    @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", @publisher.id)     
    
    @user_profile_images = UserProfileImage.where("user_id = ?", id)    
    
    if @user.nil?
      redirect_to :action => 'new'
    end    

     
  end



end
