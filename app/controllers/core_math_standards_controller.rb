class CoreMathStandardsController < ApplicationController

  layout 'core_math_standard'

  helper_method :sort_column, :sort_direction, :yesno



  def index
  end
  

    def sort_column
      CoreMathStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def yesno(x)
      x == 1 ? "Yes" : "No"
    end

end
