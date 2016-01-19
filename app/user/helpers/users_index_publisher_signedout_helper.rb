module UsersIndexPublisherSignedoutHelper

  def index_publisher_signedout(publisher)

      Rails.logger.info('in index_publisher_signedout')
      
      @publisher = nil
      @publisher_user_image_primary = nil
      @publisher_user_logo_image = nil
      
      @signed_in_user_options = signed_in?
      @b_signed_in = signed_in?
  
      if !publisher.nil?
        
          @publisher = publisher
          publisher_id = publisher.id
          # publisher_logo_image_primary = PublisherLogoImage.where("publisher_id = ?", publisher_id).where( :primary => true ).first rescue nil
          publisher_logo_image_primary = publisher.publisher_logo_images.first rescue nil
          if !publisher_logo_image_primary.nil?
              @publisher_logo_image_primary = publisher_logo_image_primary  
          else
            #
          end
        
          @post_publishers = publisher.feed_log
          
          Rails.logger.info('post_publishers count = ' + @post_publishers.count.to_s)
          
          gon.name_company = ""
          gon.b_name_company = false
          gon.b_required_name_company = true
          if !((publisher.name_company.blank?) or (publisher.name_company.empty?) or (publisher.name_company.nil?)) 
              # @b_name_company = true
              gon.name_company = publisher.name_company
              gon.b_name_company = true
              gon.b_required_name_company = false
          end
          
          prepend_view_path 'app/views/publisher/profile'
          render 'publisher_signedouts/index', :layout => 'publisher_signedouts_index'
      else
          # Catch error, here, which shouldn't be necessary, as the passed id was already verified.
          Rails.logger.info('render_index_public_publisher_signedout publisher = nil')
          redirect_to '/Signin'
      end
    

  end

  
end