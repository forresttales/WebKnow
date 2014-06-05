class PublisherJournalposterLogosController < ApplicationController

  layout 'publisher'

  before_filter :force_http


  @@publisher_journalposter_id = nil
  @@publisher_id = nil
  
  def new
    
    # render text: params[:publisher_id]
    @@publisher_journalposter_id = params[:publisher_journalposter_id]
    @@publisher_id = params[:publisher_id]
    
    # @publisher_journalposter_logo = PublisherJournalposterLogo.new(:publisher_id => params[:publisher_id], :publisher_journalposter_id => params[:publisher_journalposter_id])
    @publisher_journalposter_logo = PublisherJournalposterLogo.new

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
                                              :image 
                                              )
                                        
    end

  
  


end
