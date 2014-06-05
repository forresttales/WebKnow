class PublisherProductLogosController < ApplicationController

  layout 'publisher'

  @@publisher_product_id = nil
  
  before_filter :force_http

    
  
  def index
    
    @@publisher_product_id = params[:id]

    @publisher_product_logos = PublisherProductLogo.where("publisher_product_id = ?", @@publisher_product_id)
    
    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_name = publisher_product.name_product
    @publisher_product_has_product_logo = publisher_product.has_product_logo
    @publisher_product_id = @@publisher_product_id

    logos_count = @publisher_product_logos.count
    gon.logos_count = logos_count
    
    if logos_count > 0
      gon.image_name = publisher_product.product_logo
    else
      gon.image_name = ''
    end
    
    
    
  end

  
  def new
    
  end


  def upload

    uploaded_io = params[:upload_file]

    File.open(Rails.root.join('public', 'images_publisher_product_logo', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    publisher_product_logo = PublisherProductLogo.new
    publisher_product_logo.image_name = uploaded_io.original_filename
    publisher_product_logo.publisher_id = session[:publisher_id]
    publisher_product_logo.publisher_product_id = @@publisher_product_id
    
    publisher_product = PublisherProduct.find( @@publisher_product_id )

    h_update = Hash.new
    # h_update = { :product_logo => '', :has_product_logo => false }
    h_update['product_logo'] = uploaded_io.original_filename
    h_update['has_product_logo'] = true

    if publisher_product.update_columns( h_update )
      publisher_product = nil          
      if publisher_product_logo.save
          # session[:publisher_image_upload_status] = true
          redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s
      else
          session[:publisher_product_logo_upload_status] = false
          render 'create'        
      end    
    else
      render text: 'Upadate Publisher Product with has_product_logo failed'      
    end    
    
  end


  def create
    
    @publisher_image = Publisher.new(publisher_image_params)
    if @publisher_image.save
        
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
     
    publisher_product_logo = PublisherProductLogo.find(params[:id])
    if publisher_product_logo.delete
      
        File.delete(Rails.root.join('public', 'images_publisher_product_logo', publisher_product_logo.image_name))
        # File.delete(Rails.root + '/foo.jpg')
        redirect_to action: "index"
              
    else
      render text: 'delete failed'
    end
     
  end



  private

    def publisher_image_params
      params.require(:publisher_image).permit(      
                                              :publisher_id,
                                              :publisher_product_id, 
                                              :image_name 
                                              )
                                        
    end

  
  

end
