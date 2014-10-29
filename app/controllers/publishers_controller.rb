class PublishersController < ApplicationController
  
  require 'RMagick'
  
  layout 'publisher'

  respond_to :html, :js, :json  

  #before_filter :confirm_logged_in

  before_filter :force_http

    

  def index
    
    # render text: "current_user id = " + current_user.id.to_s + " publisher id = " + current_user.publisher.id.to_s
    
    # publisher = Publisher.where(["user_id = ?", current_user.id]).first
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    # @publisher_id = publisher_user.publisher_id
    # publisher = Publisher.find_by_id(@publisher_id)
    
    publisher = current_user.publisher
    @publisher_id = publisher.id
    
    # publisher = current_user.publisher
    # @publisher_id = publisher.id
    # @publisher_profile_images = PublisherProfileImage.where("user_id = ?", current_user.id)     
    # @publisher_profile_images = current_user.publisher.publisher_profile_images     
    @publisher_profile_images = publisher.publisher_profile_images     
    @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ?", @publisher_id).where( :primary => true ).first
    # @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ? AND order = 1", @publisher_id ).first
    
    # result = ActiveRecord::Base.connection.exec_query('SELECT id, title, body FROM posts')
    # @publisher_profile_image_primary = ActiveRecord::Base.connection.exec_query('SELECT * FROM publisher_profile_images WHERE publisher_id = 1 AND order = 1')
    
    # publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", publisher.id)
    
    
    
    # publisher_journalposters = publisher.publisher_journalposters
    # if publisher_journalposters.any?
      # session[:publisher_has_journalposter] = true
    # else
      # session[:publisher_has_journalposter] = false
    # end        
    
    
  end
  
  
  def settings
    @publisher = Publisher.find_by_id(session[:publisher_id])   
  end


  def show
    @publisher = Publisher.find_by_id(session[:publisher_id])   
  end

  
  def new
    
    # if !(session[:username].nil? or session[:user_id].nil?)
    if !current_user.nil?
      @username = current_user.username
      @publisher = current_user.publisher.build
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create
    
    @publisher = current_user.publisher.new(publisher_params)
    
    # @publisher = Publisher.new(publisher_params)
    # @publisher.user_id = session[:user_id]
    # user = User.find(session[:user_id])

    # if user.update_columns( :has_account => true, :account_type => "publisher")      
      if @publisher.save
        # session[:has_account] = true
        session[:account_type] = "publisher"    
        session[:profile] = "publishers/home"
        
        redirect_to(:action => 'index')
      else
        render text: 'save publisher failed'
        #render("new")
      end
    # else
      # render text: 'update user_id failed'
    # end
    
    # if @user.update_attribute(:has_account, TRUE)
      # if @user.update_attribute(:account_type, "student")
        # if @student.save
          # flash[:notice] = 'Student account created'
          # #redirect_to(:action => 'list')
        # else
          # flash.now[:notice] = "Account create failed"
#           
          # render("new")
        # end
      # else
        # flash[:notice] = 'User update failed'      
      # end
    # else
      # flash[:notice] = 'User update failed'      
    # end
    
  end
  

  def edit
    # publisher = User.where("user_id = ?", current_user.id)
    @publisher = Publisher.find(params[:id])
  end
  
  
  def update
    
    # render text: 'update'
    
    @publisher = Publisher.find(params[:id])    
    if @publisher.update_attributes(params[:publisher])
      redirect_to(:action => 'show', :saved_id => @publisher.id)
    else
      render text: 'update failed'
    end    

  end


  def delete
    # @admin_user = AdminUser.find(params[:id])
  end


  def destroy
    # AdminUser.find(params[:id]).destroy
    # flash[:notice] = "Admin user destroyed."
    # redirect_to(:action => 'list')
  end
  

  
  def show_all_images
    
    publisher = current_user.publisher
    @publisher_id = publisher.id
    @publisher_profile_images = publisher.publisher_profile_images     
    @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ?", @publisher_id).where( :primary => true ).first
    
  end


  
  def destroy_publisher_profile_image
    
    #@publisher_id = params[:publisher_id]
    
    @publisher_id = current_user.publisher.id
        
    publisher_profile_image = PublisherProfileImage.find(params[:id])
    if publisher_profile_image.destroy
      publisher = Publisher.find_by_id(@publisher_id)
      @publisher_profile_images = publisher.publisher_profile_images     
      @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ?", @publisher_id).where( :primary => true ).first
      # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", @publisher_id)
      # redirect_to '/Publisher-Photos'
    else      
      # render text: 'publisher_profile_image destory failed'
    end

    
    respond_to do |format|
      format.html {}
      format.js
    end
    
  end
  
  
  
  def upload_publisher_profile_image_primary
    
    publisher = Publisher.where("user_id = ?", current_user.id).first
    publisher_profile_image = PublisherProfileImage.new
    publisher_profile_image.image = params[:publisher_profile_image][:image]
    publisher_profile_image.user_id = publisher.user_id
    publisher_profile_image.publisher_id = publisher.id
    publisher_profile_image.primary = true    
    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_profile_image.save
          @publisher_profile_images = publisher.publisher_profile_images     
          # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
          @publisher_profile_image_primary = @publisher_profile_images.where( :primary => true ).first
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end
    
    
    
    
    # @publisher_id = params[:publisher_profile_image][:publisher_id]
    
    # @publisher_profile_image_primary = PublisherProfileImage.create(params[:publisher_profile_image])    
    # if request.xhr? || remotipart_submitted?
      # # publisher = Publisher.find_by_id(publisher_id)
      # @publisher_profile_images = publisher.publisher_profile_images     
#       
      # # @publisher_profile_image_primary = PublisherProfileImage.where("publisher_id = ?", publisher_id).where( :primary => true ).first
      # @publisher_profile_image_primary = @publisher_profile_images.where( :primary => true ).first
# 
      # # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", @publisher_id)
    # else
      # # render text: 'Remote call failed'
    # end


  end  
  


  def upload_publisher_profile_image
    
    # @b_load_error = false
    # @publisher_id = params[:publisher_profile_image][:publisher_id]
    publisher = current_user.publisher
    publisher_profile_image = PublisherProfileImage.create(params[:publisher_profile_image])
    if request.xhr? || remotipart_submitted?
      # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", publisher_id)
      @publisher_profile_images = publisher.publisher_profile_images 
    else
      # @b_load_error = true 
    end


  end  
  

  
  def dbdelete

      PublisherProfileImage.dbdelete
      PublisherProfileImage.dbclear

      # Publisher.dbdelete
      # Publisher.dbclear
      
      # User.dbdelete
      # User.dbclear

      # UserProfileImage.dbdelete
      # UserProfileImage.dbclear

      # Publisher.dbdelete
      # Publisher.dbclear

      # PublisherUser.dbdelete
      # PublisherUser.dbclear

      # PublisherMember.dbdelete
      # PublisherMember.dbclear

      # PublisherUserImage.dbdelete
      # PublisherUserImage.dbclear

      # PublisherProduct.dbdelete
      # PublisherProduct.dbclear

      # PublisherProductDescription.dbdelete
      # PublisherProductDescription.dbclear

      # PublisherProductImage.dbdelete
      # PublisherProductImage.dbclear

      # PublisherProduct1Image.dbdelete
      # PublisherProduct1Image.dbclear

      # PublisherProduct2Image.dbdelete
      # PublisherProduct2Image.dbclear

      # PublisherProductLogo.dbdelete
      # PublisherProductLogo.dbclear

      # PublisherProductCorporateLogo.dbdelete
      # PublisherProductCorporateLogo.dbclear

      # PublisherProductPdf.dbdelete
      # PublisherProductPdf.dbclear

      # PublisherProductPdfImage.dbdelete
      # PublisherProductPdfImage.dbclear

      # PublisherProductContentType.dbdelete
      # PublisherProductContentType.dbclear

      # PublisherProductCategorySubject.dbdelete
      # PublisherProductCategorySubject.dbclear

      # PublisherProductAppropriateAge.dbdelete
      # PublisherProductAppropriateAge.dbclear

      # PublisherProductAppropriateGrade.dbdelete
      # PublisherProductAppropriateGrade.dbclear

      # PublisherProductMarketTarget.dbdelete
      # PublisherProductMarketTarget.dbclear

      # PublisherProductPlatform.dbdelete
      # PublisherProductPlatform.dbclear

      # PublisherProductFileType.dbdelete
      # PublisherProductFileType.dbclear

      # PublisherProductCharacter.dbdelete
      # PublisherProductCharacter.dbclear

      # PublisherProductEnhancement.dbdelete
      # PublisherProductEnhancement.dbclear

      # PublisherProductByReview.dbdelete
      # PublisherProductByReview.dbclear

      # PublisherProductPricingModel.dbdelete
      # PublisherProductPricingModel.dbclear

      # PublisherProductPrice.dbdelete
      # PublisherProductPrice.dbclear

      # PublisherProductLessonTime.dbdelete
      # PublisherProductLessonTime.dbclear

      # PublisherProductCoreLiteracyStandard.dbdelete
      # PublisherProductCoreLiteracyStandard.dbclear

      # PublisherProductCoreMathStandard.dbdelete
      # PublisherProductCoreMathStandard.dbclear


      redirect_to '/Publisher'      
      
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end

  end
  
  
  
  private

    def publisher_params
      params.require(:publisher).permit(
                                        :user_id,
                                        :name, 
                                        :address, 
                                        :city, 
                                        :state, 
                                        :country, 
                                        :zip,
                                        :phone, 
                                        :url, 
                                        :description, 
                                        :company_contact_name_first, 
                                        :company_contact_name_last,
                                        :company_contact_phone, 
                                        :company_contact_email 
                                       )
                                       
    end
  
  
  
end
