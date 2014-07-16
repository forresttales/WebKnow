class PublishersController < ApplicationController
  
  layout 'publisher'

  #before_filter :confirm_logged_in

  before_filter :force_http

    

  def index
    
    # render text: "current_user id = " + current_user.id.to_s + " publisher id = " + current_user.publisher.id.to_s
    
    # publisher = Publisher.where(["user_id = ?", current_user.id]).first
    publisher = current_user.publisher
    @publisher_id = publisher.id
    # @publisher_profile_images = PublisherProfileImage.where("user_id = ?", current_user.id)     
    @publisher_profile_images = current_user.publisher.publisher_profile_images     
    
    # publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", publisher.id)
    publisher_journalposters = current_user.publisher.publisher_journalposters

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
  
  
  def dbdelete

      Publisher.dbdelete
      Publisher.dbclear
      
      respond_to do |format|
        # format.html
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        format.js { redirect_to('/Publishers') }
        
      end

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
