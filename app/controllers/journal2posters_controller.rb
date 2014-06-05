class Journal2postersController < ApplicationController
  
  layout 'journalposter'

  before_filter :force_http


  def index
    
    gon.selected = 2
    
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

      Journal2poster.dbdelete
      Journal2poster.dbclear

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

    def journal2poster_params
      params.require(:journal2poster).permit(      
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
