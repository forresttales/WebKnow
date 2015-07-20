class PublisherAdminSettingsController < ApplicationController


  layout 'publisher'

  # before_filter :force_http

    
  def index
    publisher = Publisher.where("user_id = ?", current_user.id).first
    @publisher_id = publisher.id
    
    @publisher_admin_settings = PublisherAdminSetting.where("publisher_id = ?", publisher.id)       
  end
  

  private

    def publisher_admin_settings_params
      params.require(:publisher_admin_settings).permit(
                                                        :user_id,      
                                                        :publisher_id, 
                                                        :background
                                                      )
                                        
    end



end
