class UsersController < ApplicationController

  require 'RMagick'

  # layout 'user'
  layout 'newland'

  respond_to :html, :js, :json  

  before_action :already_signed_in, only: [:new]
  
  # before_action :signed_in_user
  
  # before_action :signed_in_user,
                # only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy
#   
  # skip_before_filter :verify_authenticity_token
  
  # before_filter :force_http




  def test_rmagick
    image = Magick::Image.new(110, 30){ self.background_color = 'white' }
    image.write('/tmp/test.jpg')
  end

  
  
  def index
    
    @users = User.paginate(page: params[:page])
    
  end


  def new
    # @account_type = params[:id]
    # @user = User.new
    @bd_years = BdYear.order("year_value ASC").all
    # render layout: "newland"
    # flash.now[:notice] = "* Password has been reset *"
    
  end

  
  def show
    #@user = User.find(params[:id])
    # @user = User.find(session[:user_id])    
  end

  
  def create

    user = User.new(user_params)
        
    # account_type = params[:user][:account_type]
    # case account_type
    # when "0"
      # user.account_type_text = "student"
    # when "1"
      # user.account_type_text = "teacher"
    # when "2"
      # user.account_type_text = "publisher"
    # when "3"
      # user.account_type_text = "school"
    # when "4"
      # user.account_type_text = "recruiter"
    # else
      # # 
    # end
    
    
    user.account_type = 3
    user.account_type_text = "publisher"
    
    
    bd_month = params[:user][:bd_month]
    case bd_month
    when "1"
      user.bd_month_text = "January"
    when "2"
      user.bd_month_text = "February"
    when "3"
      user.bd_month_text = "March"
    when "4"
      user.bd_month_text = "April"
    when "5"
      user.bd_month_text = "May"
    when "6"
      user.bd_month_text = "June"
    when "7"
      user.bd_month_text = "July"
    when "8"
      user.bd_month_text = "August"
    when "9"
      user.bd_month_text = "September"
    when "10"
      user.bd_month_text = "October"
    when "11"
      user.bd_month_text = "November"
    when "12"
      user.bd_month_text = "December"
    else
      # 
    end

    gender = params[:user][:gender]
    case gender
    when "0"
      user.gender_text = "Male"
    when "1"
      user.gender_text = "Female"
    else
      # 
    end
    
    if user.save
        h_publisher = Hash.new
        h_publisher[:user_id] = user.id    
        publisher = Publisher.new(h_publisher)
        if publisher.save
            publisher_member = PublisherMember.new(:user_id => user.id, :publisher_id => publisher.id)
            # publisher_user.publisher_id = publisher.id
            if publisher_member.save
               publisher_user = PublisherUser.new(:user_id => user.id, :publisher_id => publisher.id, :publisher_member_id => publisher_member.id)
               if publisher_user.save
                  sign_in user
                  redirect_to '/Publisher'
              else
                #
              end
              
            else
              #
            end
            # flash[:success] = "Welcome to The Learning Counsel!"
        else
          # flash.now[:notice] = "Password Creation Failed"
        end
    else
      # flash.now[:notice] = "Password Creation Failed"
      redirect_to :action => 'new'
    end

    
    # render text: user.id


  end
    
    
  def edit
  end

  
  def update
  end


  def delete
  end


  def destroy
  end




  # def new_pwd_reset
    # ar = params[:user]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
    # email = h_obj[:email]
    # user = User.find_by_email(params[:email])
    # user.send_password_reset if user
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :email => email } }
    # end
  # end
  # def edit_pwd_reset
    # # ar = params[:publisher_product_description]
    # # h_obj = Hash.new
    # # ar.each do |obj|
      # # h_obj = obj
    # # end
    # # publisher_product_description_id = h_obj[:publisher_product_description_id]
  # end


    
  def dbdelete
      User.dbdelete
      User.dbclear

      redirect_to :action => 'index'      
  end

    
  def reset_users
    
      User.dbdelete
      User.dbclear

      UserProfileImage.dbdelete
      UserProfileImage.dbclear

      Publisher.dbdelete
      Publisher.dbclear

      PublisherUser.dbdelete
      PublisherUser.dbclear

      PublisherMember.dbdelete
      PublisherMember.dbclear

      PublisherUserImage.dbdelete
      PublisherUserImage.dbclear

      PublisherProfileImage.dbdelete
      PublisherProfileImage.dbclear

      PublisherProduct.dbdelete
      PublisherProduct.dbclear

      PublisherProductDescription.dbdelete
      PublisherProductDescription.dbclear

      PublisherProductImage.dbdelete
      PublisherProductImage.dbclear

      PublisherProduct1Image.dbdelete
      PublisherProduct1Image.dbclear

      PublisherProduct2Image.dbdelete
      PublisherProduct2Image.dbclear

      PublisherProductLogo.dbdelete
      PublisherProductLogo.dbclear

      PublisherProductCorporateLogo.dbdelete
      PublisherProductCorporateLogo.dbclear

      PublisherProductPdf.dbdelete
      PublisherProductPdf.dbclear

      PublisherProductPdfImage.dbdelete
      PublisherProductPdfImage.dbclear

      PublisherProductContentType.dbdelete
      PublisherProductContentType.dbclear

      PublisherProductCategorySubject.dbdelete
      PublisherProductCategorySubject.dbclear

      PublisherProductAppropriateAge.dbdelete
      PublisherProductAppropriateAge.dbclear

      PublisherProductAppropriateGrade.dbdelete
      PublisherProductAppropriateGrade.dbclear

      PublisherProductMarketTarget.dbdelete
      PublisherProductMarketTarget.dbclear

      PublisherProductPlatform.dbdelete
      PublisherProductPlatform.dbclear

      PublisherProductFileType.dbdelete
      PublisherProductFileType.dbclear

      PublisherProductCharacter.dbdelete
      PublisherProductCharacter.dbclear

      PublisherProductEnhancement.dbdelete
      PublisherProductEnhancement.dbclear

      PublisherProductByReview.dbdelete
      PublisherProductByReview.dbclear

      PublisherProductPricingModel.dbdelete
      PublisherProductPricingModel.dbclear

      PublisherProductPrice.dbdelete
      PublisherProductPrice.dbclear

      PublisherProductLessonTime.dbdelete
      PublisherProductLessonTime.dbclear

      PublisherProductCoreLiteracyStandard.dbdelete
      PublisherProductCoreLiteracyStandard.dbclear

      PublisherProductCoreMathStandard.dbdelete
      PublisherProductCoreMathStandard.dbclear

 
      redirect_to '/'      
  end
    
    
    
  private

    def user_params
      params.require(:user).permit(
                                    :name_first,
                                    :name_last,
                                    :email, 
                                    :username, 
                                    :account_type, 
                                    :has_account, 
                                    :password, 
                                    :password_confirmation, 
                                    :bd_month,
                                    :bd_day,
                                    :bd_year,
                                    :gender,
                                    :gender_text,
                                    :account_type,
                                    :account_type_text,
                                  )
                                  
    end

    
  end