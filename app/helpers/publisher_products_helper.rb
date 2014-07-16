module PublisherProductsHelper


  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end


  def yesno(x)
    x ? "Yes" : "No"
  end


  def publisher_product_name_product_for(publisher_product)
    # publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product.id).first
    publisher_product_description = publisher_product.publisher_product_description
    publisher_product_description_name_product = publisher_product_description.name_product
  end  


  # def publisher_product_description_for(publisher_product)
    # # publisher_product_descriptions_path = publisher_product.publisher_product_description
    # publisher_product_description = publisher_product.publisher_product_description
# 
    # # return '/Publisher-Product-Description'
    # # publisher_product_description = publisher_product.publisher_product_description
  # end  


  def publisher_product_logo_for(publisher_product)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProductLogo.where("publisher_product_id = ?", publisher_product.id).first
    if !img.nil?     
      publisher_product_logo_url = img.image_url(:image_100_100)
    else
      publisher_product_logo_url = "../images_publisher_product_logo/image_company_generic_w100_h100_1.png"
    end
      image_tag(publisher_product_logo_url, alt: "", class: "")
  end  


  def publisher_product_image_for(publisher_product)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProductImage.where("publisher_product_id = ?", publisher_product.id).first
    if !img.nil?     
      publisher_product_image_url = img.image_url(:image_100_100)
      # publisher_product_image_url = "../images_publisher_product/image_company_generic_w100_h100_1.png"
      # publisher_product_image_url = "../journal_poster/logo_journalposter_generic_2.jpg"
    else
      publisher_product_image_url = "../images_publisher_product/image_product_generic_w100_h100_3.png"
      # publisher_product_image_url = "../journal_poster/logo_journalposter_generic_2.jpg"

    end
      image_tag(publisher_product_image_url, alt: "", class: "")
  end  



end
