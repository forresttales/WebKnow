class PostUsersController < ApplicationController
  
  # before_action :signed_in_user, only: [:create, :destroy]
  # before_action :correct_user, only: :destroy


  def create
    #flash[:success] = "#{current_user.id}"

    # @micropost = current_user.microposts.build(micropost_params)
    @post_user = current_user.post_users.build(post_user_params)
    # if @micropost.save
    if @post_user.save
      # flash[:success] = "Micropost created!"
      # redirect_to root_url
    else
      @feed_items = []
      # render 'static_pages/home'
    end
  end
  
  def destroy
    # @micropost.destroy
    @post_user.destroy
    # redirect_to root_url
  end

  private

    # def micropost_params
    def post_user_params
      #params.require(:micropost).permit(:content)      
      params.require(:post_user).permit(:content)
    end
  
    # def correct_user
      # @micropost = current_user.microposts.find_by(id: params[:id])
      # redirect_to root_url if @micropost.nil?
    # end



end
