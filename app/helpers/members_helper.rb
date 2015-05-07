module MembersHelper


  def avatar_profile_user_for(user, s_rand)
    img = user.user_images.where( :primary => true ).first rescue nil     
    if !img.nil?     
      user_avatar_url = img.image_url(:user_100_100)
    else
      user_avatar_url = "../images_avatar/avatar-gen-person-w100-h100.png"
    end
      image_tag(user_avatar_url + s_rand, alt: "", class: "")
  end  

  def avatar_profile_for(profile, s_rand)
    profile_avatar_url = "../images_avatar/avatar-gen-corp-w100-h100.png"
    img = profile.publisher_logo_images.where( :primary => true ).first rescue nil     
    if !img.nil?     
      profile_avatar_url = img.image_url(:user_100_100)
    # else
      # profile_avatar_url = "../images_avatar/avatar-gen-corp-w100-h100.png"
    end
      image_tag(profile_avatar_url + s_rand, alt: "", class: "")
  end  


  # def log_publisher_avatar_for(publisher)
    # img = publisher.publisher_logo_images.where( :primary => true ).first     
    # if !img.nil?     
      # log_publisher_avatar_url = img.image_url(:user_50_50)
    # else
      # log_publisher_avatar_url = "../images_avatar/avatar-gen-corp-w50-h50.png"
    # end
      # image_tag(log_publisher_avatar_url, alt: "", class: "")
  # end  



  # def avatar_for(public_user)
    # # img = UserProfileImage.where("user_id = ?", user.id).first     
    # img = UserProfileImage.where("user_id = ?", public_user.id).first
    # if !img.nil?     
      # avatar_url = img.image_url(:image_100_100)
    # else
      # avatar_url = "/images_avatar/avatar_generic_1_w100_h100.png"
    # end
      # image_tag(avatar_url, alt: public_user.name_first, class: "")
  # end  


  # def avatar_test
    # return "helper"  
  # end

  # def gravatar_for(user, options = { size: 50 })
    # gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # size = options[:size]
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end  


end
