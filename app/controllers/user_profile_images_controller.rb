class UserProfileImagesController < ApplicationController
  
  #require 'RMagick'
  
  layout 'user_profile_image'
  # layout 'publisher'

  # before_filter :force_http



  def index
    @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)    
  end
  

  def show
    @user_profile_image = UserProfileImage.find(params[:id])
  end

  
  def new
    @user_profile_image = UserProfileImage.new
  end


  def create
    
    @user_profile_image = UserProfileImage.new(user_profile_image_params)
    @user_profile_image.user_id = current_user.id

    if @user_profile_image.save
      # if params[:user_profile_image][:image].present?
        # render :crop
      # else
        # # redirect_to @user, notice: "Successfully created user."
      # end
      redirect_to '/Photos'
      #flash[:notice] = "Successfully created painting."
      # redirect_to @painting.gallery
    else
      render :action => 'new'
    end
      
    
    
  end


  def edit
    @user_profile_image = UserProfileImage.find(params[:id])
  end


  def update
    
    @user_profile_image = UserProfileImage.new(user_profile_image_params)
    @user_profile_image.user_id = current_user.id
    
    # @user = User.find(params[:id])
    # if @user.update_attributes(params[:user])
    if @user_profile_image.update_attributes(user_profile_image_params)
      # if params[:user][:avatar].present?
      if params[:user_profile_image][:image].present?
        render :crop
      else
        # redirect_to @user, notice: "Successfully updated user."
      end
    else
      # render :new
    end
  end



  def crop
    
    # render text: params[:id]
    @user_profile_image = UserProfileImage.find(params[:id])
    
    # @profile_image = UserProfileImage.find(1)
    
    # @user_profile_image.crop_image
    # redirect_to '/MemberProfilePhotos'    
    
    # @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)    
    # @user_profile_image = @user_profile_images[0] 
  end
  
  
  def crop_commit
    
    
    # # render text: params[:image_id]
#     
    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
# 
    # img = UserProfileImage.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:profile_600_600))[0]
#     
    # # render text: image.filename
# 
    # x = x.to_i
    # y = y.to_i
    # w = w.to_i
    # h = h.to_i
    # image_new = image.crop(x, y, w, h)
# 
    # image_100_100 = image_new.resize_to_fill(100, 100)    
    # image_50_50 = image_new.resize_to_fill(50, 50)
    # image_34_34 = image_new.resize_to_fill(34, 34)
#     
    # profile_100_100 = Magick::Image.read("public" + img.image_url(:profile_100_100))[0]
    # profile_50_50 = Magick::Image.read("public" + img.image_url(:profile_50_50))[0]
    # profile_34_34 = Magick::Image.read("public" + img.image_url(:profile_34_34))[0]
# 
    # # public/uploads/user_profile_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
# 
    # profile_100_100_filename = profile_100_100.filename
    # profile_50_50_filename = profile_50_50.filename
    # profile_34_34_filename = profile_34_34.filename
# 
    # FileUtils.rm_rf(Dir.glob(profile_100_100.filename))
    # FileUtils.rm_rf(Dir.glob(profile_50_50.filename))
    # FileUtils.rm_rf(Dir.glob(profile_34_34.filename))
#     
    # image_100_100.write profile_100_100_filename
    # image_50_50.write profile_50_50_filename
    # image_34_34.write profile_34_34_filename
# 
# 
#      
    # # # image.recreate_versions!
# # 
    # # image_100_100 = nil    
    # # image_50_50 = nil
    # # image_34_34 = nil
# #     
    # # profile_100_100 = nil
    # # profile_50_50 = nil
    # # profile_34_34 = nil
# # 
    # redirect_to '/Photos'    
    
  end


  # def rmagick
    # images_path = "public/sample_images"
    # file_name = "rmagick_generated_thumb.jpg"
    # file_path = images_path + "/"+ file_name
# 
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
  
  
  def destroy
    
    @user_profile_image = UserProfileImage.find(params[:id])
    if @user_profile_image.destroy
      redirect_to '/MemberProfilePhotos'
    else      
      render text: 'user_profile_image destory failed'
    end
    
  end
  
  
  
  def dbdelete

      UserProfileImage.dbdelete
      UserProfileImage.dbclear
      
      respond_to do |format|
        # format.html
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        format.js { redirect_to('/MemberProfilePhotos') }
        
      end

  end
  
  

  private

    def user_profile_image_params
      params.require(:user_profile_image).permit(      
                                                  :user_id,
                                                  :image,
                                                  :image_name,
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
