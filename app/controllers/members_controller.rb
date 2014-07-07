class MembersController < ApplicationController

  include ActiveModel::Conversion
  
  layout 'member'

  before_action :already_signed_in, only: [:new]

  # force_ssl

  # def to_partial_path
    # 'members/member'
  # end
  
  
  def index
    @users = User.paginate(page: params[:page])    
    
    @members = @users    
    # @members = User.paginate(:per_page => 200, :page => params[:page])
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

  
end
