module PublisherUsersHelper

  # def index_publisher_user
      # Rails.logger.info('in index_publisher_user')
      # @test = 'IndexPublisherUsers'
      # render 'publisher_users/index', :layout => 'publisher_users_index'
  # end

  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end


  def yesno(x)
    x ? "Yes" : "No"
  end



  # def post_user_avatar_for(user, s_rand)
    # img = user.user_images.where( :primary => true ).first rescue nil
    # # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    # if !img.nil?     
      # post_user_avatar_url = img.image_url(:image_50_50)
    # else
      # post_user_avatar_url = "../images_avatar/avatar-gen-person-w50-h50.png"
    # end
      # image_tag(post_user_avatar_url + s_rand, alt: "", class: "")
  # end  
  # def post_user_has_like_for(post_user)
#     
      # b_has_like = false
      # post_user_like = post_user.post_user_likes.where("user_id = ?", current_user.id).first rescue nil
      # if !post_user_like.nil?
          # b_has_like = true
      # end
#       
      # return b_has_like                      
  # end
  # def post_user_comment_avatar_for(user, s_rand)
    # img = user.user_images.where( :primary => true ).first rescue nil
    # # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    # if !img.nil?     
      # post_user_comment_avatar_url = img.image_url(:image_34_34)
    # else
      # post_user_comment_avatar_url = "../images_avatar/avatar-gen-person-w34-h34.png"
    # end
      # image_tag(post_user_comment_avatar_url + s_rand, alt: "", class: "")
  # end  



  # def post_user_avatar_for(user)
    # img = PublisherUserImage.where("user_id = ?", user.id).first     
    # avatar_url = img.img_url
    # if ((avatar_url.blank?) or (avatar_url.empty?) or (avatar_url.nil?))
      # user_avatar_url = "../images_avatar/avatar_generic_1_w50_h50.png"     
    # end
      # image_tag(user_avatar_url, alt: "", class: "")
  # end  


  # def post_user_avatar_for(user, s_rand)
    # img = user.user_images.where( :primary => true ).first rescue nil
    # # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    # if !img.nil?     
      # post_user_avatar_url = img.image_url(:image_50_50)
    # else
      # post_user_avatar_url = "../images_avatar/avatar-gen-person-w50-h50.png"
    # end
      # image_tag(post_user_avatar_url + s_rand, alt: "", class: "")
  # end  


  def log_user_avatar_for(user)
    img = user.user_images.where( :primary => true ).first rescue nil
    # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    if !img.nil?     
      log_user_avatar_url = img.image_url(:user_50_50)
    else
      log_user_avatar_url = "../images_avatar/avatar-gen-person-w50-h50.png"
    end
      image_tag(log_user_avatar_url, alt: "", class: "")
  end  


  # def post_user_has_like_for(post_user)
#     
      # b_has_like = false
      # post_user_like = post_user.post_user_likes.where("user_id = ?", current_user.id).first rescue nil
      # if !post_user_like.nil?
          # b_has_like = true
      # end
#       
      # return b_has_like                      
  # end


  def log_user_has_like_for(log_user)
    
      b_has_like = false
      post_user_like = log_user.post_user_likes.where("user_id = ?", current_user.id).first rescue nil
      if !post_user_like.nil?
          b_has_like = true
      end
      
      return b_has_like                      
  end


  # def post_user_comment_avatar_for(user, s_rand)
    # img = user.user_images.where( :primary => true ).first rescue nil
    # # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    # if !img.nil?     
      # post_user_comment_avatar_url = img.image_url(:image_34_34)
    # else
      # post_user_comment_avatar_url = "../images_avatar/avatar-gen-person-w34-h34.png"
    # end
      # image_tag(post_user_comment_avatar_url + s_rand, alt: "", class: "")
  # end  


  # def post_user_like_avatars_for(post_user)
      # post_user_likes = post_user.post_user_likes
      # if !post_user_like.nil?
          # b_has_like = true
      # end
      # return b_has_like                      
  # end



  # def publisher_product_name_product_for(publisher_product)
    # # publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product.id).first
    # publisher_product_description = publisher_product.publisher_product_description
    # publisher_product_description_name_product = publisher_product_description.name_product
  # end  



  # def publisher_product_logo_for(publisher_product)
    # # img = UserProfileImage.where("user_id = ?", user.id).first     
    # img = PublisherProductLogo.where("publisher_product_id = ?", publisher_product.id).first
    # if !img.nil?     
      # publisher_product_logo_url = img.image_url(:image_100_100)
    # else
      # publisher_product_logo_url = "../images_publisher_product_logo/image_company_generic_w100_h100_1.png"
    # end
      # image_tag(publisher_product_logo_url, alt: "", class: "")
  # end  
  
end
