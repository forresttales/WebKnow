module PublisherMembersHelper
  
  def publisher_member_avatar_for(publisher_member)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherUserImage.where("publisher_user_id = ?", publisher_member.publisher_user.id).first
    if !img.nil?     
      avatar_url = img.image_url(:user_100_100)
    else
      avatar_url = "/images_avatar/avatar_generic_1_w100_h100.png"
    end
      image_tag(avatar_url, alt: "no image", class: "")
  end  

  
end
