class PublisherImagesController < ApplicationController
  
  layout 'publisher'

  
  def index
    
    images = PublisherImage.where("publisher_id = ?", session[:publisher_id])       


    prim_index = 0
    prim_id    = 0
    aimages = Array.new
    aimages_prim = Array.new
    aimages_all = Array.new
    
    for i in 0..(images.count - 1)
      # aimages_all.insert(0, images[i])      
      if images[i].primary
        prim_index = i
        prim_id = images[i].id
        aimages_prim.insert(0, images[i])          
      else
        aimages.insert(0, images[i])
        aimages_all.insert(0, images[i])      
      end
    end
    
    aimages_all.insert(0, aimages_prim[0])      
    
    
    
    gon.aimages_all = aimages_all

    @publisher_images = aimages_all
    
    gon.prim_index = prim_index
    gon.prim_id = prim_id
    
    gon.publisher_images = @publisher_images
    gon.publisher_images_count = @publisher_images.count
    
  end

  
  def new
    
  end


  def upload

    uploaded_io = params[:upload_file]

    File.open(Rails.root.join('public', 'images_publisher', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    publisher_image = PublisherImage.new
    publisher_image.image_name = uploaded_io.original_filename
    publisher_image.publisher_id = session[:publisher_id]
    
    images = PublisherImage.where("publisher_id = ?", session[:publisher_id])
    if images.count == 0
      publisher_image.primary = true
    else
      publisher_image.primary = false     
    end    
    
    if publisher_image.save
        # session[:publisher_image_upload_status] = true
        redirect_to action: "index"        
    else
        session[:publisher_image_upload_status] = false
        render 'create'        
    end    
    
    
  end


  def create
    
    @publisher_image = Publisher.new(publisher_image_params)
    if @publisher_image.save
        
        redirect_to action: "index"
        
    else
      render 'new'
    end
    
    
  end


  def show
    
     # render 'upload'
    
  end    


  def destroy
     
     # render text: 'destroy'
     
    publisher_image = PublisherImage.find(params[:id])
    if publisher_image.delete
      
        File.delete(Rails.root.join('public', 'images_publisher', publisher_image.image_name))
        # File.delete(Rails.root + '/foo.jpg')
        redirect_to action: "index"
              
    else
      render text: 'delete failed'
    end
     
  end


  def set_primary

    publisher_images = PublisherImage.where("publisher_id = ?", session[:publisher_id])       
 
    for i in 0..(publisher_images.count - 1)
      publisher_images[i].primary = false
      if publisher_images[i].save
        
      else 
        render text: 'update images to false has failed'
      end
      
    end


    publisher_image_updated = PublisherImage.find(params[:id])
    publisher_image_updated.primary = true
    if publisher_image_updated.save
      redirect_to action: "index"
    else
      render text: 'set primary failed'
    end
        
  end



  private

    def publisher_image_params
      params.require(:publisher_image).permit(      
                                              :publisher_id, 
                                              :image_name 
                                              )
                                        
    end

  
  
end
