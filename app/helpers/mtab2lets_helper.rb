module Mtab2letsHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  
  def publisher_avatar_for(publisher)
    img = PublisherProfileImage.where("publisher_id = ?", publisher.id).first
    if !img.nil?     
      avatar_url = img.image_url(:image_100_100)
    else
      avatar_url = "/images_avatar/avatar_generic_1_w100_h100.png"
    end
    image_tag(avatar_url, alt: publisher.name, class: "")
  end  
  
  # def yesno(x)
    # x ? "Yes" : "No"
  # end
  
  
end
