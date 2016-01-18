module UsersHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end


  def yesno(x)
    x ? "Yes" : "No"
  end

  # def post_user_avatar_for(user)
    # img = PublisherUserImage.where("user_id = ?", user.id).first     
    # avatar_url = img.img_url
    # if ((avatar_url.blank?) or (avatar_url.empty?) or (avatar_url.nil?))
      # user_avatar_url = "../images_avatar/avatar_generic_1_w50_h50.png"     
    # end
      # image_tag(user_avatar_url, alt: "", class: "")
  # end  


  def post_user_avatar_for(user, s_rand)
    img = user.user_images.where( :primary => true ).first rescue nil
    # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    if !img.nil?     
      post_user_avatar_url = img.image_url(:image_50_50)
    else
      post_user_avatar_url = "../images_avatar/avatar-gen-person-w50-h50.png"
    end
      image_tag(post_user_avatar_url + s_rand, alt: "", class: "")
  end  

  def post_user_has_like_for(post_user)
    
      b_has_like = false
      post_user_like = post_user.post_user_likes.where("user_id = ?", current_user.id).first rescue nil
      if !post_user_like.nil?
          b_has_like = true
      end
      
      return b_has_like                      
  end

  def post_user_comment_avatar_for(user, s_rand)
    img = user.user_images.where( :primary => true ).first rescue nil
    # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    if !img.nil?     
      post_user_comment_avatar_url = img.image_url(:image_34_34)
    else
      post_user_comment_avatar_url = "../images_avatar/avatar-gen-person-w34-h34.png"
    end
      image_tag(post_user_comment_avatar_url + s_rand, alt: "", class: "")
  end  




  # def avatar_for(user)
    # # img = UserProfileImage.where("user_id = ?", user.id).first     
    # img = UserProfileImage.where("user_id = ?", user.id).first
    # if !img.nil?     
      # avatar_url = img.image_url(:profile_50_50)
    # else
      # avatar_url = "/images_avatar/avatar_generic_1_w50_h50.png"
    # end
      # image_tag(avatar_url, alt: user.name_first, class: "")
  # end  
# 
# 
  # def avatar_test
    # return "helper"  
  # end



  def post_publisher_avatar_for(publisher, s_rand)
    img = publisher.publisher_logo_images.first rescue nil     
    if !img.nil?     
      post_publisher_avatar_url = img.image_url(:image_50_50)
    else
      post_publisher_avatar_url = "../images_avatar/avatar-gen-corp-w50-h50.png"
    end
      image_tag(post_publisher_avatar_url + s_rand, alt: "", class: "")
  end  

  def log_publisher_avatar_for(publisher)
    img = publisher.publisher_logo_images.where( :primary => true ).first     
    if !img.nil?     
      log_publisher_avatar_url = img.image_url(:image_50_50)
    else
      log_publisher_avatar_url = "../images_avatar/avatar-gen-corp-w50-h50.png"
    end
      image_tag(log_publisher_avatar_url, alt: "", class: "")
  end  


  def post_publisher_has_like_for(post_publisher)
    
      b_has_like = false
      post_publisher_like = post_publisher.post_publisher_likes.where("user_id = ?", current_user.id).first rescue nil
      if !post_publisher_like.nil?
          b_has_like = true
      end
      
      return b_has_like                      
  end


  def log_publisher_has_like_for(log_publisher)
    
      b_has_like = false
      post_publisher_like = log_publisher.post_publisher_likes.where("publisher_id = ?", current_user.publisher.id).first rescue nil
      if !post_publisher_like.nil?
          b_has_like = true
      end
      
      return b_has_like                      
  end


  # def post_publisher_comment_avatar_for(publisher, s_rand)
    # img = publisher.publisher_logo_images.first rescue nil     
    # if !img.nil?     
      # post_publisher_comment_avatar_url = img.image_url(:user_34_34)
    # else
      # post_publisher_comment_avatar_url = "../images_avatar/avatar-gen-corp-w34-h34.png"
    # end
      # image_tag(post_publisher_comment_avatar_url + s_rand, alt: "", class: "")
  # end  

  def post_publisher_comment_avatar_for(user, s_rand)
    img = user.user_images.where( :primary => true ).first rescue nil
    # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    if !img.nil?     
      post_publisher_comment_avatar_url = img.image_url(:image_34_34)
    else
      post_publisher_comment_avatar_url = "../images_avatar/avatar-gen-person-w34-h34.png"
    end
      image_tag(post_publisher_comment_avatar_url + s_rand, alt: "", class: "")
  end  


  # def log_user_avatar_for(user)
    # img = user.user_images.where( :primary => true ).first     
    # # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    # if !img.nil?     
      # log_user_avatar_url = img.image_url(:user_50_50)
    # else
      # log_user_avatar_url = "../images_avatar/avatar_generic_1_w50_h50.png"
    # end
      # image_tag(log_user_avatar_url, alt: "", class: "")
  # end  

  
end
