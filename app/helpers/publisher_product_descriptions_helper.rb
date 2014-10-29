module PublisherProductDescriptionsHelper
  
  def publisher_product_pdf_image_for(publisher_product_pdf)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    # img = PublisherProductPdfImage.where("publisher_product_id = ?", publisher_product.id).first
    
    img = publisher_product_pdf.publisher_product_pdf_image
    if !img.nil?     
      # publisher_product_pdf_image = img.image_url(:image_200_270)
      publisher_product_pdf_image = img.image_url
    else
      publisher_product_pdf_image = nil
      # publisher_product_pdf_image = "../images_publisher_product_pdf_image/add_generic_publisher_product_pdf_image_w200_h250.png"
    end

    # image_tag(publisher_product_pdf_image, alt: "", class: "")

    return publisher_product_pdf_image
        
  end  

  
end
