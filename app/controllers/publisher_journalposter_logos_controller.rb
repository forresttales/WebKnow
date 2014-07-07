class PublisherJournalposterLogosController < ApplicationController

  require 'RMagick'

  layout 'publisher'

  before_filter :force_http


  @@publisher_journalposter_id = nil
  @@publisher_id = nil
  
  
  def index
    
    # render text: 'logos index'

    @publisher_journalposter_id = params[:publisher_journalposter_id]
    @publisher_id = params[:publisher_id]

    @@publisher_journalposter_id = @publisher_journalposter_id 
    @@publisher_id = @publisher_id
    
    # publisher = Publisher.where("user_id = ?", current_user.id).first
    # publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", publisher.id)
    @publisher_journalposter_logos = PublisherJournalposterLogo.where("publisher_journalposter_id = ?", @publisher_journalposter_id)
    
  end  
  
  
  
  def new
    
    # render text: params[:publisher_id]
    @@publisher_journalposter_id = params[:publisher_journalposter_id]
    @@publisher_id = params[:publisher_id]
    
    @publisher_journalposter_logo = PublisherJournalposterLogo.new(:publisher_id => params[:publisher_id], :publisher_journalposter_id => params[:publisher_journalposter_id])
    # @publisher_journalposter_logo = PublisherJournalposterLogo.new

  end



  def create
    
    # @publisher_journalposter_logo = PublisherJournalposterLogo.new(params[:painting])
    @publisher_journalposter_logo = PublisherJournalposterLogo.new(publisher_image_params)
    @publisher_journalposter_logo.publisher_id = @@publisher_id
    @publisher_journalposter_logo.publisher_journalposter_id = @@publisher_journalposter_id
    
    if @publisher_journalposter_logo.save
      #flash[:notice] = "Successfully created painting."
      # redirect_to @painting.gallery
    else
      # render :action => 'new'
    end

    
    # render text: @publisher_journalposter_logo.image_name
    
    
    
    
    publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)

    # publisher_journalposter = PublisherJournalposter.find(2)

        
    h_update = Hash.new
    # h_update = { :journalposter_logo => '', :has_journalposter_logo => false }
    # h_update['journalposter_logo'] = uploaded_io.original_filename
    # h_update['journalposter_logo'] = @publisher_journalposter_logo.image_name
    h_update['has_journalposter_logo'] = true

    if publisher_journalposter.update_columns( h_update )
      publisher_journalposter = nil          
      # if publisher_journalposter_logo.save
          # # session[:publisher_image_upload_status] = true
          # # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
      redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => @@publisher_journalposter_id
      # else
          # # session[:publisher_journalposter_logo_upload_status] = false
          # render 'create'        
      # end    
    else
      render text: 'Upadate Publisher Product with has_journalposter_logo failed'      
    end    
    
  end

  def edit
    render text: 'edit publisher_journalposter_logo'
    
    
    # @painting = Painting.find(params[:id])
  end

  def update
    
    render text: 'update publisher_journalposter_logo'
    
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
    
    @publisher_journalposter_logo = PublisherJournalposterLogo.find(params[:id])
    @publisher_journalposter_logo.destroy
    
    
    h_update = Hash.new
    h_update['has_journalposter_logo'] = false

    publisher_journalposter = PublisherJournalposter.find(session[:publisher_journalposter_id])

    if publisher_journalposter.update_columns( h_update )
      publisher_journalposter = nil          
      redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => session[:publisher_journalposter_id]    
    else
      render text: 'destroy publisher_journalposter_logo operation failed'
    end    
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end
  
  
  
  def crop
    
    # render text: params[:id]
    @publisher_journalposter_logo = PublisherJournalposterLogo.find(params[:id])
    
    # @profile_image = UserProfileImage.find(1)
    
    # @user_profile_image.crop_image
    # redirect_to '/MemberProfilePhotos'    
    
    # @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)    
    # @user_profile_image = @user_profile_images[0] 
  end
  
  
  def crop_commit
    
    
    # render text: params[:crop_h]
    
    x = params[:crop_x]
    y = params[:crop_y]
    w = params[:crop_w]
    h = params[:crop_h]


    img = PublisherJournalposterLogo.find(params[:image_id])
    image = Magick::Image.read("public" + img.image_url(:image_250_150))[0]
    
    # render text: image.filename

    x = x.to_i
    y = y.to_i
    w = w.to_i
    h = h.to_i
    image_new = image.crop(x, y, w, h)

    # [500, 500]
    # [200, 200] 
    # [100, 100]
    # [50, 50]

    # image_new_exists = false
    # if !image_new.nil?
      # image_new_exists = true  
    # end
    # render text: image_new_exists
    
    image_new_200_200 = image_new.resize_to_fill(200, 200)    
    image_new_100_100 = image_new.resize_to_fill(100, 100)
    image_new_50_50 = image_new.resize_to_fill(50, 50)
    
    image_200_200 = Magick::Image.read("public" + img.image_url(:image_200_200))[0]
    image_100_100 = Magick::Image.read("public" + img.image_url(:image_100_100))[0]
    image_50_50 = Magick::Image.read("public" + img.image_url(:image_50_50))[0]

    # public/uploads/user_profile_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg

    image_200_200_filename = image_200_200.filename
    image_100_100_filename = image_100_100.filename
    image_50_50_filename = image_50_50.filename

    FileUtils.rm_rf(Dir.glob(image_200_200.filename))
    FileUtils.rm_rf(Dir.glob(image_100_100.filename))
    FileUtils.rm_rf(Dir.glob(image_50_50.filename))
    
    image_new_200_200.write image_200_200_filename
    image_new_100_100.write image_100_100_filename
    image_new_50_50.write image_50_50_filename
     

    # /publisher_journalposter_logos?publisher_id=1&publisher_journalposter_id=1
    # @@publisher_journalposter_id = @publisher_journalposter_id 
    # @@publisher_id = @publisher_id

    url_redirect = "/Publisher-Poster-Images?publisher_id=" + @@publisher_id.to_s + "&publisher_journalposter_id=" + @@publisher_journalposter_id.to_s  
    redirect_to url_redirect    
    
  end
  
  
  
  def dbdelete
      PublisherJournalposterLogo.dbdelete
      PublisherJournalposterLogo.dbclear
      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
  end
  
  
  
  
  # def index
#     
    # @@publisher_journalposter_id = params[:id]
# 
    # @publisher_journalposter_logos = PublisherJournalposterLogo.where("publisher_journalposter_id = ?", @@publisher_journalposter_id)
#     
    # #publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)
    # #@publisher_journalposter = publisher_journalposter.journalposter
    # #@publisher_journalposter_has_journalposter_logo = publisher_journalposter.has_journalposter_logo
    # @publisher_journalposter_id = @@publisher_journalposter_id
# 
    # logos_count = @publisher_journalposter_logos.count
    # gon.logos_count = logos_count
#     
    # if logos_count > 0
      # gon.image_name = @publisher_journalposter_logos[0].image_name
    # else
      # gon.image_name = ''
    # end
#     
#     
#     
  # end

  # :id
  # :publisher_id
  # :publisher_journalposter_id
  # :image_name
  
  # def new
    # @publisher_journalposter_logos = PublisherJournalposterLogo.new    
  # end

  
  # def resize
    
    # img_ident = ImageIdent.new
    # img_ident.assigned_text_1 = "ksr"
    # img_ident.assigned_text_2 = "pbjp"
    # img_ident.save
    # img_ident.assigned_digit = img_ident.id
    # img_ident.assigned_text = "ksr" + img_ident.assigned_digit + "pbjp"  
    # h_update = Hash.new
    # h_update['assigned_text_1'] = "ksr"
    # h_update['assigned_text_2'] = "pbjp"    
    # h_update['assigned_text'] = "ksr" + img_ident.assigned_digit + "pbjp"
    # if img_ident.update_columns( h_update )
#     
    # else
#       
    # end
        
    # render text: img_ident.id.to_s
    
    # render text: 'resize'
    
    # image = MiniMagick::Image.open("public/images_publisher_journalposter_logo/knowstory-icon-2-w198-h208.png")
    # # image = MiniMagick::Image.open(Rails.root.join('public', 'images_publisher_journalposter_logo', 'knowstory-icon-2-w198-h208.png'))
    # image.resize "100x100"
    # image.write  "public/images_publisher_journalposter_logo/output.png"    
#     
    # redirect_to '/PublisherJournalPosterLogos/' + @@publisher_journalposter_id.to_s     
# 
  # end



  # def upload

    # render text: params[:upload_file]

    # uploaded_io = params[:upload_file]
# 
    # img_ident = ImageIdent.new
    # img_ident.save
    # img_ident.assigned_digit = img_ident.id
    # img_ident.assigned_text_1 = "ksr"
    # img_ident.assigned_text_2 = "pbjp"
    # img_ident.assigned_text = "ksr" + img_ident.assigned_digit.to_s + "pbjp"  
    # h_update = Hash.new
    # h_update['assigned_digit'] = img_ident.assigned_digit        
    # h_update['assigned_text_1'] = img_ident.assigned_text_1
    # h_update['assigned_text_2'] = img_ident.assigned_text_2    
    # h_update['assigned_text'] = img_ident.assigned_text
    # if img_ident.update_columns( h_update )
     # #
    # else
     # # 
    # end
# 
    # image_save_as = img_ident.assigned_text + ".png"
# 
    # File.open(Rails.root.join('public', 'images_publisher_journalposter_logo', uploaded_io.original_filename), 'wb') do |file|
#       
      # uploaded_io.original_filename = image_save_as
      # file.write(uploaded_io.read)
      # # file.write(image_save_as)
    # end
# 
    # img_ident = nil

#     
    # publisher_journalposter_logo = PublisherJournalposterLogo.new
    # # publisher_journalposter_logo.image_name = uploaded_io.original_filename
    # publisher_journalposter_logo.image_name = image_save_as
    # publisher_journalposter_logo.publisher_id = session[:publisher_id]
    # publisher_journalposter_logo.publisher_journalposter_id = @@publisher_journalposter_id
#     
    # publisher_journalposter = PublisherJournalposter.find( @@publisher_journalposter_id )
# 
    # h_update = Hash.new
    # # h_update = { :journalposter_logo => '', :has_journalposter_logo => false }
    # # h_update['journalposter_logo'] = uploaded_io.original_filename
    # h_update['journalposter_logo'] = image_save_as
    # h_update['has_journalposter_logo'] = true
# 
    # if publisher_journalposter.update_columns( h_update )
      # publisher_journalposter = nil          
      # if publisher_journalposter_logo.save
          # # session[:publisher_image_upload_status] = true
          # # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
          # redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => @@publisher_journalposter_id
#           
      # else
          # session[:publisher_journalposter_logo_upload_status] = false
          # render 'create'        
      # end    
    # else
      # render text: 'Upadate Publisher Product with has_journalposter_logo failed'      
    # end    
    
  # end


  # def create
    # @publisher_image = Publisher.new(publisher_image_params)
    # if @publisher_image.save
        # redirect_to '/PublisherJournalposterDescription?id=' + @@publisher_journalposter_id.to_s        
    # else
      # render 'new'
    # end
  # end


  # def show
     # # render 'upload'
  # end    


  # def destroy
#      
     # # render text: 'destroy'
#      
    # # PublisherJournalposter
# 
    # # :id                                 **
    # # :publisher_id                       **
    # # :journalposter_logo                 *
    # # :has_journalposter_logo             *
# 
    # # PublisherJournalposterDescription
#     
    # # :id                                 **
    # # :publisher_journalposter_id         **
    # # :publisher_id                       **
    # # :logo                               *
# 
#     
    # # PublisherJournalposterLogo
# 
    # # :id                                 **
    # # :publisher_id                       **
    # # :publisher_journalposter_id         **
    # # :image_name                         *
# 
# 
    # publisher_journalposter = PublisherJournalposter.find( @@publisher_journalposter_id )
# 
    # h_update = Hash.new
    # # h_update = { :journalposter_logo => '', :has_journalposter_logo => false }
    # h_update['journalposter_logo'] = ""
    # h_update['has_journalposter_logo'] = false
# 
#      
    # publisher_journalposter_logo = PublisherJournalposterLogo.find(params[:id])
#     
    # if publisher_journalposter.update_columns( h_update )
        # publisher_journalposter = nil          
        # if publisher_journalposter_logo.delete
#           
            # File.delete(Rails.root.join('public', 'images_publisher_journalposter_logo', publisher_journalposter_logo.image_name))
            # # File.delete(Rails.root + '/foo.jpg')
            # redirect_to action: "index"
#                   
        # else
          # render text: 'delete failed'
        # end
    # else
       # render text: 'delete update failed'
    # end
#      
#      
  # end



  private

    def publisher_image_params
      params.require(:publisher_journalposter_logo).permit(      
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
