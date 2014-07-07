class Mtab1letsController < ApplicationController

  respond_to :html, :js, :json  

  layout 'publisher'
  
  # helper_method :sort_column, :sort_direction, :yesno
  
  
  def index

    # @admin_contacts = Contact.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])

    @users = User.paginate(page: params[:page])    
    # @mtab1lets = @users    

    respond_to do |format|
      format.html
      format.js
    end
        
  end


  
  # private

    # def mtab1lets_params
      # params.require(:mtab1let).permit(
                                      # )
    # end
  
    # def return_all      
      # return Mtab1let.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])
    # end
    # def sort_column
      # Mtab1let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    # end
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    # end
    # def yesno(x)
      # x == 1 ? "Yes" : "No"
    # end

end
