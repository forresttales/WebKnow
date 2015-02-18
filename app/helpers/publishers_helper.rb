module PublishersHelper

  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end


  def yesno(x)
    x ? "Yes" : "No"
  end


  def post_publisher_avatar_for(user)
    img = user.user_images.where( :primary => true ).first     
    if !img.nil?     
      post_publisher_avatar_url = img.image_url(:user_50_50)
    else
      post_publisher_avatar_url = "../images_avatar/avatar_generic_1_w50_h50.png"
    end
      image_tag(post_publisher_avatar_url, alt: "", class: "")
  end  


  def log_publisher_avatar_for(user)
    img = user.user_images.where( :primary => true ).first     
    # img = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id).where( :primary => true ).first
    if !img.nil?     
      log_publisher_avatar_url = img.image_url(:user_50_50)
    else
      log_publisher_avatar_url = "../images_avatar/avatar_generic_1_w50_h50.png"
    end
      image_tag(log_publisher_avatar_url, alt: "", class: "")
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
