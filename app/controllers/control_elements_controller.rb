class ControlElementsController < ApplicationController

  respond_to :html, :js, :json  


  def nav_dropdowns
    render 'nav_dropdowns', :layout => 'nav_dropdown'
  end


  def sticky_footer
    render 'sticky_footer_index', :layout => 'sticky_footer'
  end


  def sticky_footer_with_icon
    render 'sticky_footer_with_icon_index', :layout => 'sticky_footer_with_icon'
  end


end
