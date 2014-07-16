class PublisherProductsController < ApplicationController
  
  layout 'publisher_product'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction

  before_filter :force_http

  skip_before_filter :verify_authenticity_token
    
  
  def index

    # ar = Array.new
    # c = ActiveRecord::Base.connection
    # c.tables.collect do |t|  
      # columns = c.columns(t).collect(&:name).select {|x| x.ends_with?("_id" || x.ends_with("_type"))}
      # indexed_columns = c.indexes(t).collect(&:columns).flatten.uniq
      # unindexed = columns - indexed_columns
      # unless unindexed.empty?
        # ar.push("#{t}: #{unindexed.join(", ")}")
      # end
    # end
    # render text: ar

    # publisher = Publisher.where(["user_id = ?", current_user.id]).first
    # @publisher_id = publisher.id
    @publisher_id = current_user.publisher.id
    
    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).order(sort_column + " " + sort_direction) # .paginate(:per_page => 200, :page => params[:page])
    # @publisher_product_images = PublisherProductImage.where("publisher_product_id = ?", @publisher_product.id)
    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).paginate(:per_page => 6, page: params[:page])

    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).paginate(page: params[:page])
    @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
    
    
    
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

    # respond_to do |format|
      # format.html
      # # format.js { redirect_to(:action => 'index', :form => :js ) }
      # format.js
    # end


    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    h_new = Hash.new
    h_new[:publisher_id] = publisher.id
    publisher_product = PublisherProduct.new(h_new)
    # publisher_product.publisher_id = publisher.id
    # user = User.find(session[:user_id])
    #if user.update_columns( :has_account => true, :account_type => "publisher")      
    if publisher_product.save
        h_new[:publisher_product_id] = publisher_product.id
        publisher_product_description = PublisherProductDescription.new(h_new)
        if publisher_product_description.save
            h_new[:publisher_product_description_id] = publisher_product_description.id
            publisher_product_appropriate_age = PublisherProductAppropriateAge.new(h_new)
            if publisher_product_appropriate_age.save
                # redirect_to :action => 'index'
                # @publisher_products = current_user.publisher.publisher_products.paginate(page: params[:page])
                @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
                respond_to do |format|
                  format.html
                  # format.js { redirect_to(:action => 'index', :form => :js ) }
                  format.js
                end
              # redirect_to(:controller => 'publisher_product_descriptions', 
                          # :action => 'show_description', 
                          # :method => :post,
                          # :params => { :publisher_product_id => publisher_product.id })
                          
                          # :params => {:publisher_id => publisher.id, 
                                      # :publisher_product_id => publisher_product.id,
                                      # :publisher_product_description_id => publisher_product_description.id
                                     # })

            else
              render text: 'save publisher_product_appropriate_age failed'
            end
        else
          render text: 'save publisher_product_description failed'
        end
    else
      render text: 'save publisher_product failed'
      #render("new")
    end
      
    
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

      PublisherProductAppropriateAge.dbdelete
      PublisherProductAppropriateAge.dbclear

      PublisherProductCoreLiteracyStandard.dbdelete
      PublisherProductCoreLiteracyStandard.dbclear

      PublisherProductCoreMathStandard.dbdelete
      PublisherProductCoreMathStandard.dbclear
      
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
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
  
  
  
end
