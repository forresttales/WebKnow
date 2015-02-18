module Journal1postersHelper
  
  def publisher_product_logo_for_pin(publisher_ad_pin)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProductLogo.where("publisher_product_id = ?", publisher_ad_pin.publisher_product_id).first
    if !img.nil?     
      publisher_product_logo_url = img.image_url(:image_100_100)
    else
      publisher_product_logo_url = "../images_publisher_product_logo/image_company_generic_w100_h100_1.png"
    end
      image_tag(publisher_product_logo_url, alt: "", class: "")
  end  


  def publisher_product_logo_for_square(publisher_ad_square)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProductLogo.where("publisher_product_id = ?", publisher_ad_square.publisher_product_id).first
    if !img.nil?     
      publisher_product_logo_url = img.image_url(:image_100_100)
    else
      publisher_product_logo_url = "../images_publisher_product_logo/image_company_generic_w100_h100_1.png"
    end
      image_tag(publisher_product_logo_url, alt: "", class: "")
  end  


  
end
