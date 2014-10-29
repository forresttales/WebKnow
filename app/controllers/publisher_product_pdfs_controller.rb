class PublisherProductPdfsController < ApplicationController
  
  layout 'publisher_product_pdf'
  
  # require 'RMagick'

  before_filter :force_http

  respond_to :html, :js, :json  



  @@publisher_product_id = nil
  @@publisher_id = nil
  
  
  def index
    
    # render text: 'pdfs index'

    @publisher_product_id = params[:publisher_product_id]
    @publisher_id = params[:publisher_id]

    # @@publisher_product_id = @publisher_product_id 
    # @@publisher_id = @publisher_id
    
    # publisher = Publisher.where("user_id = ?", current_user.id).first
    # publisher_products = PublisherProduct.where("publisher_id = ?", publisher.id)
    
    # @publisher_product_pdf = PublisherProductPdf.where("publisher_product_id = ?", @publisher_product_id).first

    @publisher_product_pdfs = PublisherProductPdf.where("publisher_product_id = ?", @publisher_product_id)
    
  end  
  
  
  
  def new
    
    @publisher_product_id = params[:publisher_product_id]
    @publisher_id = params[:publisher_id]
    # # @descr = params[:descr]
    # # @publisher_product_pdf = PublisherProductPdf.new(:publisher_id => params[:publisher_id], :publisher_product_id => params[:publisher_product_id])
    @publisher_product_pdf = PublisherProductPdf.new

  end



  def create
    
    @publisher_product_pdf = PublisherProductPdf.create(publisher_product_pdf_params)
    # if @publisher_product_pdf = PublisherProductPdf.create(publisher_product_pdf_params)
      # redirect_to action: 'index'
    # else
      # session[:publisher_product_pdf_upload_status] = false
      # # render text: 'failed'
    # end
    
    # @publisher_product_pdf_updated = nil
    # @test1 = 'test 1'
    
    if request.xhr? || remotipart_submitted?
      # @publisher_product_pdf = PublisherProductPdf.find(@publisher_product_pdf.id)
      # sleep 1 if params[:pause]
      # render :layout => false, :template => (params[:template] == 'escape' ? 'comments/escape_test' : 'comments/create'), :status => (@comment.errors.any? ? :unprocessable_entity : :ok)
    else
      #redirect_to comments_path    
      render text: 'Remote call failed'
    end
    
    
    # # blog_image = BlogImage.new
    # # blog_image.image = params[:image_form][:uploaded_data]
    # # blog_image.save!    
#     
    # # @publisher_product_pdf = PublisherProductPdf.new(params[:painting])
    # publisher_product_pdf = PublisherProductPdf.new(publisher_product_pdf_params)
    # # @publisher_product_pdf.publisher_id = params[:publisher_product_pdf][:publisher_id]
    # # @publisher_product_pdf.publisher_product_id = params[:publisher_product_pdf][:publisher_product_id]
    # # publisher_id = params[:publisher_product_pdf][:publisher_id]
    # # publisher_product_id = params[:publisher_product_pdf][:publisher_product_id]
    # # name_pdf = params[:publisher_product_pdf][:name_pdf]
    # # descr = params[:publisher_product_pdf][:descr]
#     
    # # render text: publisher_product_id
# 
    # # @publisher_product_pdf.name_pdf = name_pdf
    # # @publisher_product_pdf.publisher_id = publisher_id
    # # @publisher_product_pdf.publisher_product_id = publisher_product_id
# 
    # if publisher_product_pdf.save
      # # redirect_to :action => 'new'
      # # new_publisher_product_pdf_path(:publisher_id => @publisher_id, :publisher_product_id => @publisher_product_id)
      # session[:publisher_product_pdf_upload_status] = true
    # else
      # session[:publisher_product_pdf_upload_status] = false
    # end
# 
    # # respond_to do |format|
      # # format.html {}
      # # format.js 
      # # # format.json { render :json => { :name_pdf => name_pdf } }      
    # # end

    
  end

  def edit
    render text: 'edit publisher_product_pdf'
    
    
    # @painting = Painting.find(params[:id])
  end

  def update
    
    render text: 'update publisher_product_pdf'
    
    # @painting = Painting.find(params[:id])
    # if @painting.update_attributes(params[:painting])
      # flash[:notice] = "Successfully updated painting."
      # redirect_to @painting.gallery
    # else
      # render :action => 'edit'
    # end
  end

  def destroy
    
    render text: session[:publisher_product_pdf_id]
    
    # publisher_id = params[:publisher_id]
    # publisher_product_id = params[:publisher_product_id]
    # publisher_product_pdf_id = params[:publisher_product_pdf_id]
    
    

    # http://localhost:3000/publisher_product_pdfs?publisher_id=2&publisher_product_id=1
    # http://localhost:3000/publisher_product_descriptions?publisher_id=2&publisher_product_id=1
    
    # publisher_product_pdf = PublisherProductPdf.find(publisher_product_pdf_id)
    # publisher_product_pdf = PublisherProductPdf.find(params[:id])
    # if publisher_product_pdf.destroy
      # # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      # redirect_to :controller => 'publisher_product_pdfs', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
# 
      # # redirect_to :controller => 'publisher_product_pdfs', 
                  # # :action => 'index', 
                  # # :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id, :publisher_product_pdf_id => publisher_product_pdf_id }
    # else
      # #
    # end
    
    
    
        
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end
  

  def destroy_image
    
    publisher_id = params[:publisher_id]
    publisher_product_id = params[:publisher_product_id]
    publisher_product_pdf_id = params[:publisher_product_pdf_id]
    # descr = params[:descr]
    
    publisher_product_pdf = PublisherProductPdf.find(publisher_product_pdf_id)
    if publisher_product_pdf.destroy
      
      # if descr.to_s == '1'
        # # redirect_to "/Publisher-Product-Description?publisher_id=" + publisher_id.to_s + "&publisher_product_id=" + publisher_product_id.to_s
        # redirect_to :controller => 'publisher_product_descriptions', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      # else
        # redirect_to :controller => 'publisher_product_pdfs', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
      # end      
      # # redirect_to :controller => 'publisher_product_pdfs', :action => 'index', :params => { :publisher_id => publisher_id, :publisher_product_id => publisher_product_id }
    else
      #
    end
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end

  
  
  
  def dbdelete
      PublisherProductPdf.dbdelete
      PublisherProductPdf.dbclear
      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
  end
  
  



  private

    def publisher_product_pdf_params
      params.require(:publisher_product_pdf).permit(      
                                                      :publisher_id,
                                                      :publisher_product_id,
                                                      :publisher_product_description_id,
                                                      :name_file, 
                                                      :name_pdf,
                                                      :image
                                                    )
                                        
    end

  
  


end


