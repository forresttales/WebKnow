class PostPublishersController < ApplicationController

  # before_action :signed_in_user, only: [:create, :destroy]
  # before_action :correct_user, only: :destroy


  def create
    @post_publisher = current_user.publisher.post_publishers.build(post_publisher_params)
    if @post_publisher.save
    else
      @feed_items = []
    end
  end
  
  def destroy
    @post_publisher.destroy
  end

  private

    def post_publisher_params
      params.require(:post_publisher).permit(:content)
    end
  
    # def correct_user
      # @micropost = current_user.microposts.find_by(id: params[:id])
      # redirect_to root_url if @micropost.nil?
    # end




end
