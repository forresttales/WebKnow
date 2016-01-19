module UsersIndexPublisherHomeHelper

  def index_publisher_home

      # Rails.logger.info('render_index_publisher_home')
      
      if signed_in?
          # @url_corporate_story_public = ""
          
          @publisher = nil
          @publisher_profile_image_primary = nil
          @post_publishers = nil
                    
          publisher = current_user.publisher rescue nil
          # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
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
              
              @post_publishers = publisher.feed
              
              # @url_corporate_story_public = '/ppcid' + publisher.slug
          else
              # exit if publisher nil
          end    

          
          gon.id_logo_image = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          if !@publisher_logo_image_primary.nil? 
            gon.id_logo_image = @publisher_logo_image_primary.id
            @crop_x = @publisher_logo_image_primary.crop_x
            @crop_y = @publisher_logo_image_primary.crop_y
            @crop_w = @publisher_logo_image_primary.crop_w
            @crop_h = @publisher_logo_image_primary.crop_h
          end
          
          # name_company                    
          # address1        
          # address2       
          # city            
          # state          
          # country                             
          # zip    
          # phone_company      
          # website       
          # email_info      
          # email_admin     
          # name_admin     
          # tagline_logo  
          # story_corporate
          
          gon.name_company = ""
          gon.b_name_company = false
          gon.b_required_name_company = true
          if !((publisher.name_company.blank?) or (publisher.name_company.empty?) or (publisher.name_company.nil?)) 
              # @b_name_company = true
              gon.name_company = publisher.name_company
              gon.b_name_company = true
              gon.b_required_name_company = false
          end
          
          gon.address1 = ""
          gon.b_address1 = false
          gon.b_required_address1 = true
          if !((publisher.address1.blank?) or (publisher.address1.empty?) or (publisher.address1.nil?)) 
              # @b_address1 = true
              gon.address1 = publisher.address1
              gon.b_address1 = true
              gon.b_required_address1 = false
          end
      
          gon.address2 = ""
          gon.b_address2 = false
          gon.b_required_address2 = true
          if !((publisher.address2.blank?) or (publisher.address2.empty?) or (publisher.address2.nil?)) 
              # @b_address2 = true
              gon.address2 = publisher.address2
              gon.b_address2 = true
              gon.b_required_address2 = false
          end
      
          gon.city = ""
          gon.b_city = false
          gon.b_required_city = true
          if !((publisher.city.blank?) or (publisher.city.empty?) or (publisher.city.nil?)) 
              # @b_city = true
              gon.city = publisher.city
              gon.b_city = true
              gon.b_required_city = false
          end
      
          gon.state = ""
          gon.b_state = false
          gon.b_required_state = true
          if !((publisher.state.blank?) or (publisher.state.empty?) or (publisher.state.nil?)) 
              # @b_state = true
              gon.state = publisher.state
              gon.b_state = true
              gon.b_required_state = false
          end
      
          gon.country = ""
          gon.b_country = false
          gon.b_required_country = true
          if !((publisher.country.blank?) or (publisher.country.empty?) or (publisher.country.nil?)) 
              # @b_country = true
              gon.country = publisher.country
              gon.b_country = true
              gon.b_required_country = false
          end
      
          gon.zip = ""
          gon.b_zip = false
          gon.b_required_zip = true
          if !((publisher.zip.blank?) or (publisher.zip.empty?) or (publisher.zip.nil?)) 
              # @b_zip = true
              gon.zip = publisher.zip
              gon.b_zip = true
              gon.b_required_zip = false
          end
      
          gon.phone_company = ""
          gon.b_phone_company = false
          gon.b_required_phone_company = true
          if !((publisher.phone_company.blank?) or (publisher.phone_company.empty?) or (publisher.phone_company.nil?)) 
              # @b_phone_company = true
              gon.phone_company = publisher.phone_company
              gon.b_phone_company = true
              gon.b_required_phone_company = false
          end
      
          gon.website = ""
          gon.b_website = false
          gon.b_required_website = true
          if !((publisher.website.blank?) or (publisher.website.empty?) or (publisher.website.nil?)) 
              # @b_website = true
              gon.website = publisher.website
              gon.b_website = true
              gon.b_required_website = false
          end
          
          gon.email_info = ""
          gon.b_email_info = false
          gon.b_required_email_info = true
          if !((publisher.email_info.blank?) or (publisher.email_info.empty?) or (publisher.email_info.nil?)) 
              # @b_email_info = true
              gon.email_info = publisher.email_info
              gon.b_email_info = true
              gon.b_required_email_info = false
          end
      
          gon.email_admin = ""
          gon.b_email_admin = false
          gon.b_required_email_admin = true
          if !((publisher.email_admin.blank?) or (publisher.email_admin.empty?) or (publisher.email_admin.nil?)) 
              # @b_email_admin = true
              gon.email_admin = publisher.email_admin
              gon.b_email_admin = true
              gon.b_required_email_admin = false
          end
      
          gon.name_admin = ""
          gon.b_name_admin = false
          gon.b_required_name_admin = true
          if !((publisher.name_admin.blank?) or (publisher.name_admin.empty?) or (publisher.name_admin.nil?)) 
              # @b_name_admin = true
              gon.name_admin = publisher.name_admin
              gon.b_name_admin = true
              gon.b_required_name_admin = false
          end
      
          gon.tagline_logo = ""
          gon.b_tagline_logo = false
          gon.b_required_tagline_logo = true
          if !((publisher.tagline_logo.blank?) or (publisher.tagline_logo.empty?) or (publisher.tagline_logo.nil?)) 
              # @b_tagline_logo = true
              gon.tagline_logo = publisher.tagline_logo
              gon.b_tagline_logo = true
              gon.b_required_tagline_logo = false
          end
      
          gon.story_corporate = ""
          gon.b_story_corporate = false
          gon.b_required_story_corporate = true
          if !((publisher.story_corporate.blank?) or (publisher.story_corporate.empty?) or (publisher.story_corporate.nil?)) 
              # @b_story_corporate = true
              gon.story_corporate = publisher.story_corporate
              gon.b_story_corporate = true
              gon.b_required_story_corporate = false
          end

          prepend_view_path 'app/views/publisher/profile'
          render 'publisher_homes/index', :layout => 'publisher_homes_index'
      else
          redirect_to '/'      
      end

      
      # slug_publisher = publisher.slug
      # @url_corporate_story_public = '/ppcid' + slug_publisher
      
      
      # result = ActiveRecord::Base.connection.exec_query('SELECT id, title, body FROM posts')
      # @publisher_profile_image_primary = ActiveRecord::Base.connection.exec_query('SELECT * FROM publisher_profile_images WHERE publisher_id = 1 AND order = 1')

  end

  
end