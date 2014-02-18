class PublisherProductsController < ApplicationController
  
  layout 'publisher'

  require 'csv'
  
  helper_method :sort_column, :sort_direction

  
  def index
    
    @publisher_products = PublisherProduct.where("publisher_id = ?", session[:publisher_id]).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
    
  end
  
  def new
    
    if !(session[:username].nil? or session[:publisher_id].nil?)
      # @username = session[:username]
      @publisher_product = PublisherProduct.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create
    publisher_product = PublisherProduct.new(publisher_product_params)
    publisher_product.publisher_id = session[:publisher_id]
    # user = User.find(session[:user_id])

    #if user.update_columns( :has_account => true, :account_type => "publisher")      
      if publisher_product.save
        
        # session[:has_account] = true
        
        redirect_to(:action => 'index')
      else
        render text: 'save publisher failed'
        #render("new")
      end
    #else
    #  render text: 'update user_id failed'
    #end
    
  end


  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy

    publisher_product = PublisherProduct.find(params[:id])
    
    # render text: publisher_product.publisher_id.to_s
    
    publisher_product_descriptions = PublisherProductDescription.where("publisher_product_id = ?", publisher_product.id)
    
    # store = Store.find(params[:id])
    if publisher_product.delete

      if publisher_product_descriptions[0].delete
        # @@delete = true
        redirect_to '/PublisherProducts'
      else 
        render text: 'Publisher Product Description Delete failed'
      end
      
    else
      render text: 'Publisher Product Delete failed'
    end
     
  end


  # def dbdelete
      # Store.dbdelete
      # redirect_to action: "index"
      # # render text: 'dbdelete'
  # end
  
  # def dbclear
      # Store.dbclear
      # redirect_to action: "index"
      # # render text: 'dbclear'
  # end
  
  # def export
     
    # @stores = @@stores
   
    # respond_to do |format|
      # format.html
      # format.csv
       # #format.js
    # end
     
  # end


  private

    def publisher_product_params
      params.require(:publisher_product).permit(      
                                                :publisher_id, 
                                                :name_product,
                                                :product_logo,
                                                :has_product_logo,
                                                :product_metadata,
                                                :has_product_metadata                                                
                                              )
                                        
    end

    def sort_column
      PublisherProduct.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  
  
end
