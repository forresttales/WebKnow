module PublisherUserHomesHelper

  # def sortable(column, title = nil)
    # title ||= column.titleize
    # css_class = column == sort_column ? "current #{sort_direction}" : nil
    # direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    # link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end
  # def yesno(x)
    # x ? "Yes" : "No"
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


end
