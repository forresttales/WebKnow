class PublisherUserPublicsController < ApplicationController

  # layout 'public_publisher_user'
  # layout 'public_publisher_user_publics_index'  

  # before_action :verify_signin
  # before_action :verify_id_public
  # before_action :fill_left_directory_public
  respond_to :html, :js, :json  
  # helper_method :sort_column, :sort_direction, :yesno

  # before_action :signed_in_user, only: [:index]
    
  # before_action :index_verify, only: [:index]

  # @@user = nil
  
  
  
  
  # def index_verify
# 
    # id_passed = params[:id]
#     
    # Rails.logger.info('in public_publisher_users id_passed = ' + id_passed.to_s)
    # # Rails.logger.info('id_passed not nil')
#     
    # # b_id_exists = IssuedGenId.exists?(:gen_id => id_passed)
    # issued_gen_id = IssuedGenId.where(:gen_id => id_passed).first rescue nil
    # if !issued_gen_id.nil?
        # if signed_in?
            # user_passed = issued_gen_id.user rescue nil
            # if ( user_passed.id == current_user.id )
                # redirect_to :controller => 'publisher_users', :action => 'index', :id => id_passed.to_s
            # else
                # # redirect_to :action => "index", :user => user_passed
                # @@user = user_passed
                # # render :action => "index"
            # end
        # else
            # redirect_to :controller => 'public_publisher_users_signedout', :action => 'index', :id => id_passed.to_s
        # end
    # else
        # redirect_to '/Signin'      
    # end
# 
#     
  # end
  


  def create_user_friend_invitation

      begin

          @relate_user_friend_invitation_exists = false
          @relate_user_friend_invitation_received = false
          @relate_user_friend_invitation_sent = false
          @b_relate_user_friend = false

          user_friend_to_id = params[:user_friend_to_id]
          # Rails.logger.info params.to_yaml

          public_user = User.where(:id => user_friend_to_id).first rescue nil

          if !public_user.nil?
              relate_user_friend_invitation = current_user.relate_user_friend_invitations.build(user_friend_to_id: public_user.id) rescue nil
              if relate_user_friend_invitation.save

                  # @user_friend_invitation_exists = current_user.relate_user_friend_invitations.where(:user_friend_to_id => public_user.id).exists? rescue nil
                  # Rails.logger.info('user_friend_invitation_exists = ' + @user_friend_invitation_exists.to_s)
                  
                  relate_user_friend = current_user.get_relate_user_friend(current_user.id, user.id) rescue nil
                  if relate_user_friend.nil?
                      # Rails.logger.info('relate_user_friend id = ' + relate_user_friend.id.to_s)
                      relate_user_friend_invitation = current_user.get_relate_user_friend_invitation rescue nil
                      # Rails.logger.info('relate_user_friend_invitation id = ' + relate_user_friend_invitation.id.to_s)
                      if !relate_user_friend_invitation.nil?
                          # Rails.logger.info('relate_user_friend_invitation was not nil')
                          user_friend_to_id = relate_user_friend_invitation.user_friend_to_id rescue nil 
                          if !user_friend_to_id.nil?
                              if (user_friend_to_id == current_user.id)
                                  @relate_user_friend_invitation_received = true
                                  @relate_user_friend_invitation_exists = true
                              else
                                  user_friend_from_id = relate_user_friend_invitation.user_friend_from_id rescue nil
                                  if !user_friend_from_id.nil?
                                      if (user_friend_from_id == current_user.id)
                                          @relate_user_friend_invitation_sent = true
                                          @relate_user_friend_invitation_exists = true
                                      else
                                          #
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'users', :action => 'render_index_public_publisher_user', :description => 'user_friend_to_id and user_friend_from_id were both nil')
                                      raise
                                      # Rails.logger.info('user_friend_to_id and user_friend_from_id were both nil')
                                  end
                              end
                          else
                              #
                          end
                      else
                          # Rails.logger.info('relate_user_friend_invitation was nil')
                      end
                  else
                      @b_relate_user_friend = true
                      # Rails.logger.info('relate_user_friend was nil')
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'public_publisher_users', :action => 'create_user_friend_invitation', :description => 'relate_user_friend_invitation save failed')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'public_publisher_users', :action => 'create_user_friend_invitation', :description => 'public_user was nil')
              raise
          end

      rescue StandardError => e
          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'public_publisher_users', :action => 'create_user_friend_invitation', :description => e.message.to_s)
      end

    
  end



end
