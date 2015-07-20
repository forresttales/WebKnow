class InstituteImagesController < ApplicationController

  layout 'institute'

  # before_filter :force_http


  
  def index
    
    images = InstituteImage.where("institute_id = ?", session[:institute_id])       


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

    @institute_images = aimages_all
    
    gon.prim_index = prim_index
    gon.prim_id = prim_id
    
    gon.institute_images = @institute_images
    gon.institute_images_count = @institute_images.count
    
  end

  
  def new
    
  end


  def upload

    uploaded_io = params[:upload_file]

    File.open(Rails.root.join('public', 'images_institute', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    institute_image = InstituteImage.new
    institute_image.image_name = uploaded_io.original_filename
    institute_image.institute_id = session[:institute_id]
    
    images = InstituteImage.where("institute_id = ?", session[:institute_id])
    if images.count == 0
      institute_image.primary = true
    else
      institute_image.primary = false     
    end    
    
    if institute_image.save
        # session[:institute_image_upload_status] = true
        redirect_to action: "index"
        
    else
        session[:institute_image_upload_status] = false
        render 'create'        
    end    
    
    
  end


  def create
    
    @institute_image = Institute.new(institute_image_params)
    if @institute_image.save
        
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
     
    institute_image = InstituteImage.find(params[:id])
    if institute_image.delete
      
        File.delete(Rails.root.join('public', 'images_institute', institute_image.image_name))
        # File.delete(Rails.root + '/foo.jpg')

        redirect_to action: "index"
      
      #redirect_to 'index'
    else
      render text: 'delete failed'
    end
     
  end


  def set_primary

    institute_images = InstituteImage.where("institute_id = ?", session[:institute_id])       
 
    for i in 0..(institute_images.count - 1)
      institute_images[i].primary = false
      if institute_images[i].save
        
      else 
        render text: 'update images to false has failed'
      end
      
    end


    institute_image_updated = InstituteImage.find(params[:id])
    institute_image_updated.primary = true
    if institute_image_updated.save
      redirect_to action: "index"
    else
      render text: 'set primary failed'
    end
        
  end



  private

    def institute_image_params
      params.require(:institute_image).permit(      
                                              :institute_id, 
                                              :image_name 
                                              )
                                        
    end

  

end
