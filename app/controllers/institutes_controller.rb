class InstitutesController < ApplicationController
  
  layout 'institute'
  
  # before_filter :force_http
  
  #before_filter :confirm_logged_in
  
  def index
    @institute = Institute.where(["user_id = ?", session[:user_id]]).first       
    @username = session[:username]
    
    institute = @institute
    # @admin_user_profile = AdminUserProfile.find(session[:admin_user_id])    
    
    session[:institute_id] = institute.id
    
    institute_image = InstituteImage.where("institute_images.institute_id = ? AND institute_images.primary = ?", session[:institute_id], true)       

    if institute_image.count > 0
      image_name = institute_image[0].image_name
      gon.image_name = image_name
    else
      gon.image_name = ''
    end
    
  end
  
  
  def settings
    @institute = Institute.find_by_id(session[:institute_id])   
  end


  def show
    @institute = Institute.find_by_id(session[:institute_id])   
  end

  
  def new
    
    if !(session[:username].nil? or session[:user_id].nil?)
      @username = session[:username]
      @institute = Institute.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create
    @institute = Institute.new(institute_params)
    @institute.user_id = session[:user_id]
    user = User.find(session[:user_id])

    if user.update_columns( :has_account => true, :account_type => "institute")      
      if @institute.save
        
        session[:has_account] = true
        session[:account_type] = "institute"    
        session[:profile] = "institutes/home"
        
        redirect_to(:action => 'index')
      else
        render text: 'save institute failed'
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
    @institute = Institute.find(params[:id])
  end
  
  
  def update
    
    # render text: 'update'
    
    @institute = Institute.find(params[:id])    
    if @institute.update_attributes(params[:institute])
      redirect_to(:action => 'show', :saved_id => @institute.id)
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
  
  
  private

    def institute_params
      params.require(:institute).permit(
                                        :name, 
                                        :address, 
                                        :city, 
                                        :state, 
                                        :country, 
                                        :zip, 
                                        :main_phone, 
                                        :main_contact_email, 
                                        :public_private, 
                                        :number_students, 
                                        :number_computing_devices, 
                                        :post_rfp_link, 
                                        :company_contact_name_first, 
                                        :company_contact_name_last, 
                                        :name_title, 
                                        :company_contact_phone, 
                                        :company_contact_email, 
                                        :allow_add_products,        
                                        :created_at, 
                                        :updated_at            
                                       )
                                       
    end
  
  
  
end
