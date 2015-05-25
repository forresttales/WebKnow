class ControlElementsController < ApplicationController

  respond_to :html, :js, :json  


  def nav_dropdowns
    
    render 'nav_dropdowns', :layout => 'nav_dropdown'
        
  end


end
