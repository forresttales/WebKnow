class PublisherProfileImagesController < ApplicationController
  
  layout 'publisher'

  before_filter :force_http


  @@publisher_id = nil
  
  
  def index
    # render text: session[:publisher_id]
    @publisher_id = session[:publisher_id]
    @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", session[:publisher_id])    
    # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ? AND primary = ?", session[:publisher_id], true)    
  end
  
  
  def new
    
    @@publisher_id = params[:publisher_id]
    @publisher_profile_image = PublisherProfileImage.new

  end



  def create
    
    # @publisher_profile_image = PublisherProfileImage.new(params[:painting])
    @publisher_profile_image = PublisherProfileImage.new(publisher_profile_image_params)
    @publisher_profile_image.publisher_id = @@publisher_id
    
    if @publisher_profile_image.save
      
      redirect_to '/PublisherProfilePhotos'
      #flash[:notice] = "Successfully created painting."
      # redirect_to @painting.gallery
    else
      render :action => 'new'
    end
    
    
  end



  def edit
    # render text: 'edit publisher_profile_image'
    # @painting = Painting.find(params[:id])
  end



  def update
    
    # render text: 'update publisher_profile_image'
    
    # @painting = Painting.find(params[:id])
    # if @painting.update_attributes(params[:painting])
      # flash[:notice] = "Successfully updated painting."
      # redirect_to @painting.gallery
    # else
      # render :action => 'edit'
    # end
  end



  def destroy
    
    @publisher_profile_image = PublisherProfileImage.find(params[:id])
    if @publisher_profile_image.destroy
      redirect_to '/PublisherProfilePhotos'
    else      
      render text: 'publisher_profile_image destory failed'
    end
    
  end
  
  
  
  def dbdelete

      PublisherProfileImage.dbdelete
      PublisherProfileImage.dbclear

  end
  
  

  private

    def publisher_profile_image_params
      params.require(:publisher_profile_image).permit(      
                                                      :user_id,
                                                      :publisher_id,
                                                      :image,
                                                      :image_name,
                                                      :primary,
                                                      :order,
                                                      :created_at,
                                                      :updated_at 
                                                     )
                                        
    end

  
  


  
end
