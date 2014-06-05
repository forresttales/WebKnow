class PublisherProductMetadatatagsController < ApplicationController
  
  layout 'publisher'

  @@publisher_product_id = nil
  
  before_filter :force_http

    
  
  def index
    
    @@publisher_product_id = params[:id]

    @publisher_product_metadatatags = PublisherProductMetadatatag.where("publisher_product_id = ?", @@publisher_product_id)
    
    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_name = publisher_product.name_product
    @publisher_product_has_product_metadata = publisher_product.has_product_metadata
    @publisher_product_id = @@publisher_product_id

    @metadatatags_count = @publisher_product_metadatatags.count
    # gon.metadatatags_count = metadatatags_count
    
    # if metadatatags_count > 0
      # gon.metadata_name = publisher_product.product_metadata
    # else
      # gon.metadata_name = ''
    # end
    
    
    
  end

  
  def new
    
  end


  def edit
    @publisher_product_metadatatag = PublisherProductMetadatatag.find_by_id(params[:id])    
    
    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_name = publisher_product.name_product
    # @publisher_product_has_description = publisher_product.has_description
    @publisher_product_id = @@publisher_product_id
    
    # @type_content = ""
    
  end
  
  def update
    
    publisher_product_metadatatag = PublisherProductMetadatatag.find(params[:id])

    if publisher_product_metadatatag.update_attributes(params[:publisher_product_metadatatag])
        redirect_to '/PublisherMetadata/' + @@publisher_product_id.to_s
    else
      render text: 'update failed'
    end    
    
    
  end



  def upload

    uploaded_io = params[:upload_file]

    # File.open(Rails.root.join('public', 'metadata_publisher_product', uploaded_io.original_filename), 'wb') do |file|
      # file.write(uploaded_io.read)
    # end

    publisher_product_metadatatag = PublisherProductMetadatatag.new
    publisher_product_metadatatag.name_metadata = uploaded_io.original_filename
    publisher_product_metadatatag.text_metadata = uploaded_io.read
    publisher_product_metadatatag.publisher_id = session[:publisher_id]
    publisher_product_metadatatag.publisher_product_id = @@publisher_product_id
    
    publisher_product = PublisherProduct.find( @@publisher_product_id )

    h_update = Hash.new
    # h_update = { :product_metadatatag => '', :has_product_metadatatag => false }
    h_update['product_metadata'] = uploaded_io.original_filename
    h_update['has_product_metadata'] = true

    if publisher_product.update_columns( h_update )
      publisher_product = nil          
      if publisher_product_metadatatag.save
          # session[:publisher_metadata_upload_status] = true
          redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s
      else
          session[:publisher_product_metadatatag_upload_status] = false
          render 'create'        
      end    
    else
      render text: 'Upadate Publisher Product with has_product_metadatatag failed'      
    end    
    
  end


  def create
    
    @publisher_product_metadatatag = Publisher.new(publisher_metadata_params)
    if @publisher_procuct_metadatatag.save
        
        redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s        
        
    else
      render 'new'
    end
    
    
  end


  def show
    
     # render 'upload'
    
  end    


  def destroy
     
     # render text: 'destroy'
     
    publisher_product_metadatatag = PublisherProductMetadatatag.find(params[:id])
    publisher_product = PublisherProduct.find( @@publisher_product_id )
    
    # publisher_product
    # :product_metadata = ''
    # :has_product_metadata = false

    # publisher_product_metadatatag
    # :name_metadata = ''
    # :text_metadata = ''
    
    h_update_publisher_product = Hash.new
    h_update_publisher_product['product_metadata'] = ''
    h_update_publisher_product['has_product_metadata'] = false
    
    # h_update_publisher_product_metadatatag = Hash.new
    # h_update_publisher_product_metadatatag['name_metadata'] = ''
    # h_update_publisher_product_metadatatag['text_metadata'] = ''
    
    if publisher_product.update_columns( h_update_publisher_product )
      h_update_publisher_product = nil          
      # if publisher_product_metadatatag.update_columns( h_update_publisher_product_metadatatag )
      if publisher_product_metadatatag.delete
          redirect_to '/PublisherMetadata/' + @@publisher_product_id.to_s
      else
        render text: 'Delete Publisher Product Metadata failed'      
      end    
    else
      render text: 'Delete Publisher Product Metadata failed'      
    end    
    
     
  end



  private

    def publisher_metadata_params
      params.require(:publisher_product_metadatatag).permit(      
                                              :publisher_id,
                                              :publisher_product_id, 
                                              :name_metadata,
                                              :text_metadata 
                                              )
                                        
    end

  
  
  
end
