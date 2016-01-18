class BdYearsController < ApplicationController

  respond_to :html, :js, :json  

  layout 'bd_year'

  # before_filter :force_http

  helper_method :sort_column, :sort_direction, :yesno


  def index
    
    @bd_years = BdYear.order(sort_column + " " + sort_direction)    

  end
  
  
  def new

    @bd_year = BdYear.new
    
  end

  
  def create
    
    bd_year = BdYear.new(bd_year_params) 

    if bd_year.save
      redirect_to '/birthday-years'
    else
      # render text: 'error'
    end
        
  end



  def edit
    
    @bd_year = BdYear.find_by_id(params[:id])    

  end
  
  
  def update

    
    bd_year = BdYear.find(params[:id])
    
    if bd_year.update_attributes(params[:bd_year])
      # redirect_to '/JournalPosterPositions-1'
      redirect_to :action => 'index'
    else
      render text: ''
    end
        
  end

  
  def dbdelete

      BdYear.dbdelete
      BdYear.dbclear

      redirect_to :action => 'index'
      
  end


  def delete
  end


  def destroy
  end



  private

    def bd_year_params
      params.require(:bd_year).permit(      
                                      :year,
                                      :year_text,
                                      :year_value,
                                      :created_at, 
                                      :updated_at 
                                     )
                                        
    end


    def sort_column
      BdYear.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def yesno(x)
      x == 1 ? "Yes" : "No"
    end

end
