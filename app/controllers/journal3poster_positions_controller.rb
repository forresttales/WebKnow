class Journal3posterPositionsController < ApplicationController
  
  layout 'journalposter'

  # before_filter :force_http


  def index
  end
  
  
  def new
  end

  
  def create
  end


  def edit
  end
  
  
  def update
  end


  def dbdelete

      Journal3posterPosition.dbdelete
      Journal3posterPosition.dbclear

      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
      
  end


  def delete
  end


  def destroy
  end



  private

    def journal3poster_position_params
      params.require(:journal3poster_position).permit(      
                                                      :id_map,   
                                                      :pos_map,   
                                                      :pos_x,      
                                                      :pos_y,    
                                                      :created_at, 
                                                      :updated_at 
                                                     )
                                        
    end

  
  
end
