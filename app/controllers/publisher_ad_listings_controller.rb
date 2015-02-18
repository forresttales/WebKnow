class PublisherAdListingsController < ApplicationController

  layout 'publisher_ad_listing'

  # require 'csv'
  respond_to :html, :js, :json  
  
  helper_method :sort_column, :sort_direction

  before_filter :force_http


  
  def index
    
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    @publisher_id = publisher.id
    @publisher_ad_listings = PublisherAdListing.where("publisher_id = ?", @publisher_id).paginate(page: params[:page])
    
    respond_to do |format|
      format.html
      # format.csv
      format.js
    end


  end  


end
