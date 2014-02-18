class PublisherProfilesController < ApplicationController
  
  layout 'publisher'

  
  def index
    @publisher_profiles = PublisherProfile.where("publisher_id = ?", session[:publisher_id])       
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
