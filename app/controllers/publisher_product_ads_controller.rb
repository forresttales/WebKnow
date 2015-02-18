class PublisherProductAdsController < ApplicationController

  layout 'publisher'

  before_filter :force_http


  respond_to :html, :js, :json  


  before_action :signed_in_user
  before_action :fill_left_directory

  def fill_left_directory

    slug = current_user.slug
    @url_my_story        = '/puid' + slug
    @url_corporate_story = '/pcid' + slug
        
  end

  
  def index
    
    publisher_user = PublisherUser.where("user_id = ?", current_user.id).first
    publisher_id = publisher_user.publisher_id
    publisher = Publisher.find_by_id(publisher_id)
  
    # publisher_products = PublisherProduct.where("publisher_id = ?", publisher_id).order(sort_column + " " + sort_direction)
    publisher_products = PublisherProduct.where("publisher_id = ?", publisher_id)

    a_publisher_products = Array.new
    publisher_products.each do |publisher_product|
      a_temp = Array.new
      publisher_product_description = publisher_product.publisher_product_description
      publisher_product_description_name_product = publisher_product_description.name_product
      # publisher_product_id = publisher_product.id
      a_temp[0] = publisher_product.id
      a_temp[1] = publisher_product_description_name_product      
      # a_temp.push(publisher_product.id)
      # a_temp.push(publisher_product.publisher_product_description)      

      # a_temp[0] = "first"
      # a_temp[1] = "second"      

      # a_publisher_products.push(publisher_product_description.name_product)
      a_publisher_products.push(a_temp)      
      a_temp = nil
    end    
    
    gon.publisher_products = a_publisher_products    

    @publisher_id = publisher_id
      
  end



end
