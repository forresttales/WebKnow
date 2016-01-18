class PublisherSettingsController < ApplicationController
  
  layout 'publisher'

  # before_filter :force_http

    
  def index
    publisher = Publisher.where("user_id = ?", current_user.id).first
    @publisher_id = publisher.id
    
    @publisher_settings = PublisherSetting.where("publisher_id = ?", publisher.id)       
  end
  

  private

    def publisher_settings_params
      params.require(:publisher_settings).permit(      
                                                  :publisher_id, 
                                                  :background
                                                )
                                        
    end

  
  
end
