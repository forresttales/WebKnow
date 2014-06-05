class PublisherSettingsController < ApplicationController
  
  layout 'publisher'

  before_filter :force_http

    
  def index
    @publisher_settings = PublisherSetting.where("publisher_id = ?", session[:publisher_id])       
  end
  

  private

    def publisher__settings_params
      params.require(:publisher_settings).permit(      
                                                :publisher_id, 
                                                :background
                                              )
                                        
    end

  
  
end
