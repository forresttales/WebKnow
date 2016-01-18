class PostUserLikesController < ApplicationController

  respond_to :html, :js, :json  


  def create
    
      h_post_user = Hash.new
      h_post_user[:post_user_id] = params[:post_user_id]
      h_post_user[:user_id] = params[:user_id]
      post_user_like = PostUserLike.new(h_post_user)
      # post_user_like = current_user.post_users.build(post_user_like_params)
      if post_user_like.save
          #
      else
          #
      end
      
  end
  
  
  def destroy

      post_user_like = PostUserLike.find(params[:id]) rescue nil
      if post_user_like.nil?
          post_user_like.destroy  
      else
          #
      end
      
  end


end
