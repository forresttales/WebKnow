class PublisherProductsController < ApplicationController
  
  layout 'publisher_product'

  helper_method :sort_column, :sort_direction

  before_filter :force_http

    
  
  def index

    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    @publisher_id = publisher.id
    
    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).order(sort_column + " " + sort_direction) # .paginate(:per_page => 200, :page => params[:page])
    # @publisher_product_images = PublisherProductImage.where("publisher_product_id = ?", @publisher_product.id)
    
    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).paginate(:per_page => 6, page: params[:page])
    @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).paginate(page: params[:page])
    
    
    
  end
  
  
  def new
    
    # if !(session[:username].nil? or session[:publisher_id].nil?)
      # # @username = session[:username]
      @publisher_product = PublisherProduct.new
    # else
      # render text: 'failed sessions'
    # end
    
  end

  
  def create
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    h_product = Hash.new
    h_product[:publisher_id] = publisher.id
    publisher_product = PublisherProduct.new(h_product)

    # publisher_product.publisher_id = publisher.id
    # user = User.find(session[:user_id])

    #if user.update_columns( :has_account => true, :account_type => "publisher")      
      if publisher_product.save
        h_description = Hash.new
        h_description[:publisher_id] = publisher.id
        h_description[:publisher_product_id] = publisher_product.id
        publisher_product_description = PublisherProductDescription.new(h_description)
        if publisher_product_description.save

          redirect_to(:controller => 'publisher_product_descriptions', 
                      :action => 'index', 
                      :params => {:publisher_id => publisher.id, 
                                  :publisher_product_id => publisher_product.id,
                                  :publisher_product_description_id => publisher_product_description.id
                                 })

          # h_image = Hash.new
          # h_image[:publisher_id] = publisher.id
          # h_image[:publisher_product_id] = publisher_product.id
          # publisher_product_image = PublisherProductImage.new(h_image)
          # if publisher_product_image.save
            # redirect_to(:controller => 'publisher_product_descriptions', 
                        # :action => 'index', 
                        # :params => {:publisher_id => publisher.id, 
                                    # :publisher_product_id => publisher_product.id,
                                    # :publisher_product_description_id => publisher_product_description.id,
                                    # :publisher_product_image_id => publisher_product_image.id })        
          # else
            # render text: 'save publisher_product_image failed'
          # end
        else
          render text: 'save publisher_product_description failed'
        end
                  
        # session[:has_account] = true
        # redirect_to(:action => 'index')


      else
        render text: 'save publisher_product failed'
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



  def dbdelete

      PublisherProduct.dbdelete
      PublisherProduct.dbclear

      PublisherProductDescription.dbdelete
      PublisherProductDescription.dbclear

      PublisherProductImage.dbdelete
      PublisherProductImage.dbclear

      PublisherProductLogo.dbdelete
      PublisherProductLogo.dbclear
      
      redirect_to '/Publisher-Products'
            
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end

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
