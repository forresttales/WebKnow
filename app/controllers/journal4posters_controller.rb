class Journal4postersController < ApplicationController
  
  layout 'journalposter'

  before_filter :force_http


  def index
    
    gon.selected = 4
    
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

      Journal4poster.dbdelete
      Journal4poster.dbclear

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

    def journal4poster_params
      params.require(:journal4poster).permit(      
                                              :id_user,                  
                                              :publisher_id,              
                                              :publisher_journalposter_id, 
                                              :pos_map,            
                                              :url,                       
                                              :main_sales_phone,          
                                              :created_at,                
                                              :updated_at  
                                            )
                                        
    end

  
    

end
