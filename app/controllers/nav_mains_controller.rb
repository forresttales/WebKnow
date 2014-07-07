class NavMainsController < ApplicationController


  
  def nav_main
    @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)
    if @user_profile_images.any?
      @user_profile_image = user_profile_images[0]
      render :partial => "/nav_mains/nav_main", :locals => { :user_profile_image => @user_profile_image }
    else
      render text: 'nav_main nil class'
      # @user_profile_image = nil
    end
  end

  
end
