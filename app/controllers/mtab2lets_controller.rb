class Mtab2letsController < ApplicationController

  respond_to :html, :js, :json  

  layout 'publisher'
  
  # helper_method :sort_column, :sort_direction
  
  
  def index

    @publishers = Publisher.paginate(page: params[:page])    
    # @admin_contacts = Contact.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])

    respond_to do |format|
      format.html
      format.js
    end
        
  end

  
  
  # private

  
    # def sort_column
      # Mtab2let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    # end
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    # end


end
