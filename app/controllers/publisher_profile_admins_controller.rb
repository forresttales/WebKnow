class PublisherProfileAdminsController < ApplicationController
  
  respond_to :html, :js, :json  
  
  layout 'publisher'

  # before_filter :force_http

        
  def index

    # @publisher_profiles = PublisherProfile.where("publisher_id = ?", session[:publisher_id])    
    @user = User.find(session[:user_id])
    @bd_years = BdYear.order("year_value ASC").all
    
    @user_id = @user.id
    
    gon.bd_month = @user.bd_month
    gon.bd_day = @user.bd_day
    gon.bd_year = @user.bd_year
    gon.gender = @user.gender
    
    # @@user = @user    

    # @publisher_profile = nil
    # if @publisher_profiles.any?
      # @publisher_profile = @publisher_profiles[0]
    # end    
    # @publisher_profile_images = PublisherProfileImage.where("publisher_id = ?", session[:publisher_id])
    
    # @user_profile_images = UserProfileImage.where("user_id = ?", current_user.id)     
    
  end
  
  
  def settings
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    @publisher_id = publisher.id
  end
  
  
  
  def edit

    # Rails.logger.info "clyde was here in edit"
    # Rails.logger.flush    

    @user = User.find(session[:user_id])
    
  end


  def update_name

    ar = params[:user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    user_id = h_obj[:id]
    user = User.find(user_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:name_first] = h_obj[:name_first]
    h_update[:name_last] = h_obj[:name_last]

    if user.update_attributes(h_update)
      #
    else
      Rails.logger.info(@user.errors.messages.inspect)
    end

    user = nil
    user_updated = User.find(user_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :name_first => user_updated.name_first, :name_last => user_updated.name_last } }
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  


  def update_bd

    ar = params[:user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    user_id = h_obj[:id]
    user = User.find(user_id)    
    
    h_update = Hash.new

    bd_month = h_obj[:bd_month]
    h_update[:bd_month] = bd_month
    case bd_month.to_s
      when "1"
        h_update[:bd_month_text] = "January"
      when "2"
        h_update[:bd_month_text] = "February"
      when "3"
        h_update[:bd_month_text] = "March"
      when "4"
        h_update[:bd_month_text] = "April"
      when "5"
        h_update[:bd_month_text] = "May"
      when "6"
        h_update[:bd_month_text] = "June"
      when "7"
        h_update[:bd_month_text] = "July"
      when "8"
        h_update[:bd_month_text] = "August"
      when "9"
        h_update[:bd_month_text] = "September"
      when "10"
        h_update[:bd_month_text] = "October"
      when "11"
        h_update[:bd_month_text] = "November"
      when "12"
        h_update[:bd_month_text] = "December"
      else
        # 
    end
    
    h_update[:bd_day] = h_obj[:bd_day]
    h_update[:bd_year] = h_obj[:bd_year]

    if user.update_attributes(h_update)
      #
    else
      #
    end

    user = nil
    user_updated = User.find(user_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :bd_month => user_updated.bd_month, :bd_month_text => user_updated.bd_month_text, :bd_day => user_updated.bd_day, :bd_year => user_updated.bd_year } }
    end
    
  end  


  def update_email

    ar = params[:user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    user_id = h_obj[:id]
    user = User.find(user_id)    
    
    h_update = Hash.new
    h_update[:email] = h_obj[:email]

    if user.update_attributes(h_update)
      #
    else
      #
    end

    user = nil
    user_updated = User.find(user_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :email => user_updated.email } }
    end
    
  end  


  def update_username

    ar = params[:user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    user_id = h_obj[:id]
    user = User.find(user_id)    
    
    h_update = Hash.new
    h_update[:username] = h_obj[:username]

    if user.update_attributes(h_update)
      #
    else
      #
    end

    user = nil
    user_updated = User.find(user_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :username => user_updated.username } }
    end
    
  end  


  def update_gender

    ar = params[:user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    user_id = h_obj[:id]
    user = User.find(user_id)    
    
    h_update = Hash.new

    gender = h_obj[:gender]
    h_update[:gender] = gender.to_i
    
    case gender
    when 0
      h_update[:gender_text] = "Male"
    when 1
      h_update[:gender_text] = "Female"
    else
      # 
    end

    if user.update_attributes(h_update)
      #
    else
      #
    end

    user = nil
    user_updated = User.find(user_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :gender => user_updated.gender, :gender_text => user_updated.gender_text } }
    end
    
  end  


  def update_password
    
    msg = ""
    user = User.find(params[:user_id])    

    # h_pwd = Hash.new
    # h_pwd = params[:new_password]
    # h_pwd[:password] = "bbbb"
    # h_pwd[:password_confirmation] = "bbbb"
    
    if user && user.authenticate(params[:new_password][:password_current])
        if user.update_attributes(params[:new_password])
          msg ="New password saved"
          Rails.logger.info params[:new_password]
          #flash[:success] = 'Logged In'
        else
          msg ="New password update failed"
          Rails.logger.info(user.errors.messages.inspect)
        end
    else
      msg = "Current password failed"
    end
    
    s_auth = "new_password_status('" + msg + "');"
    
    respond_to do |format|
      format.html {}
      format.js { render :js => s_auth }
    end

    
  end



  # def update_password_verify
     # # render text: 'update_password_verify'
    # auth = false
    # user = User.find(params[:user_id])    
    # if user && user.authenticate(params[:current_password][:password])
    # # if user && user.authenticate("aaaa")
      # auth = true
      # #flash[:success] = 'Logged In'
    # end
    # s_auth = "new_password('" + auth.to_s + "');"
    # respond_to do |format|
      # format.html {}
      # format.js { render :js => s_auth }
    # end
  # end


  private

    def publisher__profiles_params
      params.require(:publisher_profiles).permit(      
                                                :publisher_id, 
                                                :name_logo,
                                                :has_logo
                                              )
                                        
    end

  
  
  
end

