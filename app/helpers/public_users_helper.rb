module PublicUsersHelper


  def avatar_public_user(public_user)

    img = nil    
    case public_user.account_type.to_s   
      when "0"
        # img = PublisherUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
      when "1"
        # img = StudentUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
      when "2"
        # img = TeacherUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
      when "3"
        img = PublisherUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
      when "4"
        # img = InstituteUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
      when "5"
        # img = RecruiterUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
      else
        # img = PublisherUserImage.where("user_id = ?", public_user.id).where(:primary => true).first
    end

    if !img.nil?     
      avatar_url = img.image_url(:user_100_100)
    else
      avatar_url = "/images_avatar/avatar_generic_1_w100_h100.png"
    end
      image_tag(avatar_url, alt: "no image", class: "")
      
  end  




  # def avatar_for(user)
    # # img = UserProfileImage.where("user_id = ?", user.id).first     
    # img = UserProfileImage.where("user_id = ?", user.id).first
    # if !img.nil?     
      # avatar_url = img.image_url(:profile_100_100)
    # else
      # avatar_url = "/images_avatar/avatar_generic_1_w100_h100.png"
    # end
      # image_tag(avatar_url, alt: user.name_first, class: "")
  # end  


  # def sortable(column, title = nil)
    # title ||= column.titleize
    # css_class = column == sort_column ? "current #{sort_direction}" : nil
    # direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    # link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end
  # def yesno(x)
    # x ? "Yes" : "No"
  # end
  # def publisher_product_logo_for(publisher_product)
    # img = PublisherProductLogo.where("publisher_product_id = ?", publisher_product.id).first
    # if !img.nil?     
      # publisher_product_logo_url = img.image_url(:image_100_100)
    # else
      # publisher_product_logo_url = "../images_publisher_product_logo/image_company_generic_w100_h100_1.png"
    # end
      # image_tag(publisher_product_logo_url, alt: "", class: "")
  # end  


end
