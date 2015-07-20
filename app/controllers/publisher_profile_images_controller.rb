class PublisherProfileImagesController < ApplicationController
  
  #require 'RMagick'
  
  layout 'publisher'

  # before_filter :force_http


  @@publisher_id = nil
  
  
  def index
    
    @publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    @publisher_id = @publisher_user.publisher_id
    publisher = Publisher.find_by_id(@publisher_id)
    
    
    # publisher = Publisher.where(["user_id = ?", current_user.id]).first
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

    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
# 
    # img = PublisherUserImage.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:profile_600_600))[0]
# 
    # x = x.to_i
    # y = y.to_i
    # w = w.to_i
    # h = h.to_i
    # image_new = image.crop(x, y, w, h)
# 
    # new_profile_200_200 = image_new.resize_to_fill(200, 200)    
    # new_profile_100_100 = image_new.resize_to_fill(100, 100)    
    # new_profile_50_50 = image_new.resize_to_fill(50, 50)
    # new_profile_34_34 = image_new.resize_to_fill(34, 34)
#     
    # profile_200_200 = Magick::Image.read("public" + img.image_url(:profile_200_200))[0]
    # profile_100_100 = Magick::Image.read("public" + img.image_url(:profile_100_100))[0]
    # profile_50_50 = Magick::Image.read("public" + img.image_url(:profile_50_50))[0]
    # profile_34_34 = Magick::Image.read("public" + img.image_url(:profile_34_34))[0]
# 
    # # public/uploads/publisher_user_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
# 
    # profile_200_200_filename = profile_200_200.filename
    # profile_100_100_filename = profile_100_100.filename
    # profile_50_50_filename = profile_50_50.filename
    # profile_34_34_filename = profile_34_34.filename
# 
    # FileUtils.rm_rf(Dir.glob(profile_200_200.filename))
    # FileUtils.rm_rf(Dir.glob(profile_100_100.filename))
    # FileUtils.rm_rf(Dir.glob(profile_50_50.filename))
    # FileUtils.rm_rf(Dir.glob(profile_34_34.filename))
# 
    # new_profile_200_200.write profile_200_200_filename    
    # new_profile_100_100.write profile_100_100_filename
    # new_profile_50_50.write profile_50_50_filename
    # new_profile_34_34.write profile_34_34_filename
#      
    # # image.recreate_versions!
# 
    # redirect_to '/Publisher-Photos'    
    
  end
  
  
  
  # def crop_commit
    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
    # img = PublisherProfileImage.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:profile_600_600))[0]
    # x = x.to_i
    # y = y.to_i
    # w = w.to_i
    # h = h.to_i
    # image_new = image.crop(x, y, w, h)
    # profile_200_200 = image_new.resize_to_fill(200, 200)    
    # profile_100_100 = image_new.resize_to_fill(100, 100)    
    # profile_50_50 = image_new.resize_to_fill(50, 50)
    # profile_34_34 = image_new.resize_to_fill(34, 34)
    # image_200_200 = Magick::Image.read("public" + img.image_url(:image_200_200))[0]
    # image_100_100 = Magick::Image.read("public" + img.image_url(:image_100_100))[0]
    # image_50_50 = Magick::Image.read("public" + img.image_url(:image_50_50))[0]
    # image_34_34 = Magick::Image.read("public" + img.image_url(:image_34_34))[0]
    # image_200_200_filename = image_200_200.filename
    # image_100_100_filename = image_100_100.filename
    # image_50_50_filename = image_50_50.filename
    # image_34_34_filename = image_34_34.filename
    # FileUtils.rm_rf(Dir.glob(image_200_200.filename))
    # FileUtils.rm_rf(Dir.glob(image_100_100.filename))
    # FileUtils.rm_rf(Dir.glob(image_50_50.filename))
    # FileUtils.rm_rf(Dir.glob(image_34_34.filename))
    # image_200_200.write image_200_200_filename
    # image_100_100.write image_100_100_filename
    # image_50_50.write image_50_50_filename
    # image_34_34.write image_34_34_filename
    # # # image.recreate_versions!
    # # image_100_100 = nil    
    # # image_50_50 = nil
    # # image_34_34 = nil
    # # profile_100_100 = nil
    # # profile_50_50 = nil
    # # profile_34_34 = nil
# # 
    # redirect_to '/Publisher-Photos'    
  # end
  

  private

    def publisher_profile_image_params
      params.require(:publisher_profile_image).permit(      
                                                      :user_id,
                                                      :publisher_id,
                                                      :image,
                                                      :primary,
                                                      :order,
                                                      :crop_x,
                                                      :crop_y,
                                                      :crop_w,
                                                      :crop_h,
                                                      :created_at,
                                                      :updated_at 
                                                     )
                                        
    end

  
  


  
end
