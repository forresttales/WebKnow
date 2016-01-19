class PublisherMembersController < ApplicationController

  include ActiveModel::Conversion

  prepend_view_path 'app/views/publisher/profile'
    
  layout 'publisher_member'

  respond_to :html, :js, :json  

  # before_action :already_signed_in, only: [:new]

  # force_ssl

  
  
  def index

    @publisher_members = PublisherMember.all
    # publisher = Publisher.where("user_id = ?", current_user.id).first
    # @publisher_id = publisher.id
    
    # respond_to do |format|
      # format.html
      # format.js
     # end
     
    
  end



  def test
    
    @clyde = "clyde is in test"
    
  end



  def return_members
    
    # @test = params[:user_profile_type]
    # @test = 'clyde'

    # user_profile_type = params[:user_profile_type]
    # @public_users = nil    
    # case user_profile_type.to_s   
      # when "0"
        # @public_users = PublicUser.all
      # when "1"
        # @public_users = PublicUser.all
      # when "2"
        # @public_users = PublicUser.all
      # when "3"
        # @public_users = PublicUser.all
      # when "4"
        # @public_users = PublicUser.all
      # when "5"
        # @public_users = PublicUser.all
      # when "6"
        # @public_users = PublicUser.all
      # else
        # #        
    # end
    
    respond_to do |format|
      format.html
      format.js
    end

    
  end



  def add_member
    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    publisher_id = publisher_user.publisher_id
    # publisher = Publisher.find_by_id(publisher_id)
    
    # publisher = Publisher.where("user_id = ?", current_user.id).first

    user = User.new(params[:user])
    # user.name_first = "bfirst"
    # user.name_last = "blast"
    # user.email = "b@b.com"
    # user.password = "bbbb"    
    user.account_type = 2
    user.account_type_text = "publisher"

    if user.save
        publisher_member = PublisherMember.new(:user_id => user.id, :publisher_id => publisher_id)
        if publisher_member.save
            publisher_user = PublisherUser.new(:user_id => user.id, :publisher_id => publisher_id, :publisher_member_id => publisher_member.id)
            if publisher_user.save
                @publisher_members = PublisherMember.all
              # sign_in user
              # redirect_to '/Publisher'
            else
              #
            end
        else
          #
        end      
    else
      user.errors.full_messages
    end

    
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

  
  
    def user_params
      params.require(:publisher_member).permit(
                                              :user_id,
                                              :publisher_id,
                                              :publisher_user_id, 
                                              )
    end

  
  private


    # def sort_column
      # PublisherProduct.column_names.include?(params[:sort]) ? params[:sort] : "id"
    # end
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    # end
  
  

end
