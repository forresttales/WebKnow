class InstituteSettingsController < ApplicationController

  layout 'institute'

  # before_filter :force_http

  
  def index
    @institute_settings = InstituteSetting.where("institute_id = ?", session[:institute_id])       
  end
  

  private

    def institute__settings_params
      params.require(:institute_settings).permit(      
                                                :institute_id, 
                                                :background
                                              )
                                        
    end

end
