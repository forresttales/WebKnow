class InstituteProfilesController < ApplicationController

  layout 'institute'

  before_filter :force_http
  
  
  def index
    @institute_profiles = InstituteProfile.where("institute_id = ?", session[:institute_id])       
  end
  

  private

    def institute__profiles_params
      params.require(:institute_profiles).permit(      
                                                :institute_id, 
                                                :name_logo,
                                                :has_logo
                                              )
                                        
    end

end
