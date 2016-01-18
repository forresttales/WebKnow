class PublisherProductLogosController < ApplicationController


  # require 'RMagick'

  layout 'publisher'

  # before_filter :force_http



  @@publisher_product_id = nil
  @@publisher_id = nil
  
  
  def index
    
    # render text: 'logos index'

    @publisher_product_id = params[:publisher_product_id]
    @publisher_id = params[:publisher_id]

    # @@publisher_product_id = @publisher_product_id 
    # @@publisher_id = @publisher_id
    
    # publisher = Publisher.where("user_id = ?", current_user.id).first
    # publisher_products = PublisherProduct.where("publisher_id = ?", publisher.id)
    @publisher_product_logo = PublisherProductLogo.where("publisher_product_id = ?", @publisher_product_id).first
    
  end  
  
  
  
  def new
    
    # render text: params[:publisher_id]
    @publisher_product_id = params[:publisher_product_id]
    @publisher_id = params[:publisher_id]
    @descr = params[:descr]
    
    @publisher_product_logo = PublisherProductLogo.new(:publisher_id => params[:publisher_id], :publisher_product_id => params[:publisher_product_id])

    # @publisher_product_logo = PublisherProductLogo.new

  end



  def create
    
    # @publisher_product_logo = PublisherProductLogo.new(params[:painting])
    @publisher_product_logo = PublisherProductLogo.new(publisher_product_logo_params)
    # @publisher_product_logo.publisher_id = params[:publisher_product_logo][:publisher_id]
    # @publisher_product_logo.publisher_product_id = params[:publisher_product_logo][:publisher_product_id]
    publisher_id = params[:publisher_product_logo][:publisher_id]
    publisher_product_id = params[:publisher_product_logo][:publisher_product_id]
    descr = params[:publisher_product_logo][:descr]
    
    # render text: publisher_product_id

    if @publisher_product_logo.save
      
      # '/publisher_product_descriptions?publisher_id=2&publisher_product_id=1'
      # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      if descr.to_s == '1'
        # redirect_to "/Publisher-Product-Description?publisher_id=" + publisher_id.to_s + "&publisher_product_id=" + publisher_product_id.to_s
        redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      else
        redirect_to :controller => 'publisher_product_logos', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      end      
      #flash[:notice] = "Successfully created painting."
      # redirect_to @painting.gallery
    else
      # render :action => 'new'
    end

    
    # render text: @publisher_product_logo.logo_name
    
    
    
    
    # publisher_product = PublisherProduct.find(@@publisher_product_id)
    # # publisher_product = PublisherProduct.find(2)
    # h_update = Hash.new
    # # h_update = { :product_logo => '', :has_product_logo => false }
    # # h_update['product_logo'] = uploaded_io.original_filename
    # # h_update['product_logo'] = @publisher_product_logo.logo_name
    # h_update['has_product_logo'] = true
# 
    # if publisher_product.update_columns( h_update )
      # publisher_product = nil          
      # # if publisher_product_logo.save
          # # # session[:publisher_logo_upload_status] = true
          # # # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_product_id.to_s
      # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :id => @@publisher_product_id
      # # else
          # # # session[:publisher_product_logo_upload_status] = false
          # # render 'create'        
      # # end    
    # else
      # render text: 'Upadate Publisher Product with has_product_logo failed'      
    # end    
    
  end

  def edit
    render text: 'edit publisher_product_logo'
    
    
    # @painting = Painting.find(params[:id])
  end

  def update
    
    render text: 'update publisher_product_logo'
    
    # @painting = Painting.find(params[:id])
    # if @painting.update_attributes(params[:painting])
      # flash[:notice] = "Successfully updated painting."
      # redirect_to @painting.gallery
    # else
      # render :action => 'edit'
    # end
  end

  def destroy
    
    render text: session[:publisher_product_logo_id]
    
    # publisher_id = params[:publisher_id]
    # publisher_product_id = params[:publisher_product_id]
    # publisher_product_logo_id = params[:publisher_product_logo_id]
    
    

    # http://localhost:3000/publisher_product_logos?publisher_id=2&publisher_product_id=1
    # http://localhost:3000/publisher_product_descriptions?publisher_id=2&publisher_product_id=1
    
    # publisher_product_logo = PublisherProductLogo.find(publisher_product_logo_id)
    # publisher_product_logo = PublisherProductLogo.find(params[:id])
    # if publisher_product_logo.destroy
      # # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      # redirect_to :controller => 'publisher_product_logos', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
# 
      # # redirect_to :controller => 'publisher_product_logos', 
                  # # :action => 'index', 
                  # # :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id, :publisher_product_logo_id => publisher_product_logo_id }
    # else
      # #
    # end
    
    
    
        
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end
  

  # def destroy_image
#     
    # # publisher_id = params[:publisher_id]
    # # publisher_product_id = params[:publisher_product_id]
    # publisher_product_logo_id = params[:publisher_product_logo_id]
    # # descr = params[:descr]
#     
    # # http://localhost:3000/publisher_product_logos?publisher_id=2&publisher_product_id=1
    # # http://localhost:3000/publisher_product_descriptions?publisher_id=2&publisher_product_id=1
#     
    # publisher_product_logo = PublisherProductLogo.find(publisher_product_logo_id)
    # if publisher_product_logo.destroy
#       
      # if descr.to_s == '1'
        # # redirect_to "/Publisher-Product-Description?publisher_id=" + publisher_id.to_s + "&publisher_product_id=" + publisher_product_id.to_s
        # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      # else
        # redirect_to :controller => 'publisher_product_logos', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      # end      
      # # redirect_to :controller => 'publisher_product_logos', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
    # else
      # #
    # end
#     
    # # flash[:notice] = "Successfully destroyed painting."
    # # redirect_to @painting.gallery
  # end


  # def destroy_logo_descr
    # publisher_id = params[:publisher_id]
    # publisher_product_id = params[:publisher_product_id]
    # publisher_product_logo_id = params[:publisher_product_logo_id]
    # publisher_product_logo = PublisherProductLogo.find(publisher_product_logo_id)
    # if publisher_product_image.destroy
      # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
    # else
      # #
    # end
  # end
  
  
  def crop
    @publisher_id = params[:publisher_id]
    @publisher_product_id = params[:publisher_product_id]
    publisher_product_logo_id = params[:publisher_product_logo_id]
    
    @publisher_product_logo = PublisherProductLogo.find(publisher_product_logo_id)
  end
  
  
  def crop
    
    # render text: params[:id]
    @publisher_user_image = PublisherUserImage.find(params[:id])
    
    # @profile_image = PublisherUserImage.find(1)
    
    # @publisher_user_image.crop_image
    # redirect_to '/MemberProfilePhotos'    
    
    # @publisher_user_images = PublisherUserImage.where("user_id = ?", current_user.id)    
    # @publisher_user_image = @publisher_user_images[0] 
  end
  
  
  def crop_commit
    
    
    # # render text: params[:image_id]
#     
    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
# 
    # img = PublisherProductLogo.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:image_600_600))[0]
#     
    # # render text: image.filename
# 
    # x = x.to_i
    # y = y.to_i
    # w = w.to_i
    # h = h.to_i
    # image_new = image.crop(x, y, w, h)
# 
    # new_image_200_200 = image_new.resize_to_fill(200, 200)    
    # new_image_100_100 = image_new.resize_to_fill(100, 100)    
    # new_image_50_50 = image_new.resize_to_fill(50, 50)
    # new_image_34_34 = image_new.resize_to_fill(34, 34)
# 
    # image_200_200 = Magick::Image.read("public" + img.image_url(:image_200_200))[0]    
    # image_100_100 = Magick::Image.read("public" + img.image_url(:image_100_100))[0]
    # image_50_50 = Magick::Image.read("public" + img.image_url(:image_50_50))[0]
    # image_34_34 = Magick::Image.read("public" + img.image_url(:image_34_34))[0]
# 
    # # public/uploads/publisher_user_image/image/1/profile_100_100_c4d7e6e7-0773-48d0-b582-1899274ef21f.jpg
# 
    # image_200_200_filename = image_200_200.filename
    # image_100_100_filename = image_100_100.filename
    # image_50_50_filename = image_50_50.filename
    # image_34_34_filename = image_34_34.filename
# 
    # FileUtils.rm_rf(Dir.glob(image_200_200.filename))
    # FileUtils.rm_rf(Dir.glob(image_100_100.filename))
    # FileUtils.rm_rf(Dir.glob(image_50_50.filename))
    # FileUtils.rm_rf(Dir.glob(image_34_34.filename))
# 
    # new_image_200_200.write image_200_200_filename    
    # new_image_100_100.write image_100_100_filename
    # new_image_50_50.write image_50_50_filename
    # new_image_34_34.write image_34_34_filename
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
    # redirect_to '/Publisher-Product-Description'    
    
  end


  # def crop_commit
#     
    # # render text: params[:crop_h]
#     
    # x = params[:crop_x]
    # y = params[:crop_y]
    # w = params[:crop_w]
    # h = params[:crop_h]
# 
# 
    # img = PublisherProductLogo.find(params[:image_id])
    # image = Magick::Image.read("public" + img.image_url(:image_500_500))[0]
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
    # # /publisher_product_images?publisher_id=1&publisher_product_id=1
    # # @@publisher_product_id = @publisher_product_id 
    # # @@publisher_id = @publisher_id
# 
    # # url_redirect = "/Publisher-Product-Image/publisher_product_id=" + @@publisher_id.to_s + "&publisher_product_id=" + @@publisher_product_id.to_s  
    # url_redirect = "/publisher_product_logos?publisher_id=" + @@publisher_id.to_s + "&publisher_product_id=" + @@publisher_product_id.to_s
    # redirect_to url_redirect    
#     
  # end
  
  
  
  def dbdelete
      PublisherProductLogo.dbdelete
      PublisherProductLogo.dbclear
      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
  end
  
  



  private

    def publisher_product_logo_params
      params.require(:publisher_product_logo).permit(      
                                                      :publisher_id,
                                                      :publisher_product_id, 
                                                      :image,
                                                      :crop_x,
                                                      :crop_y,
                                                      :crop_w,
                                                      :crop_h                                               
                                                    )
                                        
    end

  
  


end









  # layout 'publisher'
# 
  # @@publisher_product_id = nil
#   
  # before_filter :force_http
# 
#     
#   
  # def index
#     
    # @@publisher_product_id = params[:id]
# 
    # @publisher_product_logos = PublisherProductLogo.where("publisher_product_id = ?", @@publisher_product_id)
#     
    # publisher_product = PublisherProduct.find(@@publisher_product_id)
    # @publisher_product_name = publisher_product.name_product
    # @publisher_product_has_product_logo = publisher_product.has_product_logo
    # @publisher_product_id = @@publisher_product_id
# 
    # logos_count = @publisher_product_logos.count
    # gon.logos_count = logos_count
#     
    # if logos_count > 0
      # gon.image_name = publisher_product.product_logo
    # else
      # gon.image_name = ''
    # end
#     
#     
#     
  # end
# 
#   
  # def new
#     
  # end
# 
# 
  # def upload
# 
    # uploaded_io = params[:upload_file]
# 
    # File.open(Rails.root.join('public', 'images_publisher_product_logo', uploaded_io.original_filename), 'wb') do |file|
      # file.write(uploaded_io.read)
    # end
# 
    # publisher_product_logo = PublisherProductLogo.new
    # publisher_product_logo.image_name = uploaded_io.original_filename
    # publisher_product_logo.publisher_id = session[:publisher_id]
    # publisher_product_logo.publisher_product_id = @@publisher_product_id
#     
    # publisher_product = PublisherProduct.find( @@publisher_product_id )
# 
    # h_update = Hash.new
    # # h_update = { :product_logo => '', :has_product_logo => false }
    # h_update['product_logo'] = uploaded_io.original_filename
    # h_update['has_product_logo'] = true
# 
    # if publisher_product.update_columns( h_update )
      # publisher_product = nil          
      # if publisher_product_logo.save
          # # session[:publisher_image_upload_status] = true
          # redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s
      # else
          # session[:publisher_product_logo_upload_status] = false
          # render 'create'        
      # end    
    # else
      # render text: 'Upadate Publisher Product with has_product_logo failed'      
    # end    
#     
  # end
# 
# 
  # def create
#     
    # @publisher_image = Publisher.new(publisher_image_params)
    # if @publisher_image.save
#         
        # redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s        
#         
    # else
      # render 'new'
    # end
#     
#     
  # end
# 
# 
  # def show
#     
     # # render 'upload'
#     
  # end    
# 
# 
  # def destroy
#      
     # # render text: 'destroy'
#      
    # publisher_product_logo = PublisherProductLogo.find(params[:id])
    # if publisher_product_logo.delete
#       
        # File.delete(Rails.root.join('public', 'images_publisher_product_logo', publisher_product_logo.image_name))
        # # File.delete(Rails.root + '/foo.jpg')
        # redirect_to action: "index"
#               
    # else
      # render text: 'delete failed'
    # end
#      
  # end
# 
# 
# 
  # private
# 
    # def publisher_image_params
      # params.require(:publisher_image).permit(      
                                              # :publisher_id,
                                              # :publisher_product_id, 
                                              # :image_name 
                                              # )
#                                         
    # end
# 
#   
#   
# 
# end
