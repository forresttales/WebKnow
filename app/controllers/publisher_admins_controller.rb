class PublisherAdminsController < ApplicationController

  
  layout 'publisher'

  #before_filter :confirm_logged_in

  before_filter :force_http

    

  def index
    
    # publisher = Publisher.find(1)
    # if publisher.nil?
      # render text: 'nil'
    # else
      # render text: publisher.id
    # end
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
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
    @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)     

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
    
    publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", publisher.id)
    if publisher_journalposters.any?
      session[:publisher_has_journalposter] = true
    else
      session[:publisher_has_journalposter] = false
    end        
    
    
  end
  
  
  def settings
    @publisher = Publisher.find_by_id(session[:publisher_id])   
  end


  def show
    @publisher = Publisher.find_by_id(session[:publisher_id])   
  end

  
  def new
    
    if !(session[:username].nil? or session[:user_id].nil?)
      @username = session[:username]
      @publisher = Publisher.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.user_id = session[:user_id]
    user = User.find(session[:user_id])

    if user.update_columns( :has_account => true, :account_type => "publisher")      
      if @publisher.save
        
        session[:has_account] = true
        session[:account_type] = "publisher"    
        session[:profile] = "publishers/home"
        
        redirect_to(:action => 'index')
      else
        render text: 'save publisher failed'
        #render("new")
      end
    else
      render text: 'update user_id failed'
    end
    
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
  
  
  # def dbdelete
      # Publisher.dbdelete
      # Publisher.dbclear
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end
  # end
  
  
  
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
                                        :company_contact_email, 
                                        :created_at, 
                                        :updated_at
                                       )
                                       
    end
  
  
  
end
