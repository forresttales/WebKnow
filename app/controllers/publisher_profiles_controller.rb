class PublisherProfilesController < ApplicationController
  
  layout 'publisher'

  before_filter :force_http

    
  def index

    # @publisher_profiles = PublisherProfile.where("publisher_id = ?", session[:publisher_id])    
    @user = User.find(session[:user_id])    

    # @publisher_profile = nil
    # if @publisher_profiles.any?
      # @publisher_profile = @publisher_profiles[0]
    # end    
    # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", session[:publisher_id])
  end
  

  private

    def publisher__profiles_params
      params.require(:publisher_profiles).permit(      
                                                :publisher_id, 
                                                :name_logo,
                                                :has_logo
                                              )
                                        
    end

  
  
  
end
