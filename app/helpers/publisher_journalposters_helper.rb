module PublisherJournalpostersHelper

    def yn(x)
      if x == 1
        return "Yes"
      else
        return "No"
      end
    end

    def tf(x)
      if x == true
        return "Yes"
      else
        return "No"
      end
    end
    
  # def publisher_product_name_product_for(publisher_product)
    # publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product.id).first
    # publisher_product_description_name_product = publisher_product_description.name_product
  # end  


  def publisher_journalposter_image_for(publisher_journalposter)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherJournalposterImage.where("publisher_journalposter_id = ?", publisher_journalposter.id).first
    if !img.nil?     
      publisher_journalposter_image_url = img.image_url(:image_100_100)
      # publisher_journalposter_image_url = "../images_publisher_product/image_company_generic_w100_h100_1.png"

      # publisher_product_image_url = "../images_publisher_product/image_company_generic_w100_h100_1.png"
      # publisher_product_image_url = "../journal_poster/logo_journalposter_generic_2.jpg"
    else
      publisher_journalposter_image_url = "../images_publisher_journalposter/image_journalposter_generic_1_w100_h100.png"
      # publisher_product_image_url = "../journal_poster/logo_journalposter_generic_2.jpg"

    end
      image_tag(publisher_journalposter_image_url, alt: "", class: "")
  end  
    

end
