class RelateFollowsController < ApplicationController

  
  respond_to :html, :js, :json  
  # before_action :signed_in_user

  def create
    @user = User.find(params[:relate_follow][:followed_id])
    current_user.follow!(@user)
  end


  def destroy
    # @user = Relationship.find(params[:id]).followed
    @user = RelateFollow.find(params[:id]).followed
    current_user.unfollow!(@user)
  end

  
end
