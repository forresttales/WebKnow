class PublisherPostersController < ApplicationController
  
  layout 'publisher_poster'

  # require 'csv'
  respond_to :html, :js, :json  
  
  helper_method :sort_column, :sort_direction

  before_filter :force_http


  
  def index
    
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    @publisher_id = publisher.id
    @publisher_posters = PublisherPoster.where("publisher_id = ?", @publisher_id).paginate(page: params[:page])
    
    respond_to do |format|
      format.html
      # format.csv
      format.js
    end


  end  



  def dbdelete

      PublisherPoster.dbdelete
      PublisherPoster.dbclear

      # PublisherJournalposterDescription.dbdelete      
      # PublisherJournalposterDescription.dbclear
      
      # PublisherJournalposterImage.dbdelete
      # PublisherJournalposterImage.dbclear

      # PublisherJournalposterLogo.dbdelete
      # PublisherJournalposterLogo.dbclear

      # PublisherJournalposterProdshot.dbdelete
      # PublisherJournalposterProdshot.dbclear

      # PublisherJournalposterPurchase.dbdelete
      # PublisherJournalposterPurchase.dbclear
      
      respond_to do |format|
        format.js { redirect_to(:action => 'index', :form => :js ) }
        format.html
      end
      
  end


  
end
