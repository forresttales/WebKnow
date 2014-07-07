module Mtab1letsHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  
  def avatar_for(user)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = UserProfileImage.where("user_id = ?", user.id).first
    if !img.nil?     
      avatar_url = img.image_url(:profile_50_50)
    else
      avatar_url = "/images_avatar/avatar_generic_1_w50_h50.png"
    end
      image_tag(avatar_url, alt: user.name_first, class: "")
  end  

  
end
