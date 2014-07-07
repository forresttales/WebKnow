class PublisherProfileImagesController < ApplicationController
  
  require 'RMagick'
  
  layout 'publisher'

  before_filter :force_http


  @@publisher_id = nil
  
  
  def index
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    @publisher_id = publisher.id
    
    @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", @publisher_id)    
    # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ? AND primary = ?", session[:publisher_id], true)    
  end
  
  
  def new
    
    # render text: params[:publisher_id]
    @publisher_id = params[:publisher_id]
    @publisher_profile_image = PublisherProfileImage.new

  end



  def create
    
    @publisher_profile_image = PublisherProfileImage.new(publisher_profile_image_params)
    @publisher_profile_image.publisher_id = params[:publisher_profile_image][:publisher_id]
    @publisher_profile_image.user_id = current_user.id
    
    if @publisher_profile_image.save
      
      redirect_to '/Publisher-Photos'
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
      redirect_to '/Publisher-Photos'
    else      
      render text: 'publisher_profile_image destory failed'
    end
    
  end
  
  
  
  def dbdelete

    #render text: 'dbdelete publisher_profile_images'
    PublisherProfileImage.dbdelete
    PublisherProfileImage.dbclear
    
    redirect_to '/Publisher-Photos'

  end
  
  
  
  def crop
    
    # render text: params[:id]
    @publisher_profile_image = PublisherProfileImage.find(params[:id])
    
    # @profile_image = UserProfileImage.find(1)
    
    # @user_profile_image.crop_image
    # redirect_to '/MemberProfilePhotos'    
    
    # @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)    
    # @user_profile_image = @user_profile_images[0] 
  end
  
  
  def crop_commit
    
    
    # render text: params[:image_id]
    
    x = params[:crop_x]
    y = params[:crop_y]
    w = params[:crop_w]
    h = params[:crop_h]

    img = PublisherProfileImage.find(params[:image_id])
    image = Magick::Image.read("public" + img.image_url(:image_500_500))[0]
    
    # render text: image.filename

    x = x.to_i
    y = y.to_i
    w = w.to_i
    h = h.to_i
    image_new = image.crop(x, y, w, h)

    image_200_200 = image_new.resize_to_fill(200, 200)    
    image_100_100 = image_new.resize_to_fill(100, 100)    
    image_50_50 = image_new.resize_to_fill(50, 50)
    image_34_34 = image_new.resize_to_fill(34, 34)
    
    image_200_200 = Magick::Image.read("public" + img.image_url(:image_200_200))[0]
    image_100_100 = Magick::Image.read("public" + img.image_url(:image_100_100))[0]
    image_50_50 = Magick::Image.read("public" + img.image_url(:image_50_50))[0]
    image_34_34 = Magick::Image.read("public" + img.image_url(:image_34_34))[0]

    # public/uploads/user_image_image/image/1/image_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg

    image_200_200_filename = image_200_200.filename
    image_100_100_filename = image_100_100.filename
    image_50_50_filename = image_50_50.filename
    image_34_34_filename = image_34_34.filename

    FileUtils.rm_rf(Dir.glob(image_200_200.filename))
    FileUtils.rm_rf(Dir.glob(image_100_100.filename))
    FileUtils.rm_rf(Dir.glob(image_50_50.filename))
    FileUtils.rm_rf(Dir.glob(image_34_34.filename))
    
    image_200_200.write image_200_200_filename
    image_100_100.write image_100_100_filename
    image_50_50.write image_50_50_filename
    image_34_34.write image_34_34_filename
     
    # # image.recreate_versions!
# 
    # image_100_100 = nil    
    # image_50_50 = nil
    # image_34_34 = nil
#     
    # profile_100_100 = nil
    # profile_50_50 = nil
    # profile_34_34 = nil
# 
    redirect_to '/Publisher-Photos'    
    
  end
  

  private

    def publisher_profile_image_params
      params.require(:publisher_profile_image).permit(      
                                                      :user_id,
                                                      :publisher_id,
                                                      :image,
                                                      :primary,
                                                      :order,
                                                      :created_at,
                                                      :updated_at 
                                                     )
                                        
    end

  
  


  
end
