class UserImagesController < ApplicationController
  
  layout 'publisher'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno



  
  # def upload_user_image
# 
      # @id_image = nil
      # @crop_x = 0
      # @crop_y = 0
      # @crop_w = 200
      # @crop_h = 200
#       
      # h_user_image = Hash.new
      # h_user_image[:image] = params[:user_image][:image]
      # h_user_image[:primary] = params[:user_image][:primary]
      # h_user_image[:crop_x] = @crop_x
      # h_user_image[:crop_y] = @crop_y
      # h_user_image[:crop_w] = @crop_w
      # h_user_image[:crop_h] = @crop_h
#       
      # user_image = UserImage.new(h_user_image)
      # if request.xhr? || remotipart_submitted?
          # if user_image.save
              # user_image_primary = current_user.user_images.where( :primary => true ).first rescue nil     
              # if !user_image_primary.nil? 
                  # @id_image = user_image_primary.id
                  # @user_image_primary = user_image_primary
                  # img = user_image_primary
                  # image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  # w = image.columns
                  # h = image.rows
                  # w_max = false
                  # h_max = false
                  # w_h_equal = false
                  # x = 0
                  # y = 0
                  # l = 0                    
                  # d = 0
                  # if ( w == h)
                      # w_h_equal = true
                  # else
                      # if ( w > h )
                        # w_max = true
                      # else
                        # h_max = true
                      # end
                  # end
                  # if w_max
                      # d = w - h
                      # d = (d/2).round
                      # x = d
                      # l = h  
                  # end
                  # if h_max
                      # d = h - w
                      # d = (d/2).round
                      # y = d
                      # l = w  
                  # end
                  # if w_h_equal
                      # l = w
                  # end
                  # @crop_x = x
                  # @crop_y = y
                  # @crop_w = l
                  # @crop_h = l
                  # h_update = Hash.new
                  # h_update[:crop_x] = x
                  # h_update[:crop_y] = y
                  # h_update[:crop_w] = l
                  # h_update[:crop_h] = l
                  # if user_image_primary.update_attributes(h_update)
                    # #                      
                  # else
                    # #  
                  # end
              # end
          # else
            # # error save
          # end
      # else
        # # 
      # end
#   
  # end



  private


    # def user_image_params
      # params.require(:user_image).permit(
                                          # :user_id,
                                          # :publisher_id,
                                        # )
    # end

    def sort_column_posts
      PostUser.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end


  
end
