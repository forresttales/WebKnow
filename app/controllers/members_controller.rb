class MembersController < ApplicationController

  include ActiveModel::Conversion
  
  layout 'member'

  respond_to :html, :js, :json  

  before_action :already_signed_in, only: [:new]

  # force_ssl

  # def to_partial_path
    # 'members/member'
  # end
  
  
  
  def index

    # @public_users = PublicUser.all
    
    # ar = params[:members]
    # h_obj = Hash.new
    # if !ar.nil?
      # ar.each do |obj|
        # h_obj = obj
      # end
    # else
      # h_obj[:clyde] = "nil"
    # end
    # @clyde = h_obj[:clyde]
    
    # @public_users = PublicUser.where("id = ?", 1)
    # user = User.where("id = ?", current_user.id)
    # publisher = Publisher.where("user_id = ?", current_user.id)
    # publisher_user = PublisherUser.where("publisher_id = ? AND user_id = ?", publisher.id, current_user_id).first
    # publisher_user_images = PublisherUserImages.where("publisher_id = ? AND publisher_user_id = ?", publisher.id, publisher_user.id)
    # @publisher_user_image_primary = publisher_user_images.first
    @public_publisher_users = PublicPublisherUser.all 
    # @public_users = public_publisher_users
    # @public_publisher_users = PublicPublisherUser.where("id = ?", 1)

    # @public_users = PublicUser.all

    # @public_users = nil


    # @public_users = PublicUser.paginate(page: params[:page])    
    
    # @members = @users    
    # @members = User.paginate(:per_page => 200, :page => params[:page])
    
    # @publisher_id = current_user.publisher.id
    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).order(sort_column + " " + sort_direction) # .paginate(:per_page => 200, :page => params[:page])
    
    # @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
    # @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html
      format.js
      # format.json { render :json => { :msg => msg,
                                      # :user_age_range_1 => user_age_range_1,
                                      # :user_age_range_2 => user_age_range_2
                  # }                 }      

      # format.json { render :json => { :clyde => @clyde } }
      
     end
     
     
    
  end


  def test
    
    @clyde = "clyde is in test"
    
  end



  def all_users

    # @user_image_primary = nil
    # @user_account_type = nil
    # @user_id = nil

    # h_public_user = Hash.new
    

    # users.each do |user|
      # public_user = PublicUser.new
      # # user_account_type = user.account_type
      # # case user_account_type.to_s   
        # # when "1"
          # # #
        # # when "2"
          # # #
        # # when "3"
          # # public_user.name_first = user.name_first
          # # public_user.name_last = user.name_last
          # # public_user.user_id = user.id
          # # public_user.image = PublisherUserImage.where("user_id = ? AND primary = ?", user.id, true) 
          # # #
        # # when "4"
          # # #
        # # when "5"
          # # #
        # # else
          # # #        
      # # end
    # end

    public_users = PublicUser.all      
      
      
    return public_users      
      
  end



  def return_users
    
    # ar = params[:users]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end

    # user_age_range_1 = h_obj[:user_age_range_1]
    # user_age_range_2 = h_obj[:user_age_range_2]
    
    # @users = Users.all
    
    # render locals: {
      # public_users: PublicUser.all
    # }
    
    # @user_profile_type = params[:user_profile_type]
    # @test = params[:user_profile_type]

    user_profile_type = params[:user_profile_type]
    
    @public_users = nil
    # @public_publishers = nil    
    
    case user_profile_type.to_s   
      when "0"
        @public_users = PublicUser.all
      when "1"
        @public_users = PublicUser.all
      when "2"
        @public_users = PublicPublisher.all
      when "3"
        # @public_users = PublicUser.all
      when "4"
        # @public_users = PublicUser.all
      when "5"
        # @public_users = PublicUser.all
      when "6"
        # @public_users = PublicUser.all
      else
        #        
    end

    @user_profile_type = user_profile_type

    # @clyde = 'clyde in controller'
    
    
    # msg = "all users"
    

    # @clyde = 'clyde in controller'
    
    respond_to do |format|
      format.html
      # format.js
      # format.json { render :json => { :msg => msg,
                                      # :user_age_range_1 => user_age_range_1,
                                      # :user_age_range_2 => user_age_range_2
                  # }                 }      

      # format.json { render :json => { :clyde => @clyde, :public_users => @return_public_users } }
      # format.json { render json: @public_users, status: :created, location: @public_users }
      # format.json { render :partial => 'members/list', :locals => { :clyde => @clyde } }              
      # format.json { render json: @public_users, status: :created, location: @public_users }              

      # format.json { render json: @clyde }              

      # format.json render 'return_users.json'              
      format.js

      
    end

    
  end



  def return_publishers
    
    @public_publishers = PublicPublisher.all

    respond_to do |format|
      format.html
      format.js
    end

    
  end



  def dbdelete
    
  end

  # def show
    # # @member = User.find(params[:id])
  # end

  
  
    # def user_params
      # params.require(:user).permit(
                                    # :name_first,
                                    # :name_last,
                                    # :email, 
                                    # :username, 
                                    # :account_type, 
                                    # :has_account, 
                                    # :password, 
                                    # :password_confirmation, 
                                    # :bd_month,
                                    # :bd_day,
                                    # :bd_year,
                                    # :gender,
                                    # :gender_text,
                                    # :account_type,
                                    # :account_type_text,
                                  # )
    # end

  
  private


    # def sort_column
      # PublisherProduct.column_names.include?(params[:sort]) ? params[:sort] : "id"
    # end
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    # end
  
  
  
end
