class RelatePublisherFollowsController < ApplicationController
  
  respond_to :html, :js, :json  
  # before_action :signed_in_user

  def create
    @user = User.find(params[:relate_follow][:followed_id])
    current_user.publisher.follow!(@user)
  end


  def destroy
    # @user = Relationship.find(params[:id]).followed
    @user = RelatePublisherFollow.find(params[:id]).followed
    current_user.publisher.unfollow!(@user)
  end

  
end
