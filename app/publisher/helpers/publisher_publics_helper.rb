module PublisherPublicsHelper

  def avatar_publisher_public(publisher_public)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProfileImage.where("publisher_id = ?", public_publisher.id).where(:primary => true).first
    if !img.nil?     
      avatar_url = img.image_url(:profile_100_100)
    else
      avatar_url = "/images_avatar/avatar_generic_1_w100_h100.png"
    end
      image_tag(avatar_url, alt: "no image", class: "")
  end  

  
end
