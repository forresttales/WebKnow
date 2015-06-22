class PublisherProductAdsController < ApplicationController

  layout 'publisher_product_ad'

  before_filter :force_http


  respond_to :html, :js, :json  


  before_action :signed_in_user
  before_action :fill_left_directory

  def fill_left_directory

    slug = current_user.slug
    @url_user_story  = '/' + current_user.slug
    @url_profile_story = '/' + current_user.publisher.slug
        
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
      publisher_product_manifest = publisher_product.publisher_product_manifest
      publisher_product_manifest_name_product = publisher_product_manifest.name_product
      # publisher_product_id = publisher_product.id
      a_temp[0] = publisher_product.id
      a_temp[1] = publisher_product_manifest_name_product      
      # a_temp.push(publisher_product.id)
      # a_temp.push(publisher_product.publisher_product_manifest)      

      # a_temp[0] = "first"
      # a_temp[1] = "second"      

      # a_publisher_products.push(publisher_product_manifest.name_product)
      a_publisher_products.push(a_temp)      
      a_temp = nil
    end    
    
    gon.publisher_products = a_publisher_products    

    @publisher_id = publisher_id
      
  end


  def manual

    # render 'publishers/index_home', :layout => 'publisher_product_ads_manual'
    render :layout => 'publisher_product_ads_manual'
        
  end



end
