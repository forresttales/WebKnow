# todo list...
# updates require auto-email response
class PublisherUserRegistersController < ApplicationController

  prepend_view_path 'app/views/publisher/user'

  layout 'publisher_user_register'

  respond_to :html, :js, :json  

  # helper_method :sort_column, :sort_direction, :yesno

  before_action :verify_signin, only: [:register_1]
  before_action :verify_signin_post, only: [:update_user_personal, :update_user_email, :update_user_password]


  def verify_signin
    
      if !signed_in?
          redirect_to '/Signin'
      end
      
  end

  def verify_signin_post

      # Rails.logger.info('before action post')
    
      if !signed_in?
          respond_to do |format|
            format.html {}
            format.json { render :json => { :status => "Update!"} }
        end
      end
      
  end


  def register_1

      @user_personal = current_user
      @bd_years = BdYear.all

      # gon.user_birthday = {'day': @user_personal.bd_day, 'month': @user_personal.bd_month, 'year': @user_personal.bd_year}
      gon.user_birthday = { :day => @user_personal.bd_day, :month => @user_personal.bd_month, :year => @user_personal.bd_year }
      
      gon.user_gender = @user_personal.gender

      # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
    
  end


  def register_2
    
  end


  def register_3
    
  end


  def register_4
    
  end


  def register_5
    
  end


  # def render_index_publisher
      # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
  # end


  # def render_index_publisher
      # @user_personal = current_user
      # @bd_years = BdYear.all
      # gon.user_birthday = {'day': @user_personal.bd_day, 'month': @user_personal.bd_month, 'year': @user_personal.bd_year}
      # gon.user_gender = @user_personal.gender
      # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
  # end

  def update_user_personal      

    bd_day = params[:bd_day]
    bd_month = params[:bd_month]
    bd_year = params[:bd_year]
    gender = params[:gender]
    
    bd_month_text = get_bd_month_text(bd_month.to_s)
    gender_text = get_gender_text(gender)

    h_update = Hash.new
    h_update[:bd_day] = bd_day
    h_update[:bd_month] = bd_month
    h_update[:bd_month_text] = bd_month_text
    h_update[:bd_year] =bd_year
    h_update[:gender] = gender
    h_update[:gender_text] = gender_text

    # if current_user.update_attributes( :bd_day => bd_day,
                                       # :bd_month => bd_month,
                                       # :bd_year => bd_year,
                                       # :bd_month_text => bd_month_text,
                                       # :gender => gender,
                                       # :gender_text => gender_text )

    if current_user.update_attributes(h_update)

        bd_day_updated = current_user.bd_day rescue nil
        bd_month_updated = current_user.bd_month rescue nil
        bd_month_text_updated = current_user.bd_month_text rescue nil
        bd_year_updated = current_user.bd_year rescue nil
        gender_updated = current_user.gender rescue nil
        gender_text_updated = current_user.gender_text rescue nil

        if !((bd_day_updated.nil?) or (bd_month_updated.nil?) or (bd_month_text_updated.nil?) or (bd_year_updated.nil?) or (gender_updated.nil?) or (gender_text_updated.nil?))
            respond_to do |format|
                format.html {}
                format.json { render :json => { :status => "Saved!",
                                                :bd_day => bd_day_updated,
                                                :bd_month => bd_month_updated,
                                                :bd_month_text => bd_month_text_updated,
                                                :bd_year => bd_year_updated,
                                                :gender => gender_updated,
                                                :gender_text => gender_text_updated
                                              } 
                            }
            end
        else
            # log error - failed to retrieve update
        end
    else
        # log error - update_attributes failed
        respond_to do |format|
            format.html {}
            format.json { render :json => { :status => "Error: Not saved!"} }
        end
    end
       
  end


  def update_user_email

    #Validate old_email with current_user.email if needed
    old_email = params[:user_old_email]
    new_email = params[:user_new_email]

    if current_user.update_attribute(:email, new_email)
        new_email_updated = current_user.email rescue nil
        if !(new_email_updated.nil?)
            respond_to do |format|
                format.html {}
                format.json { render :json => { :status => "Saved!",
                                                :new_email => new_email_updated
                                              } 
                            }
            end
        else
          # log error - failed to retrieve update
        end
    else
        # log error - update_attributee failed
        respond_to do |format|
          format.html {}
          format.json { render :json => { :status => "Error: Not saved!"} }
        end
    end

  end


  def update_user_password
    # @responce = "Responce"

    user_old_password = params[:user_old_password]
    user_new_password = params[:user_new_password]
    user_confirm_password = params[:user_confirm_password]
    
    if check_user_password(user_old_password)

        h_update = Hash.new
        h_update[:password] = user_new_password
        h_update[:password_confirmation] = user_confirm_password

        if current_user.update_attributes(h_update)
            respond_to do |format|
              format.js
              format.json { render :json => { :status => "Saved!" } }
            end
        else
            respond_to do |format|
              format.js
              format.json { render :json => { :status => "Error: Not saved!" } }
            end
        end

    else
        respond_to do |format|
          format.js
          format.json { render :json => { :status => "Wrong password!" } }
        end
    end

    # respond_to do |format|
    #   format.js
    #   format.json { render :json => { :status => verithy_user_password,
    #                                   :user_old_password => user_old_password,
    #                                   :user_new_password => user_new_password, 
    #                                   :user_confirm_password => user_confirm_password 
    #                                   } 
    #               }     
    # end

  end

  def get_gender_text(gender)
    
      gender_text = 0
      
      case gender.to_s
      when "0"
        gender_text = "Male"
      when "1"
        gender_text = "Female"
      else
        # 
      end
  
      return gender_text    
  end



  def get_bd_month_text(bd_month)
    
      bd_month_text = ""
      
      case bd_month
      when "1"
        bd_month_text = "January"
      when "2"
        bd_month_text = "February"
      when "3"
        bd_month_text = "March"
      when "4"
        bd_month_text = "April"
      when "5"
        bd_month_text = "May"
      when "6"
        bd_month_text = "June"
      when "7"
        bd_month_text = "July"
      when "8"
        bd_month_text = "August"
      when "9"
        bd_month_text = "September"
      when "10"
        bd_month_text = "October"
      when "11"
        bd_month_text = "November"
      when "12"
        bd_month_text = "December"
      else
        # 
      end
      
      return bd_month_text
  end

  def check_user_password(password)
    
    authorized_user = current_user.authenticate(password)
    if authorized_user
      return true
    else
      return false
    end
    
  end

end




# # todo list...
# # updates require auto-email response
# class PublisherUserRegistersController < ApplicationController
# 
  # # before_filter :force_http
# 
  # layout 'publisher_user_register'
# 
  # respond_to :html, :js, :json  
# 
  # # helper_method :sort_column, :sort_direction, :yesno
  # # before_action :verify_signin, only: [:index]
  # before_action :verify_signin
# 
# 
  # def verify_signin
#     
      # if !signed_in?
          # redirect_to '/Signin'
      # end
#       
  # end
# 
# 
  # def register_1
#     
      # @user_personal = current_user
      # @bd_years = BdYear.all
# 
      # # gon.user_birthday = {'day': @user_personal.bd_day, 'month': @user_personal.bd_month, 'year': @user_personal.bd_year}
      # gon.user_birthday = { :day => @user_personal.bd_day, :month => @user_personal.bd_month, :year => @user_personal.bd_year }
# 
      # gon.user_gender = @user_personal.gender
# 
      # # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
#     
  # end
# 
# 
  # def register_2
#     
  # end
# 
# 
  # def register_3
#     
  # end
# 
# 
  # def register_4
#     
  # end
# 
# 
  # def register_5
#     
  # end
# 
# 
  # # def render_index_publisher
      # # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
  # # end
# 
# 
  # # def render_index_publisher
      # # @user_personal = current_user
      # # @bd_years = BdYear.all
      # # gon.user_birthday = {'day': @user_personal.bd_day, 'month': @user_personal.bd_month, 'year': @user_personal.bd_year}
      # # gon.user_gender = @user_personal.gender
      # # render 'user_registers/index_publisher', :layout => 'index_user_register_publisher'
  # # end
# 
  # def update_user_personal
#       
      # bd_day = params[:bd_day]
      # bd_month = params[:bd_month]
      # bd_year = params[:bd_year]
      # gender = params[:gender]
#       
      # bd_month_text = get_bd_month_text(bd_month)
      # gender_text = get_gender_text(gender)
# 
      # h_update = Hash.new
      # h_update[:bd_day] = bd_day
      # h_update[:bd_month] = bd_month
      # h_update[:bd_month_text] = bd_month_text
      # h_update[:bd_year] =bd_year
      # h_update[:gender] = gender
      # h_update[:gender_text] = gender_text
# 
      # # if current_user.update_attributes( :bd_day => bd_day,
                                         # # :bd_month => bd_month,
                                         # # :bd_year => bd_year,
                                         # # :bd_month_text => bd_month_text,
                                         # # :gender => gender,
                                         # # :gender_text => gender_text )
# 
      # if current_user.update_attributes(h_update)
# 
          # bd_day_updated = current_user.bd_day rescue nil
          # bd_month_updated = current_user.bd_month rescue nil
          # bd_month_text_updated = current_user.bd_month_text rescue nil
          # bd_year_updated = current_user.bd_year rescue nil
          # gender_updated = current_user.gender rescue nil
          # gender_text_updated = current_user.gender_text rescue nil
# 
          # if !((bd_day_updated.nil?) or (bd_month_updated.nil?) or (bd_month_text_updated.nil?) or (bd_year_updated.nil?) or (gender_updated.nil?) or (gender_text_updated.nil?))
              # respond_to do |format|
                  # format.html {}
                  # format.json { render :json => { :status => "Saved!",
                                                  # :bd_day => bd_day_updated,
                                                  # :bd_month => bd_month_updated,
                                                  # :bd_month_text => bd_month_text_updated,
                                                  # :bd_year => bd_year_updated,
                                                  # :gender => gender_updated,
                                                  # :gender_text => gender_text_updated,
                                                # } 
                              # }
              # end
          # else
              # # log error - failed to retrieve update
          # end
      # else
          # # log error - update_attributes failed
          # respond_to do |format|
              # format.html {}
              # format.json { render :json => { :status => "Error: Not saved!"} }
          # end
      # end  
  # end
# 
# 
# 
  # def get_gender_text(gender)
#     
      # gender_text = 0
#       
      # case gender.to_s
      # when "0"
        # gender_text = "Male"
      # when "1"
        # gender_text = "Female"
      # else
        # # 
      # end
#   
      # return gender_text    
  # end
# 
# 
# 
  # def get_bd_month_text(bd_month)
#     
      # bd_month_text = ""
#       
      # case bd_month
      # when "1"
        # bd_month_text = "January"
      # when "2"
        # bd_month_text = "February"
      # when "3"
        # bd_month_text = "March"
      # when "4"
        # bd_month_text = "April"
      # when "5"
        # bd_month_text = "May"
      # when "6"
        # bd_month_text = "June"
      # when "7"
        # bd_month_text = "July"
      # when "8"
        # bd_month_text = "August"
      # when "9"
        # bd_month_text = "September"
      # when "10"
        # bd_month_text = "October"
      # when "11"
        # bd_month_text = "November"
      # when "12"
        # bd_month_text = "December"
      # else
        # # 
      # end
#       
      # return bd_month_text
  # end
# 
# 
# 
# end
