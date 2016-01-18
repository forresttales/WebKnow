class PublisherUserLogoImagesController < ApplicationController

  #require 'RMagick'
  
  # before_filter :force_http




  def crop
    # render text: params[:id]
    @publisher_user_logo_image = PublisherUserLogoImage.find(params[:id])
    # @profile_image = PublisherUserLogoImage.find(1)
    # @publisher_user_logo_image.crop_image
    # redirect_to '/MemberProfilePhotos'    
    # @publisher_user_logo_images = PublisherUserLogoImage.where("user_id = ?", current_user.id)    
    # @publisher_user_logo_image = @publisher_user_logo_images[0] 
  end

  
  
  def crop_commit
    
    # # render text: params[:image_id]
#     
    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
# 
    # img = PublisherUserLogoImage.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
#     
    # # render text: image.filename
# 
    # x = x.to_i
    # y = y.to_i
    # w = w.to_i
    # h = h.to_i
    # image_new = image.crop(x, y, w, h)
# 
    # new_user_200_200 = image_new.resize_to_fill(200, 200)    
    # new_user_100_100 = image_new.resize_to_fill(100, 100)    
    # # new_user_50_50 = image_new.resize_to_fill(50, 50)
    # # new_user_34_34 = image_new.resize_to_fill(34, 34)
#     
    # user_200_200 = Magick::Image.read("public" + img.image_url(:user_200_200))[0]
    # user_100_100 = Magick::Image.read("public" + img.image_url(:user_100_100))[0]
    # # user_50_50 = Magick::Image.read("public" + img.image_url(:user_50_50))[0]
    # # user_34_34 = Magick::Image.read("public" + img.image_url(:user_34_34))[0]
# 
    # # public/uploads/publisher_user_logo_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
# 
    # user_200_200_filename = user_200_200.filename
    # user_100_100_filename = user_100_100.filename
    # # user_50_50_filename = user_50_50.filename
    # # user_34_34_filename = user_34_34.filename
# 
    # FileUtils.rm_rf(Dir.glob(user_200_200.filename))
    # FileUtils.rm_rf(Dir.glob(user_100_100.filename))
    # # FileUtils.rm_rf(Dir.glob(user_50_50.filename))
    # # FileUtils.rm_rf(Dir.glob(user_34_34.filename))
#     
    # new_user_200_200.write user_200_200_filename
    # new_user_100_100.write user_100_100_filename
    # # new_user_50_50.write user_50_50_filename
    # # new_user_34_34.write user_34_34_filename
#      
    # # # image.recreate_versions!
    # # image_100_100 = nil    
    # # image_50_50 = nil
    # # image_34_34 = nil
    # # profile_100_100 = nil
    # # profile_50_50 = nil
    # # profile_34_34 = nil
# 
    # # redirect_to '/Publisher-Admin'    
    
  end


  
end

  # def index
    # @publisher_user_logo_images = PublisherUserLogoImage.where("user_id = ?", current_user.id)    
  # end

  # def show
    # @publisher_user_logo_image = PublisherUserLogoImage.find(params[:id])
  # end
  
  # def new
    # @publisher_user_logo_image = PublisherUserLogoImage.new
  # end

  # def create
    # @publisher_user_logo_image = PublisherUserLogoImage.new(publisher_user_logo_image_params)
    # @publisher_user_logo_image.user_id = current_user.id
    # if @publisher_user_logo_image.save
      # # if params[:publisher_user_logo_image][:image].present?
        # # render :crop
      # # else
        # # # redirect_to @user, notice: "Successfully created user."
      # # end
      # redirect_to '/Photos'
      # #flash[:notice] = "Successfully created painting."
      # # redirect_to @painting.gallery
    # else
      # render :action => 'new'
    # end
  # end

  # def edit
    # @publisher_user_logo_image = PublisherUserLogoImage.find(params[:id])
  # end

  # def update
    # @publisher_user_logo_image = PublisherUserLogoImage.new(publisher_user_logo_image_params)
    # @publisher_user_logo_image.user_id = current_user.id
    # # @user = User.find(params[:id])
    # # if @user.update_attributes(params[:user])
    # if @publisher_user_logo_image.update_attributes(publisher_user_logo_image_params)
      # # if params[:user][:avatar].present?
      # if params[:publisher_user_logo_image][:image].present?
        # render :crop
      # else
        # # redirect_to @user, notice: "Successfully updated user."
      # end
    # else
      # # render :new
    # end
  # end

  # def rmagick
    # images_path = "public/sample_images"
    # file_name = "rmagick_generated_thumb.jpg"
    # file_path = images_path + "/"+ file_name
    # File.delete file_path if File.exists? file_path
    # img = Magick::Image.read("lib/sample_images/magic.jpg").first
    # thumb = img.scale(0.25)
    # @path = file_name
    # thumb.write file_path
  # end

  # def cropped_image(params)
      # image = MiniMagick::Image.open(self.image.path)
      # crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"
      # image.crop(crop_params)
      # image
  # end
  
  # def destroy
    # @publisher_user_logo_image = PublisherUserLogoImage.find(params[:id])
    # if @publisher_user_logo_image.destroy
      # redirect_to '/MemberProfilePhotos'
    # else      
      # render text: 'publisher_user_logo_image destory failed'
    # end
  # end
  
  # def dbdelete
      # PublisherUserLogoImage.dbdelete
      # PublisherUserLogoImage.dbclear
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/MemberProfilePhotos') }
      # end
  # end
  
  # private
    # def publisher_user_logo_image_params
      # params.require(:publisher_user_logo_image).permit(      
                                                        # :user_id,
                                                        # :publisher_id,
                                                        # :publisher_user_id,
                                                        # :image,
                                                        # :image_name,
                                                        # :primary,
                                                        # :order,
                                                        # :crop_x,
                                                        # :crop_y,
                                                        # :crop_w,
                                                        # :crop_h
                                                       # )
    # end
