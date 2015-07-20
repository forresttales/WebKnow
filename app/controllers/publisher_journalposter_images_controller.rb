class PublisherJournalposterImagesController < ApplicationController

  #require 'RMagick'

  layout 'publisher'

  # before_filter :force_http


  @@publisher_journalposter_id = nil
  @@publisher_id = nil
  
  
  def index
    
    # render text: 'images index'

    @publisher_journalposter_id = params[:publisher_journalposter_id]
    @publisher_id = params[:publisher_id]
    
    # publisher = Publisher.where("user_id = ?", current_user.id).first
    # publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", publisher.id)
    @publisher_journalposter_image = PublisherJournalposterImage.where("publisher_journalposter_id = ?", @publisher_journalposter_id).first
    
  end  
  
  
  def new
    # render text: params[:publisher_id]
    @publisher_journalposter_id = params[:publisher_journalposter_id]
    @publisher_id = params[:publisher_id]
    @descr = params[:descr]    
    @publisher_journalposter_image = PublisherJournalposterImage.new
    # @publisher_journalposter_image = PublisherJournalposterImage.new
  end


  def create
    
    # @publisher_journalposter_image = PublisherJournalposterImage.new(params[:painting])
    publisher_journalposter_image = PublisherJournalposterImage.new(publisher_image_params)
    publisher_id = params[:publisher_journalposter_image][:publisher_id]
    publisher_journalposter_id = params[:publisher_journalposter_image][:publisher_journalposter_id]
    descr = params[:publisher_journalposter_image][:descr]
    
    if publisher_journalposter_image.save
      if descr.to_s == '1'
        # redirect_to "/Publisher-Product-Description?publisher_id=" + publisher_id.to_s + "&publisher_journalposter_id=" + publisher_journalposter_id.to_s
        redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_journalposter_id => publisher_journalposter_id }
      else
        redirect_to :controller => 'publisher_journalposter_images', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_journalposter_id => publisher_journalposter_id }
      end      
      #flash[:notice] = "Successfully created painting."
      # redirect_to @painting.gallery
    else
      # render :action => 'new'
    end

    
    # render text: @publisher_journalposter_image.image_name
    
    # publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)
    # # publisher_journalposter = PublisherJournalposter.find(2)
    # h_update = Hash.new
    # # h_update = { :journalposter_image => '', :has_journalposter_image => false }
    # # h_update['journalposter_image'] = uploaded_io.original_filename
    # # h_update['journalposter_image'] = @publisher_journalposter_image.image_name
    # h_update['has_journalposter_image'] = true
    # if publisher_journalposter.update_columns( h_update )
      # publisher_journalposter = nil          
      # # if publisher_journalposter_image.save
          # # # session[:publisher_image_upload_status] = true
          # # # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
      # redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => @@publisher_journalposter_id
      # # else
          # # # session[:publisher_journalposter_image_upload_status] = false
          # # render 'create'        
      # # end    
    # else
      # render text: 'Upadate Publisher Product with has_journalposter_image failed'      
    # end    
    
  end

  def edit
    render text: 'edit publisher_journalposter_image'
    
    
    # @painting = Painting.find(params[:id])
  end

  def update
    
    render text: 'update publisher_journalposter_image'
    
    # @painting = Painting.find(params[:id])
    # if @painting.update_attributes(params[:painting])
      # flash[:notice] = "Successfully updated painting."
      # redirect_to @painting.gallery
    # else
      # render :action => 'edit'
    # end
  end

  def destroy
    
    # render text: session[:publisher_journalposter_id]
    
    @publisher_journalposter_image = PublisherJournalposterImage.find(params[:id])
    @publisher_journalposter_image.destroy
    
    
    h_update = Hash.new
    h_update['has_journalposter_image'] = false

    publisher_journalposter = PublisherJournalposter.find(session[:publisher_journalposter_id])

    if publisher_journalposter.update_columns( h_update )
      publisher_journalposter = nil          
      redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => session[:publisher_journalposter_id]    
    else
      render text: 'destroy publisher_journalposter_image operation failed'
    end    
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end
  
  
  def destroy_image
    
    publisher_id = params[:publisher_id]
    publisher_journalposter_id = params[:publisher_journalposter_id]
    publisher_journalposter_image_id = params[:publisher_journalposter_image_id]
    descr = params[:descr]
    
    # http://localhost:3000/publisher_journalposter_images?publisher_id=2&publisher_journalposter_id=1
    # http://localhost:3000/publisher_journalposter_descriptions?publisher_id=2&publisher_journalposter_id=1
    
    publisher_journalposter_image = PublisherJournalposterImage.find(publisher_journalposter_image_id)
    if publisher_journalposter_image.destroy
      
      if descr.to_s == '1'
        # redirect_to "/Publisher-Product-Description?publisher_id=" + publisher_id.to_s + "&publisher_journalposter_id=" + publisher_journalposter_id.to_s
        redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_journalposter_id => publisher_journalposter_id }
      else
        redirect_to :controller => 'publisher_journalposter_images', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_journalposter_id => publisher_journalposter_id }
      end      
      # redirect_to :controller => 'publisher_journalposter_images', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_journalposter_id => publisher_journalposter_id }
    else
      #
    end
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end
  
  
  def crop
    
    # render text: params[:id]
    @publisher_id = params[:publisher_id]
    @publisher_journalposter_id = params[:publisher_journalposter_id]
    publisher_journalposter_image_id = params[:publisher_journalposter_image_id]
    
    @publisher_journalposter_image = PublisherJournalposterImage.find(publisher_journalposter_image_id)
    
    # @profile_image = UserProfileImage.find(1)
    
    # @user_profile_image.crop_image
    # redirect_to '/MemberProfilePhotos'    
    
    # @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)    
    # @user_profile_image = @user_profile_images[0] 
  end
  
  
  def crop_commit
#     
#     
    # # render text: params[:crop_h]
#     
    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
# 
# 
    # img = PublisherJournalposterImage.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:image_250_150))[0]
#     
    # # render text: image.filename
# 
    # x = x.to_i
    # y = y.to_i
    # w = w.to_i
    # h = h.to_i
    # image_new = image.crop(x, y, w, h)
# 
    # # [500, 500]
    # # [200, 200] 
    # # [100, 100]
    # # [50, 50]
# 
    # # image_new_exists = false
    # # if !image_new.nil?
      # # image_new_exists = true  
    # # end
    # # render text: image_new_exists
#     
    # image_new_200_200 = image_new.resize_to_fill(200, 200)    
    # image_new_100_100 = image_new.resize_to_fill(100, 100)
    # image_new_50_50 = image_new.resize_to_fill(50, 50)
#     
    # image_200_200 = Magick::Image.read("public" + img.image_url(:image_200_200))[0]
    # image_100_100 = Magick::Image.read("public" + img.image_url(:image_100_100))[0]
    # image_50_50 = Magick::Image.read("public" + img.image_url(:image_50_50))[0]
# 
    # # public/uploads/user_profile_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
# 
    # image_200_200_filename = image_200_200.filename
    # image_100_100_filename = image_100_100.filename
    # image_50_50_filename = image_50_50.filename
# 
    # FileUtils.rm_rf(Dir.glob(image_200_200.filename))
    # FileUtils.rm_rf(Dir.glob(image_100_100.filename))
    # FileUtils.rm_rf(Dir.glob(image_50_50.filename))
#     
    # image_new_200_200.write image_200_200_filename
    # image_new_100_100.write image_100_100_filename
    # image_new_50_50.write image_50_50_filename
#      
# 
    # # /publisher_journalposter_images?publisher_id=1&publisher_journalposter_id=1
    # # @@publisher_journalposter_id = @publisher_journalposter_id 
    # # @@publisher_id = @publisher_id
# 
    # url_redirect = "/Publisher-Poster-Images?publisher_id=" + @@publisher_id.to_s + "&publisher_journalposter_id=" + @@publisher_journalposter_id.to_s  
    # redirect_to url_redirect    
#     
  end
  
  
  
  def dbdelete
      PublisherJournalposterImage.dbdelete
      PublisherJournalposterImage.dbclear
      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
  end
  
  
  
  

  private

    def publisher_image_params
      params.require(:publisher_journalposter_image).permit(      
                                              :publisher_id,
                                              :publisher_journalposter_id, 
                                              :image,
                                              :crop_x,
                                              :crop_y,
                                              :crop_w,
                                              :crop_h                                               
                                              )
                                        
    end

  
  


end
