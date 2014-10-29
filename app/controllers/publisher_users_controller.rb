class PublisherUsersController < ApplicationController

  require 'RMagick'
  
  layout 'publisher'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  #before_filter :confirm_logged_in

  before_filter :force_http

    

  def index

    # publisher = current_user.publisher
    # @publisher_id = publisher.id
    # publisher_members = publisher.publisher_members

    @publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    @publisher_id = @publisher_user.publisher_id
    publisher = Publisher.find_by_id(@publisher_id)
    
    # publisher = Publisher.where(["user_id = ?", current_user.id]).first
    # @publisher_id = publisher.id
    # @publisher_user = PublisherUser.where("user_id = ? AND publisher_id = ?", current_user.id, @publisher_id).first
    @publisher_user_id = @publisher_user.id
    # @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ? AND primary = ?", @publisher_user_id, true)
    
    # @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where("primary = ?", true)


    @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)

    @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first

    # @publisher_user_image_primary = PublisherUserImage.where("primary = ?", )
    
    # publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)

    # @publisher_user_image_primary = nil
    # publisher_user_images.each do |publisher_user_image|
      # if publisher_user_image
        # @publisher_user_image_primary = publisher_user_image    
      # end 
    # end
    

    # @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)     
    # @user_profile_image = UserProfileImage.where("user_id = ?", current_user.id).first
    
    # @publisher_user_images = PublisherProfileImage.where("publisher_id = ?", @publisher_id)     
    # @publisher_user_image = PublisherUserImage.where("publisher_id = ?", @publisher_id).first

    
    # publisher = Publisher.find(1)
    # if publisher.nil?
      # render text: 'nil'
    # else
      # render text: publisher.id
    # end
    
    # img = UserProfileImage.find(params[:image_id])
    
    # publishers = Publisher.where("user_id = 1")
    # publisher = publishers[0]
    
    # render text: publisher.id
    
    # @publisher = publisher       
    # @username = current_user.username
    
    # @admin_user_profile = AdminUserProfile.find(session[:admin_user_id])    
    
    # session[:publisher_id] = publisher.id
    
    # @publisher_profile_images = PublisherProfileImage.where("publisher_profile_image.publisher_id = ? AND publisher_profile_image.primary = ?", session[:publisher_id], true)       
    # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ? AND primary = ?", session[:publisher_id], true)  
    # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", session[:publisher_id])     

    

    # if @user_profile_images.any?
      # @user_profile_image_nav = @user_profile_images[0]
    # else
      # @user_profile_image_nav = nil
    # end      

    # @publisher_profile_image_has_profile_image = false
    # if publisher_profile_images.any?
      # @publisher_profile_image_has_profile_image = true
    # end


    # if publisher_profile_image.count > 0
      # image_name = publisher_image[0].image_name
      # gon.image_name = image_name
    # else
      # gon.image_name = ''
    # end
    
    publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", @publisher_id)
    if publisher_journalposters.any?
      session[:publisher_has_journalposter] = true
    else
      session[:publisher_has_journalposter] = false
    end        
    
    
  end
  
  
  def settings
    # @publisher = Publisher.find_by_id(params[:id])   
  end


  def show
    # @publisher_admin = Publisher.find_by_id(params[:id])   
  end

  
  def new
    
    # if !(session[:username].nil? or session[:user_id].nil?)
      # @username = session[:username]
      # @publisher = Publisher.new
    # else
      # render text: 'failed sessions'
    # end
    
  end

  
  def create

    # @publisher = Publisher.new(publisher_params)
    # @publisher.user_id = session[:user_id]
    # user = User.find(session[:user_id])
    # if user.update_columns( :has_account => true, :account_type => "publisher")      
      # if @publisher.save
        # session[:has_account] = true
        # session[:account_type] = "publisher"    
        # session[:profile] = "publishers/home"
        # redirect_to(:action => 'index')
      # else
        # render text: 'save publisher failed'
        # #render("new")
      # end
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
    # @publisher = Publisher.find(params[:id])
  end
  
  
  def update
    
    # render text: 'update'
    
    # @publisher = Publisher.find(params[:id])    
    # if @publisher.update_attributes(params[:publisher])
      # redirect_to(:action => 'show', :saved_id => @publisher.id)
    # else
      # render text: 'update failed'
    # end    

  end


  def delete
    # @admin_user = AdminUser.find(params[:id])
  end


  def destroy
    # AdminUser.find(params[:id]).destroy
    # flash[:notice] = "Admin user destroyed."
    # redirect_to(:action => 'list')
  end
  
  
  # def dbdelete
      # Publisher.dbdelete
      # Publisher.dbclear
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end
  # end

  
  def show_all_images
    
    @publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    @publisher_id = @publisher_user.publisher_id
    publisher = Publisher.find_by_id(@publisher_id)
    @publisher_user_id = @publisher_user.id
    @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
    @publisher_user_image_primary = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    
  end


  def destroy_publisher_user_image
    
    #@publisher_id = params[:publisher_id]
        
    # h_params = Hash.new
    # h_params[:publisher_id] = current_user.publisher.id         
    # h_params[:publisher_user_id] = publisher_user.id         
    # h_params[:id] = params[:id]         
        
    publisher_user_image = PublisherUserImage.find(params[:id])
    if publisher_user_image.destroy
      publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
      @publisher_user_images = publisher_user.publisher_user_images     
      @publisher_user_image_primary = @publisher_user_images.where( :primary => true ).first
      # @publisher_user_image_primary = PublisherUserImage.where("publisher_id = ?", @publisher_id).where( :primary => true ).first
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
  
  
  
  
  def upload_publisher_user_image_primary
    
    image = params[:publisher_user_image][:image]
    # user_image = UserImage.where("id = ?", current_user.id)
    # user_image = current_user.user_image
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    publisher_user_image = PublisherUserImage.new
    publisher_user_image.image = image
    publisher_user_image.user_id = publisher_user.user_id
    publisher_user_image.publisher_id = publisher_user.publisher_id
    publisher_user_image.publisher_user_id = publisher_user.id
    publisher_user_image.primary = true
    
    # h_user_image = Hash.new
    # h_user_image[:image] = image
    # user_image.image = image
    
    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_user_image.save
            # if user_image.update_attributes(:image => publisher_user_image.image)
            # if user.save
                @publisher_user_images = publisher_user.publisher_user_images     
                # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
                @publisher_user_image_primary = @publisher_user_images.where( :primary => true ).first
            # else
              # #
            # end 
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end

    
    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_user_image])    
    # if request.xhr? || remotipart_submitted?
      # #
    # else
      # render text: 'Remote call failed'
    # end


  end  
  


  def upload_publisher_user_image
    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    publisher_user_image = PublisherUserImage.new
    publisher_user_image.image = params[:publisher_user_image][:image]
    publisher_user_image.publisher_id = publisher_user.publisher_id
    publisher_user_image.publisher_user_id = publisher_user.id
    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_user_image.save
          @publisher_user_images = publisher_user.publisher_user_images     
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end
    
    
    # # @b_load_error = false
    # # @publisher_user_id = params[:publisher_user_image][:publisher_user_id]
    # publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    # @publisher_user_image = PublisherUserImage.create(params[:publisher_user_image])
    # if request.xhr? || remotipart_submitted?
      # # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
      # @publisher_user_images = publisher_user.publisher_user_images
    # else
      # # @b_load_error = true 
    # end


  end  



  def dbdelete

      # PublisherProfileImage.dbdelete
      # PublisherProfileImage.dbclear

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

      PublisherUserImage.dbdelete
      PublisherUserImage.dbclear

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


      redirect_to '/Publisher-Admin'      
      
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end

  end


  
  private

    def publisher_user_params
      params.require(:publisher_user).permit(
                                        :user_id,
                                        :publisher_id,
                                       )
    end
  
  
    # def sort_column
      # PublisherUser.column_names.include?(params[:sort]) ? params[:sort] : "id"
    # end    
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    # end

    # def yesno(x)
      # x == 1 ? "Yes" : "No"
    # end

  
  
end
