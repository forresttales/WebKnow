class PublisherProductManifestsController < ApplicationController
  
  layout 'publisher_product_manifest'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  before_action :signed_in_user, only: [:index, :index_demo]
  before_action :verify_params, only: [:index, :index_demo]


  @@publisher_id = nil
  @@publisher_product_id = nil
  @@publisher_product_gen_id = nil
  @@publisher_product_manifest_id = nil

  @@was_edited = false


  def verify_params
    
      begin    
    
          id_passed = params[:id]
          b_signed_in = signed_in?
          b_issued_publisher_product_id_exists = IssuedPublisherProductId.exists?(:publisher_product_gen_id => id_passed)
          if b_issued_publisher_product_id_exists
              if b_signed_in
                    current_user_publisher = current_user.publisher rescue nil
                    if !current_user_publisher.nil?
                          b_current_user_publisher_owns = current_user_publisher.publisher_products.exists?(:slug => id_passed)
                          if b_current_user_publisher_owns
                              current_user_publisher_user = current_user.publisher_user rescue nil
                              if !current_user_publisher_user.nil?
                                  current_user_publisher_privileges = current_user_publisher.publisher_privileges rescue nil
                                  # Rails.logger.info("current_user_publisher_privileges = " + current_user_publisher_privileges.length.to_s)
                                  if !current_user_publisher_privileges.nil?
                                      # if current_user_publisher_privileges.any?
                                          current_user_publisher_privilege = current_user_publisher_privileges.where("publisher_user_id=?", current_user_publisher_user.id).first rescue nil
                                          # Rails.logger.info('current_user_publisher_user.id = ' + current_user_publisher_user.id.to_s)
                                          # note - the index 'publisher_privilege_on_publisher_id' is NOT forced to be unique. This might need to be changed.
                                          if !current_user_publisher_privilege.nil?
                                              b_current_user_publisher_privilege_level_2 = current_user_publisher_privilege.level_2 rescue nil
                                              if !b_current_user_publisher_privilege_level_2.nil?
                                                  if b_current_user_publisher_privilege_level_2                          
                                                      # user is a member of this publisher with edit privilege
                                                  else
                                                      Rails.logger.info("b_current_user_publisher_user_level_2 false")
                                                      # Rails.logger.info("current_user_publisher_user_id = " + current_user.publisher_user.id.to_s)
                                                      # user is a member of this publisher, but does not have administrative privilege to edit product forms
                                                      # display public page
                                                      redirect_to '/' + id_passed
                                                  end
                                              else
                                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'index', :description => 'current_user_publisher_privilege_level_2 was nil')
                                                  Rails.logger.info("current_user_publisher_privilege_level_2 was nil")
                                                  # a boolean return nil
                                                  # this should NEVER happen. But if it does, it is because the publisher_privileges table was not properly updated for this user, or computer error
                                                  # -> log error
                                                  # display public page
                                                  redirect_to '/' + id_passed
                                              end
                                          else
                                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'index', :description => 'current_user_publisher_privilege was nil')
                                              Rails.logger.info("current_user_publisher_privilege was nil")
                                              # this should NEVER happen. If it does, it is because the publisher_privileges table was not properly updated for this user, or computer error
                                              # -> log error
                                              # display public page
                                              redirect_to '/' + id_passed
                                          end                                      
                                      # else
                                          # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'index', :description => 'current_user_publisher_privileges any failed')                                        
                                          # Rails.logger.info("current_user_publisher_privileges any failed")
                                          # # Again, this should NEVER happen. There should always be 1 record for the publisher account initiator
                                          # # -> log error
                                          # # display public page
                                          # redirect_to '/' + id_passed
                                      # end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'index', :description => 'current_user_publisher_privileges was nil')
                                      # Rails.logger.info("current_user_publisher_privileges was nil")
                                      # this should NEVER return nil. At the least, there should be 1 record - the publisher account initiator
                                      # -> log error
                                      # display public page
                                      redirect_to '/' + id_passed
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'index', :description => 'current_user_publisher_user was nil')
                                  # Rails.logger.info("current_user_publisher_user was nil")
                                  # publisher confirmed, but publisher_user not found
                                  # this should NEVER happen. but if it does by computer error, display the public page and log error
                                  # -> log error
                                  # display public page
                                  redirect_to '/' + id_passed
                              end
                          else
                              Rails.logger.info("b_current_user_owns false")
                              # user is a publisher, but does not own this product
                              # display public page
                              redirect_to '/' + id_passed
                          end
                    else
                        Rails.logger.info("current_user_publisher returned nil")
                        # user not even a publisher
                        # display public page
                    end
              else
                  Rails.logger.info("b_signed_in false")
                  # display public page
                  redirect_to '/' + id_passed
              end    
          else
              Rails.logger.info("b_issued_publisher_product_id_exists false")
              if b_signed_in
                # error message -> 'URL not found
                # redirect_to request.referrer  
                redirect_to '/Publisher-Product-Listings'
              else
                redirect_to '/'
              end
          end
      
      rescue StandardError => e

          LogError.create(:user_id => 0, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'verify_params', :description => e.message.to_s)

      end      


  end


  # def index_manifest
      # # @@publisher_product_id = params[:publisher_product_id]
      # publisher_product_gen_id = params[:id]
      # publisher_product_current = current_user.publisher.publisher_product_current rescue nil
      # if !publisher_product_current.nil?
          # publisher_product_current.current_publisher_product_gen_id = publisher_product_gen_id
          # if publisher_product_current.save
              # redirect_to :action => :index
          # else
              # Rails.logger.info("in index_manifest publisher_product_current save failed")
          # end          
      # else
          # redirect_to '/Publisher-Product-Listings' # -> with error message
      # end
  # end


  # def reset_current_publisher_product
      # Rails.logger.info("in reset_current_publisher_product")
      # ar = params[:publisher_product_manifest]
      # h_obj = Hash.new
      # ar.each do |obj|
        # h_obj = obj
      # end
      # publisher_product_gen_id = h_obj[:publisher_product_gen_id]
      # publisher_product_current = current_user.publisher.publisher_product_current rescue nil
      # if !publisher_product_current.nil?
          # publisher_product_current.current_publisher_product_gen_id = publisher_product_gen_id
          # if publisher_product_current.save
              # Rails.logger.info("in reset_current_publisher_product publisher_product_current save succeeded")
              # # redirect_to :action => :index
          # else
              # Rails.logger.info("in reset_current_publisher_product publisher_product_current save failed")
          # end          
      # else
          # Rails.logger.info("in reset_current_publisher_product publisher_product_current was nil")
          # # redirect_to '/Publisher-Product-Listings' # -> with error message
      # end
      # respond_to do |format|
          # format.html {}
          # format.json { render :json => {} }
      # end
  # end

  
  def index
    
      begin
            
          publisher_product_slug = params[:id]

          # *** page and product id's ***
              
          publisher_product = current_user.publisher.publisher_products.where("slug = ?", publisher_product_slug.to_s).first rescue nil
          @publisher_product = publisher_product
          @publisher_product_id = publisher_product.id
          gon.publisher_product_id = publisher_product.id 
          @publisher_product_gen_id = publisher_product.slug
          publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
          @publisher_product_manifest = publisher_product_manifest
          @publisher_product_manifest_id = publisher_product_manifest.id
          @@publisher_product_manifest_id = @publisher_product_manifest_id
          


          # *** images and pdfs ***
          # publisher_product_pdfs
          # publisher_product_pos1_image image_1
          # publisher_product_pos2_image image_2
          # publisher_product_pos3_image image_3
          # publisher_product_pos4_image image_4
                     
          publisher_product_pdfs = publisher_product.publisher_product_pdfs.order(created_at: :asc) rescue nil
          @publisher_product_pdfs = publisher_product_pdfs
          gon.publisher_product_pdfs_count = 0
          if !publisher_product_pdfs.nil?
              gon.publisher_product_pdfs_count = publisher_product_pdfs.count 
          end
          
          image_1 = publisher_product.publisher_product_pos1_image rescue nil
          @image_1 = image_1
          if !image_1.nil?
            gon.image_1_id = image_1.id
            @crop_x_image_1 = image_1.crop_x
            @crop_y_image_1 = image_1.crop_y
            @crop_w_image_1 = image_1.crop_w
            @crop_h_image_1 = image_1.crop_h
          else
            gon.image_1_id = nil
          end
              
          image_2 = publisher_product.publisher_product_pos2_image rescue nil
          @image_2 = image_2
          if !image_2.nil?
            gon.image_2_id = image_2.id
            @crop_x_image_2 = image_2.crop_x
            @crop_y_image_2 = image_2.crop_y
            @crop_w_image_2 = image_2.crop_w
            @crop_h_image_2 = image_2.crop_h
          else
            gon.image_2_id = nil
          end
          
          image_3 = publisher_product.publisher_product_pos3_image rescue nil
          @image_3 = image_3
          if !image_3.nil?
            gon.image_3_id = image_3.id
            @crop_x_image_3 = image_3.crop_x
            @crop_y_image_3 = image_3.crop_y
            @crop_w_image_3 = image_3.crop_w
            @crop_h_image_3 = image_3.crop_h
          else
            gon.image_3_id = nil
          end
    
          image_4 = publisher_product.publisher_product_pos4_image rescue nil
          @image_4 = image_4
          if !image_4.nil?
            gon.image_4_id = image_4.id
            @crop_x_image_4 = image_4.crop_x
            @crop_y_image_4 = image_4.crop_y
            @crop_w_image_4 = image_4.crop_w
            @crop_h_image_4 = image_4.crop_h
          else
            gon.image_4_id = nil
          end

          image_5 = publisher_product.publisher_product_pos5_image rescue nil
          # @image_5 = image_5
          if !image_5.nil?
            @image_5 = image_5
            gon.image_5_id = image_5.id
            @image_5_id = image_5.id
            @image_5_url = image_5.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
            @crop_x_image_5 = image_5.crop_x
            @crop_y_image_5 = image_5.crop_y
            @crop_w_image_5 = image_5.crop_w
            @crop_h_image_5 = image_5.crop_h
          else
            # Rails.logger.info('image_5 was nil in index')
            @image_5 = nil
            gon.image_5_id = nil
            @image_5_id = nil
            @image_5_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
          end


          # *** textarea fields ***
          # publisher_product_description description_text
          # publisher_product_topic topic_text
          # publisher_product_subject subject_text
          
          @publisher_product_description_description_text = publisher_product.publisher_product_description.description_text
          @b_required_description = false                        
          if (@publisher_product_description_description_text.blank?) or (@publisher_product_description_description_text.empty?) or (@publisher_product_description_description_text.nil?)
            @b_required_description = true
          end

          @publisher_product_topic_topic_text = publisher_product.publisher_product_topic.topic_text
          @b_required_topic = false                        
          if (@publisher_product_topic_topic_text.blank?) or (@publisher_product_topic_topic_text.empty?) or (@publisher_product_topic_topic_text.nil?)
            @b_required_topic = true
          end

          @publisher_product_subject_subject_text = publisher_product.publisher_product_subject.subject_text            
          @b_required_lesson_plan_subject = false    
          if (@publisher_product_subject_subject_text.blank?) or (@publisher_product_subject_subject_text.empty?) or (@publisher_product_subject_subject_text.nil?)
            @b_required_lesson_plan_subject = true
          end
          
          
          # *** publisher_product_manifest fields ***
          # product_headline
          # product_name
          # product_tagline
          # versions
          # corporate_logo_url
          # lesson_time
          # allow_teacher_rating
          # allow_comments
          # allow_student_likes
          # poster_print_purchase
          # poster_pin_web
          # poster_pin_purchase
          
          # updating_refresh_rate
          # updating_type
          # reselling
          # evaluation
          # research
          # public_relations
          # metrics
          # source_url
      
          # # @b_product_headline = false
          # gon.product_headline = "Product Headline"
          # gon.b_product_headline = false
          # gon.b_required_product_headline = true
          # if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
              # # @b_product_headline = true
              # gon.product_headline = publisher_product_manifest.product_headline
              # gon.b_product_headline = true
              # gon.b_required_product_headline = false
              # @publisher_product_manifest_product_headline = publisher_product_manifest.product_headline
          # end
          
          @product_headline = "Product Headline"
          @b_product_headline = false
          @b_required_product_headline = true
          if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
              # @b_product_headline = true
              @product_headline = publisher_product_manifest.product_headline
              @b_product_headline = true
              @b_required_product_headline = false
          end
          
          
          # gon.product_name = "Product Name"
          # gon.b_product_name = false
          # gon.b_required_product_name = true
          # gon.product_name = "Product Name"
          @b_product_name = false
          @b_required_product_name = true
          if !((publisher_product_manifest.product_name.blank?) or (publisher_product_manifest.product_name.empty?) or (publisher_product_manifest.product_name.nil?)) 
              # gon.product_name = publisher_product_manifest.product_name
              # gon.b_product_name = true
              # gon.b_required_product_name = false
              @b_product_name = true
              @b_required_product_name = false
          end
      
          # gon.product_tagline = "Tagline"
          # gon.b_product_tagline = false
          @b_product_tagline = false
          # gon.b_required_product_tagline = true        
          @b_required_product_tagline = true
          if !((@publisher_product_manifest.product_tagline.blank?) or (@publisher_product_manifest.product_tagline.empty?) or (@publisher_product_manifest.product_tagline.nil?)) 
              # gon.product_tagline = publisher_product_manifest.product_tagline
              # gon.b_product_tagline = true
              @b_product_tagline = true
              # gon.b_required_product_tagline = false
              @b_required_product_tagline = false              
          end

          @b_versions = false
          @b_required_versions = true
          if !((@publisher_product_manifest.versions.blank?) or (@publisher_product_manifest.versions.empty?) or (@publisher_product_manifest.versions.nil?)) 
              @b_versions = true
              @b_required_versions = false              
          end
      
          # gon.versions = "Version"
          # gon.b_versions = false
          # gon.b_required_versions = true                
          # if !((@publisher_product_manifest.versions.blank?) or (@publisher_product_manifest.versions.empty?) or (@publisher_product_manifest.versions.nil?)) 
              # gon.versions = publisher_product_manifest.versions
              # gon.b_versions = true
              # gon.b_required_versions = false        
          # end
      
          # gon.corporate_logo_url = "www.OurCorporation.com"
          # gon.b_corporate_logo_url = false
          # if !((publisher_product_manifest.corporate_logo_url.blank?) or (publisher_product_manifest.corporate_logo_url.empty?) or (publisher_product_manifest.corporate_logo_url.nil?)) 
              # gon.corporate_logo_url = publisher_product_manifest.corporate_logo_url
              # gon.b_corporate_logo_url = true
          # end

          @b_corporate_logo_url = false
          @b_required_corporate_logo_url = true
          if !((@publisher_product_manifest.corporate_logo_url.blank?) or (@publisher_product_manifest.corporate_logo_url.empty?) or (@publisher_product_manifest.corporate_logo_url.nil?)) 
              @b_corporate_logo_url = true
              @b_required_corporate_logo_url = false              
          end

          @b_required_lesson_time = false    
          gon.time_per_lesson = @publisher_product_manifest.time_per_lesson
          gon.time_per_course = @publisher_product_manifest.time_per_course
          gon.lesson_time_hours = @publisher_product_manifest.lesson_time_hours
          gon.lesson_time_minutes = @publisher_product_manifest.lesson_time_minutes
          gon.course_time_months = @publisher_product_manifest.course_time_months
          gon.course_time_days = @publisher_product_manifest.course_time_days

          gon.allow_teacher_rating = @publisher_product_manifest.allow_teacher_rating
          # a_user_rating = Array.new
          # a_user_rating.push(@publisher_product_manifest.user_rating_1)   
          # a_user_rating.push(@publisher_product_manifest.user_rating_2)   
          # a_user_rating.push(@publisher_product_manifest.user_rating_3)   
          # gon.user_rating = a_user_rating

          gon.allow_comments = @publisher_product_manifest.allow_comments
      
          gon.allow_student_likes = @publisher_product_manifest.allow_student_likes

          gon.poster_print_purchase = @publisher_product_manifest.poster_print_purchase
          gon.poster_pin_web = @publisher_product_manifest.poster_pin_web
          gon.poster_pin_purchase = @publisher_product_manifest.poster_pin_purchase

          # gon.updating_refresh_rate = []    
          # if (@publisher_product_manifest.updating_refresh_rate.blank?) or (@publisher_product_manifest.updating_refresh_rate.empty?) or (@publisher_product_manifest.updating_refresh_rate.nil?)
              # @b_updating_refresh_rate = false
          # else
              # @b_updating_refresh_rate = true
              # ar_updating_refresh_rate = Array.new
              # ar_updating_refresh_rate = @publisher_product_manifest.updating_refresh_rate.split(',')
              # gon.updating_refresh_rate = ar_updating_refresh_rate
          # end
      
          # gon.updating_type = []    
          # if (@publisher_product_manifest.updating_type.blank?) or (@publisher_product_manifest.updating_type.empty?) or (@publisher_product_manifest.updating_type.nil?)
              # @b_updating_type = false
          # else
              # @b_updating_type = true
              # ar_updating_type = Array.new
              # ar_updating_type = @publisher_product_manifest.updating_type.split(',')
              # gon.updating_type = ar_updating_type
          # end

          # gon.reselling = @publisher_product_manifest.reselling

          # gon.evaluation = @publisher_product_manifest.evaluation
      
          # gon.research = []
          # gon.research[0] = @publisher_product_manifest.research_1
          # gon.research[1] = @publisher_product_manifest.research_2
      
          # gon.public_relations = []
          # gon.public_relations[0] = @publisher_product_manifest.pr_updates_1
          # gon.public_relations[1] = @publisher_product_manifest.pr_updates_2
          # gon.public_relations[2] = @publisher_product_manifest.pr_updates_3
      
          # gon.metrics = []
          # gon.metrics[0] = @publisher_product_manifest.metrics_1
          # gon.metrics[1] = @publisher_product_manifest.metrics_2
          # gon.metrics[2] = @publisher_product_manifest.metrics_3
          # gon.metrics[3] = @publisher_product_manifest.metrics_4
          # gon.metrics[4] = @publisher_product_manifest.metrics_5
      
          # if (@publisher_product_manifest.source_url.blank?) or (@publisher_product_manifest.source_url.empty?) or (@publisher_product_manifest.source_url.nil?)
            # @b_source_url = false
          # end


          # ****************************************
          # *** publisher_product related tables ***
          # pricing_model
          # price
          # content_type
          # category_subject          
          # age_range
          # grade_range
          # market_target
          # platform
          # file_type
          # enhancement          
          # core_literacy_standard
          # core_math_standard
      
          # by_review
          # character

          @publisher_product_pricing_model = publisher_product.publisher_product_pricing_model
          a_pricing_models = Array.new
          @pricing_models = return_all_dtab10lets
          @pricing_models.each do |p_model|
            a_pricing_models.push(p_model)
          end
          gon.pricing_model = []
          gon.pricing_model_text = []    
          gon.b_required_pricing_model = true                                
          if (@publisher_product_pricing_model.pricing_model_1 or
              @publisher_product_pricing_model.pricing_model_2 or
              @publisher_product_pricing_model.pricing_model_3)
              # @b_grade_appropriate = true
              gon.b_required_pricing_model = false
              b = @publisher_product_pricing_model.pricing_model_1
              gon.pricing_model[0] = b
              if b
                gon.pricing_model_text.push(a_pricing_models[0].col_1)                            
              end        
              b = @publisher_product_pricing_model.pricing_model_2
              gon.pricing_model[1] = b
              if b
                gon.pricing_model_text.push(a_pricing_models[1].col_1)                            
              end        
              b = @publisher_product_pricing_model.pricing_model_3
              gon.pricing_model[2] = b
              if b
                gon.pricing_model_text.push(a_pricing_models[2].col_1)                            
              end        
          end

          @publisher_product_price = publisher_product.publisher_product_price
          a_prices_text = Array.new
          a_prices_text[0] = "price 1 text"
          a_prices_text[1] = "price 2 text"
          a_prices_text[2] = "price 3 text"
          a_prices_text[3] = "price 4 text"
          a_prices_text[4] = "price 5 text"
          a_prices_text[5] = "price 6 text"
          a_prices_text[6] = "price 7 text"
          a_prices_text[7] = "price 8 text"
          a_prices_text[8] = "price 9 text"
          a_prices_text[9] = "price 10 text"
          a_prices_text[10] = "price 11 text"
          a_prices_text[11] = "price 12 text"
          a_prices = Array.new(12).map!{Array.new(2)}
          gon.price = nil    
          gon.price_text = []    
          gon.b_required_price = true                                
          if (@publisher_product_price.price_1 or
              @publisher_product_price.price_2 or
              @publisher_product_price.price_3 or
              @publisher_product_price.price_4 or
              @publisher_product_price.price_5 or
              @publisher_product_price.price_6 or
              @publisher_product_price.price_7 or
              @publisher_product_price.price_8 or
              @publisher_product_price.price_9 or
              @publisher_product_price.price_10 or
              @publisher_product_price.price_11 or
              @publisher_product_price.price_12)
              gon.b_required_price = false                                
          end
          a_prices[1][0] = @publisher_product_price.price_1
          a_prices[1][1] = @publisher_product_price.price_1_dec
          a_prices[2][0] = @publisher_product_price.price_2
          a_prices[2][1] = @publisher_product_price.price_2_dec
          a_prices[3][0] = @publisher_product_price.price_3
          a_prices[3][1] = @publisher_product_price.price_3_dec
          a_prices[4][0] = @publisher_product_price.price_4
          a_prices[4][1] = @publisher_product_price.price_4_dec
          a_prices[5][0] = @publisher_product_price.price_5
          a_prices[5][1] = @publisher_product_price.price_5_dec
          a_prices[6][0] = @publisher_product_price.price_6
          a_prices[6][1] = @publisher_product_price.price_6_dec
          a_prices[7][0] = @publisher_product_price.price_7
          a_prices[7][1] = @publisher_product_price.price_7_dec
          a_prices[8][0] = @publisher_product_price.price_8
          a_prices[8][1] = @publisher_product_price.price_8_dec
          a_prices[9][0] = @publisher_product_price.price_9
          a_prices[9][1] = @publisher_product_price.price_9_dec
          a_prices[10][0] = @publisher_product_price.price_10
          a_prices[10][1] = @publisher_product_price.price_10_dec
          a_prices[11][0] = @publisher_product_price.price_11
          gon.price = a_prices

          @publisher_product_content_type = publisher_product.publisher_product_content_type
          a_content_types = Array.new
          @content_types = return_all_dtab2lets
          @content_types.each do |content_type|
            a_content_types.push(content_type)
          end
          gon.content_type = []    
          gon.content_type_text = []
          b_content_type_other = false
          gon.has_content_type_other = false
          gon.content_type_other = ""
          if @publisher_product_content_type.content_type_other_b      
              b_content_type_other = true
              gon.has_content_type_other = true
              gon.content_type_other = @publisher_product_content_type.content_type_other            
          end
          gon.b_required_content_type = true                    
          if (@publisher_product_content_type.content_type_1 or
              @publisher_product_content_type.content_type_2 or
              @publisher_product_content_type.content_type_3 or
              @publisher_product_content_type.content_type_4 or
              @publisher_product_content_type.content_type_5 or
              @publisher_product_content_type.content_type_6 or
              @publisher_product_content_type.content_type_7 or
              @publisher_product_content_type.content_type_8 or
              @publisher_product_content_type.content_type_9 or
              @publisher_product_content_type.content_type_10 or        
              @publisher_product_content_type.content_type_11 or
              b_content_type_other)
              # @b_content_type = true
              gon.b_required_content_type = false                    
              b = @publisher_product_content_type.content_type_1
              gon.content_type[0] = b
              if b
                gon.content_type_text.push(a_content_types[0].col_1)              
              end        
              b = @publisher_product_content_type.content_type_2
              gon.content_type[1] = b
              if b
                gon.content_type_text.push(a_content_types[1].col_1)              
              end        
              b = @publisher_product_content_type.content_type_3
              gon.content_type[2] = b
              if b
                gon.content_type_text.push(a_content_types[2].col_1)              
              end        
              b = @publisher_product_content_type.content_type_4
              gon.content_type[3] = b
              if b
                gon.content_type_text.push(a_content_types[3].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_5
              gon.content_type[4] = b
              if b
                gon.content_type_text.push(a_content_types[4].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_6
              gon.content_type[5] = b
              if b
                gon.content_type_text.push(a_content_types[5].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_7
              gon.content_type[6] = b
              if b
                gon.content_type_text.push(a_content_types[6].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_8
              gon.content_type[7] = b
              if b
                gon.content_type_text.push(a_content_types[7].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_9
              gon.content_type[8] = b
              if b
                gon.content_type_text.push(a_content_types[8].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_10
              gon.content_type[9] = b
              if b
                gon.content_type_text.push(a_content_types[9].col_1)                                      
              end        
              b = @publisher_product_content_type.content_type_11
              gon.content_type[10] = b
              if b
                gon.content_type_text.push(a_content_types[10].col_1)                                      
              end        
          end
          
          @publisher_product_category_subject = publisher_product.publisher_product_category_subject
          a_category_subjects = Array.new
          @category_subjects = return_all_dtab4lets
          @category_subjects.each do |category_subject|
            a_category_subjects.push(category_subject)
          end
          gon.category_subject = []    
          gon.category_subject_text = []    
          b_category_subject_other = false
          gon.has_category_subject_other = false
          gon.category_subject_other = ""
          if @publisher_product_category_subject.category_subject_other_b      
              b_category_subject_other = true
              gon.has_category_subject_other = true
              gon.category_subject_other = @publisher_product_category_subject.category_subject_other            
          end
          gon.b_required_category_subject = true                    
          if (@publisher_product_category_subject.category_subject_1 or
              @publisher_product_category_subject.category_subject_2 or
              @publisher_product_category_subject.category_subject_3 or
              @publisher_product_category_subject.category_subject_4 or
              @publisher_product_category_subject.category_subject_5 or
              @publisher_product_category_subject.category_subject_6 or
              @publisher_product_category_subject.category_subject_7 or
              @publisher_product_category_subject.category_subject_8 or
              @publisher_product_category_subject.category_subject_9 or
              @publisher_product_category_subject.category_subject_10 or
              @publisher_product_category_subject.category_subject_11 or
              @publisher_product_category_subject.category_subject_12 or
              @publisher_product_category_subject.category_subject_13 or
              @publisher_product_category_subject.category_subject_14 or
              @publisher_product_category_subject.category_subject_15 or
              @publisher_product_category_subject.category_subject_16 or
              @publisher_product_category_subject.category_subject_17 or
              @publisher_product_category_subject.category_subject_18 or
              @publisher_product_category_subject.category_subject_19 or
              @publisher_product_category_subject.category_subject_20 or
              @publisher_product_category_subject.category_subject_21 or
              @publisher_product_category_subject.category_subject_22 or
              @publisher_product_category_subject.category_subject_23 or
              @publisher_product_category_subject.category_subject_24 or
              @publisher_product_category_subject.category_subject_25 or
              @publisher_product_category_subject.category_subject_26 or
              @publisher_product_category_subject.category_subject_27 or
              @publisher_product_category_subject.category_subject_28 or
              @publisher_product_category_subject.category_subject_29 or
              @publisher_product_category_subject.category_subject_30 or
              @publisher_product_category_subject.category_subject_31 or
              @publisher_product_category_subject.category_subject_32 or
              @publisher_product_category_subject.category_subject_33 or
              @publisher_product_category_subject.category_subject_34 or
              @publisher_product_category_subject.category_subject_35 or
              @publisher_product_category_subject.category_subject_36 or
              @publisher_product_category_subject.category_subject_37 or
              @publisher_product_category_subject.category_subject_38 or
              @publisher_product_category_subject.category_subject_39)
              # @b_category_subject = true
              gon.b_required_category_subject = false                    
              b = @publisher_product_category_subject.category_subject_1
              gon.category_subject[0] = b
              if b
                gon.category_subject_text.push(a_category_subjects[0].col_1)                            
              end        
              b = @publisher_product_category_subject.category_subject_2
              gon.category_subject[1] = b
              if b
                gon.category_subject_text.push(a_category_subjects[1].col_1)                            
              end        
              b = @publisher_product_category_subject.category_subject_3
              gon.category_subject[2] = b
              if b
                gon.category_subject_text.push(a_category_subjects[2].col_1)                                                    
              end        
              b = @publisher_product_category_subject.category_subject_4
              gon.category_subject[3] = b
              if b
                gon.category_subject_text.push(a_category_subjects[3].col_1)                                                    
              end        
              b = @publisher_product_category_subject.category_subject_5
              gon.category_subject[4] = b
              if b
                gon.category_subject_text.push(a_category_subjects[4].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_6
              gon.category_subject[5] = b
              if b
                gon.category_subject_text.push(a_category_subjects[5].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_7
              gon.category_subject[6] = b
              if b
                gon.category_subject_text.push(a_category_subjects[6].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_8
              gon.category_subject[7] = b
              if b
                gon.category_subject_text.push(a_category_subjects[7].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_9
              gon.category_subject[8] = b
              if b
                gon.category_subject_text.push(a_category_subjects[8].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_10
              gon.category_subject[9] = b
              if b
                gon.category_subject_text.push(a_category_subjects[9].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_11
              gon.category_subject[10] = b
              if b
                gon.category_subject_text.push(a_category_subjects[10].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_12
              gon.category_subject[11] = b
              if b
                gon.category_subject_text.push(a_category_subjects[11].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_13
              gon.category_subject[12] = b
              if b
                gon.category_subject_text.push(a_category_subjects[12].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_14
              gon.category_subject[13] = b
              if b
                gon.category_subject_text.push(a_category_subjects[13].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_15
              gon.category_subject[14] = b
              if b
                gon.category_subject_text.push(a_category_subjects[14].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_16
              gon.category_subject[15] = b
              if b
                gon.category_subject_text.push(a_category_subjects[15].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_17
              gon.category_subject[16] = b
              if b
                gon.category_subject_text.push(a_category_subjects[16].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_18
              gon.category_subject[17] = b
              if b
                gon.category_subject_text.push(a_category_subjects[17].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_19
              gon.category_subject[18] = b
              if b
                gon.category_subject_text.push(a_category_subjects[18].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_20
              gon.category_subject[19] = b
              if b
                gon.category_subject_text.push(a_category_subjects[19].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_21
              gon.category_subject[20] = b
              if b
                gon.category_subject_text.push(a_category_subjects[20].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_22
              gon.category_subject[21] = b
              if b
                gon.category_subject_text.push(a_category_subjects[21].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_23
              gon.category_subject[22] = b
              if b
                gon.category_subject_text.push(a_category_subjects[22].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_24
              gon.category_subject[23] = b
              if b
                gon.category_subject_text.push(a_category_subjects[23].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_25
              gon.category_subject[24] = b
              if b
                gon.category_subject_text.push(a_category_subjects[24].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_26
              gon.category_subject[25] = b
              if b
                gon.category_subject_text.push(a_category_subjects[25].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_27
              gon.category_subject[26] = b
              if b
                gon.category_subject_text.push(a_category_subjects[26].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_28
              gon.category_subject[27] = b
              if b
                gon.category_subject_text.push(a_category_subjects[27].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_29
              gon.category_subject[28] = b
              if b
                gon.category_subject_text.push(a_category_subjects[28].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_30
              gon.category_subject[29] = b
              if b
                gon.category_subject_text.push(a_category_subjects[29].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_31
              gon.category_subject[30] = b
              if b
                gon.category_subject_text.push(a_category_subjects[30].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_32
              gon.category_subject[31] = b
              if b
                gon.category_subject_text.push(a_category_subjects[31].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_33
              gon.category_subject[32] = b
              if b
                gon.category_subject_text.push(a_category_subjects[32].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_34
              gon.category_subject[33] = b
              if b
                gon.category_subject_text.push(a_category_subjects[33].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_35
              gon.category_subject[34] = b
              if b
                gon.category_subject_text.push(a_category_subjects[34].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_36
              gon.category_subject[35] = b
              if b
                gon.category_subject_text.push(a_category_subjects[35].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_37
              gon.category_subject[36] = b
              if b
                gon.category_subject_text.push(a_category_subjects[36].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_38
              gon.category_subject[37] = b
              if b
                gon.category_subject_text.push(a_category_subjects[37].col_1)  
              end        
              b = @publisher_product_category_subject.category_subject_39
              gon.category_subject[38] = b
              if b
                gon.category_subject_text.push(a_category_subjects[38].col_1)  
              end        
          end








          # # a_from_ages = Array.new
          # @from_ages = return_all_dtab8lets
          # # @from_ages.each do |from_age|
            # # a_from_ages.push(from_age)
          # # end
          # gon.from_age = []
          # gon.from_age_text = []    
          # # gon.b_required_from_age = publisher_product.publisher_product_age_range.required
          # # a_to_ages = Array.new
          # @to_ages = return_all_dtab8lets
          # # @to_ages.each do |to_age|
            # # a_to_ages.push(to_age)
          # # end
          # gon.to_age = []
          # gon.to_age_text = []    
          # # gon.b_required_to_age = publisher_product.publisher_product_age_range.required           




          age_range_table = return_all_dtab8lets
          @from_ages = age_range_table
          @to_ages = age_range_table
          # b_required_from_age and b_required_to_age are only for fields in the view
          # they do not exist in the model, only b_required
          b_required_from_age = false
          b_required_to_age = true
          b_updated_age_range = true
          
          publisher_product_age_range = publisher_product.publisher_product_age_range rescue nil
          from_age = publisher_product_age_range.age_from
          to_age = publisher_product_age_range.age_to

          # Rails.logger.info("from_age = " + from_age.to_s)
          # Rails.logger.info("to_age = " + to_age.to_s)

          gon.i_from_age = from_age
          gon.i_to_age = to_age

          from_age = from_age - 1
          to_age = to_age - 1

          b_required = publisher_product_age_range.required
          b_required_from_age = b_required
          b_required_to_age = b_required
          
          a_from_ages = Array.new
          from_ages = age_range_table
          from_ages.each do |age|
          # from_ages.each_with_index do |age , index|
            # Rails.logger.info("age index = " + index.to_s)
            # if (index != 0)
              a_from_ages.push(age)
            # end
          end

          gon.from_age = []
          gon.from_age_text = []    
          gon.to_age = []
          gon.to_age_text = []    
          
          z = 18
          for i in 0..z
              gon.from_age[i] = false
              gon.to_age[i] = false
          end

          gon.from_age[from_age] = true
          gon.from_age_text.push(a_from_ages[from_age].col_1)                            
          gon.to_age[to_age] = true
          gon.to_age_text.push(a_from_ages[to_age].col_1) # a_to_ages is the same as a_from_ages
          










          a_from_grades = Array.new
          @from_grades_ordered = return_all_dtab9lets_ordered
          @from_grades = return_all_dtab9lets
          @from_grades.each do |from_grade|
            a_from_grades.push(from_grade)
          end
          gon.from_grade = []
          gon.from_grade_text = []    
          # gon.b_required_from_grade = publisher_product.publisher_product_grade_range.required           

          a_to_grades = Array.new
          @to_grades_ordered = return_all_dtab9lets_ordered
          @to_grades = return_all_dtab9lets
          @to_grades.each do |to_grade|
            a_to_grades.push(to_grade)
          end
          gon.to_grade = []
          gon.to_grade_text = []    
          # gon.b_required_to_grade = publisher_product.publisher_product_grade_range.required           


          # @publisher_product_from_age = publisher_product.publisher_product_from_age
          # a_from_ages = Array.new
          # @from_ages = return_all_dtab8lets
          # @from_ages.each do |from_age|
            # a_from_ages.push(from_age)
          # end
          # gon.from_age = []
          # gon.from_age_text = []    
          # gon.b_required_from_age = @publisher_product_from_age.required           
          # if (@publisher_product_from_age.age_1 or
              # @publisher_product_from_age.age_2 or
              # @publisher_product_from_age.age_3 or
              # @publisher_product_from_age.age_4 or
              # @publisher_product_from_age.age_5 or
              # @publisher_product_from_age.age_6 or
              # @publisher_product_from_age.age_7 or
              # @publisher_product_from_age.age_8 or
              # @publisher_product_from_age.age_9 or
              # @publisher_product_from_age.age_10 or
              # @publisher_product_from_age.age_11 or
              # @publisher_product_from_age.age_12 or
              # @publisher_product_from_age.age_13 or
              # @publisher_product_from_age.age_14 or
              # @publisher_product_from_age.age_15 or
              # @publisher_product_from_age.age_16 or
              # @publisher_product_from_age.age_17 or
              # @publisher_product_from_age.age_18 or
              # @publisher_product_from_age.age_19 or
              # @publisher_product_from_age.age_20)
              # # gon.b_required_from_age = false
              # b = @publisher_product_from_age.age_1
              # gon.from_age[0] = b
              # if b
                # gon.from_age_text.push(a_from_ages[0].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_2
              # gon.from_age[1] = b
              # if b
                # gon.from_age_text.push(a_from_ages[1].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_3
              # gon.from_age[2] = b
              # if b
                # gon.from_age_text.push(a_from_ages[2].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_4
              # gon.from_age[3] = b
              # if b
                # gon.from_age_text.push(a_from_ages[3].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_5
              # gon.from_age[4] = b
              # if b
                # gon.from_age_text.push(a_from_ages[4].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_6
              # gon.from_age[5] = b
              # if b
                # gon.from_age_text.push(a_from_ages[5].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_7
              # gon.from_age[6] = b
              # if b
                # gon.from_age_text.push(a_from_ages[6].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_8
              # gon.from_age[7] = b
              # if b
                # gon.from_age_text.push(a_from_ages[7].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_9
              # gon.from_age[8] = b
              # if b
                # gon.from_age_text.push(a_from_ages[8].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_10
              # gon.from_age[9] = b
              # if b
                # gon.from_age_text.push(a_from_ages[9].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_11
              # gon.from_age[10] = b
              # if b
                # gon.from_age_text.push(a_from_ages[10].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_12
              # gon.from_age[11] = b
              # if b
                # gon.from_age_text.push(a_from_ages[11].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_13
              # gon.from_age[12] = b
              # if b
                # gon.from_age_text.push(a_from_ages[12].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_14
              # gon.from_age[13] = b
              # if b
                # gon.from_age_text.push(a_from_ages[13].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_15
              # gon.from_age[14] = b
              # if b
                # gon.from_age_text.push(a_from_ages[14].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_16
              # gon.from_age[15] = b
              # if b
                # gon.from_age_text.push(a_from_ages[15].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_17
              # gon.from_age[16] = b
              # if b
                # gon.from_age_text.push(a_from_ages[16].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_18
              # gon.from_age[17] = b
              # if b
                # gon.from_age_text.push(a_from_ages[17].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_19
              # gon.from_age[18] = b
              # if b
                # gon.from_age_text.push(a_from_ages[18].col_1)                            
              # end        
              # b = @publisher_product_from_age.age_20
              # gon.from_age[19] = b
              # if b
                # gon.from_age_text.push(a_from_ages[19].col_1)                            
              # end        
          # end
          # @publisher_product_to_age = publisher_product.publisher_product_to_age
          # a_to_ages = Array.new
          # @to_ages = return_all_dtab8lets
          # @to_ages.each do |to_age|
            # a_to_ages.push(to_age)
          # end
          # gon.to_age = []
          # gon.to_age_text = []    
          # gon.b_required_from_age = @publisher_product_to_age.required           
          # if (@publisher_product_to_age.age_1 or
              # @publisher_product_to_age.age_2 or
              # @publisher_product_to_age.age_3 or
              # @publisher_product_to_age.age_4 or
              # @publisher_product_to_age.age_5 or
              # @publisher_product_to_age.age_6 or
              # @publisher_product_to_age.age_7 or
              # @publisher_product_to_age.age_8 or
              # @publisher_product_to_age.age_9 or
              # @publisher_product_to_age.age_10 or
              # @publisher_product_to_age.age_11 or
              # @publisher_product_to_age.age_12 or
              # @publisher_product_to_age.age_13 or
              # @publisher_product_to_age.age_14 or
              # @publisher_product_to_age.age_15 or
              # @publisher_product_to_age.age_16 or
              # @publisher_product_to_age.age_17 or
              # @publisher_product_to_age.age_18 or
              # @publisher_product_to_age.age_19 or
              # @publisher_product_to_age.age_20)
              # # gon.b_required_to_age = false
              # b = @publisher_product_to_age.age_1
              # gon.to_age[0] = b
              # if b
                # gon.to_age_text.push(a_to_ages[0].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_2
              # gon.to_age[1] = b
              # if b
                # gon.to_age_text.push(a_to_ages[1].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_3
              # gon.to_age[2] = b
              # if b
                # gon.to_age_text.push(a_to_ages[2].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_4
              # gon.to_age[3] = b
              # if b
                # gon.to_age_text.push(a_to_ages[3].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_5
              # gon.to_age[4] = b
              # if b
                # gon.to_age_text.push(a_to_ages[4].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_6
              # gon.to_age[5] = b
              # if b
                # gon.to_age_text.push(a_to_ages[5].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_7
              # gon.to_age[6] = b
              # if b
                # gon.to_age_text.push(a_to_ages[6].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_8
              # gon.to_age[7] = b
              # if b
                # gon.to_age_text.push(a_to_ages[7].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_9
              # gon.to_age[8] = b
              # if b
                # gon.to_age_text.push(a_to_ages[8].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_10
              # gon.to_age[9] = b
              # if b
                # gon.to_age_text.push(a_to_ages[9].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_11
              # gon.to_age[10] = b
              # if b
                # gon.to_age_text.push(a_to_ages[10].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_12
              # gon.to_age[11] = b
              # if b
                # gon.to_age_text.push(a_to_ages[11].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_13
              # gon.to_age[12] = b
              # if b
                # gon.to_age_text.push(a_to_ages[12].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_14
              # gon.to_age[13] = b
              # if b
                # gon.to_age_text.push(a_to_ages[13].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_15
              # gon.to_age[14] = b
              # if b
                # gon.to_age_text.push(a_to_ages[14].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_16
              # gon.to_age[15] = b
              # if b
                # gon.to_age_text.push(a_to_ages[15].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_17
              # gon.to_age[16] = b
              # if b
                # gon.to_age_text.push(a_to_ages[16].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_18
              # gon.to_age[17] = b
              # if b
                # gon.to_age_text.push(a_to_ages[17].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_19
              # gon.to_age[18] = b
              # if b
                # gon.to_age_text.push(a_to_ages[18].col_1)                            
              # end        
              # b = @publisher_product_to_age.age_20
              # gon.to_age[19] = b
              # if b
                # gon.to_age_text.push(a_to_ages[19].col_1)                            
              # end        
          # end
#           
          # @publisher_product_from_grade = publisher_product.publisher_product_from_grade
          # a_from_grades = Array.new
          # @from_grades_ordered = return_all_dtab9lets_ordered
          # @from_grades = return_all_dtab9lets
          # @from_grades.each do |from_grade|
            # a_from_grades.push(from_grade)
          # end
          # gon.from_grade = []
          # gon.from_grade_text = []    
          # gon.b_required_from_grade = @publisher_product_from_grade.required           
          # if (@publisher_product_from_grade.grade_1 or
              # @publisher_product_from_grade.grade_2 or
              # @publisher_product_from_grade.grade_3 or
              # @publisher_product_from_grade.grade_4 or
              # @publisher_product_from_grade.grade_5 or
              # @publisher_product_from_grade.grade_6 or
              # @publisher_product_from_grade.grade_7 or
              # @publisher_product_from_grade.grade_8 or
              # @publisher_product_from_grade.grade_9 or
              # @publisher_product_from_grade.grade_10 or
              # @publisher_product_from_grade.grade_11 or
              # @publisher_product_from_grade.grade_12 or
              # @publisher_product_from_grade.grade_13 or
              # @publisher_product_from_grade.grade_14 or
              # @publisher_product_from_grade.grade_15 or
              # @publisher_product_from_grade.grade_16)
              # # gon.b_required_from_grade = false
              # b = @publisher_product_from_grade.grade_1
              # gon.from_grade[0] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[0].col_1)            
              # end        
              # b = @publisher_product_from_grade.grade_2
              # gon.from_grade[1] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[1].col_1)                       
              # end        
              # b = @publisher_product_from_grade.grade_3
              # gon.from_grade[2] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[2].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_4
              # gon.from_grade[3] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[3].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_5
              # gon.from_grade[4] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[4].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_6
              # gon.from_grade[5] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[5].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_7
              # gon.from_grade[6] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[6].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_8
              # gon.from_grade[7] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[7].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_9
              # gon.from_grade[8] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[8].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_10
              # gon.from_grade[9] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[9].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_11
              # gon.from_grade[10] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[10].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_12
              # gon.from_grade[11] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[11].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_13
              # gon.from_grade[12] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[12].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_14
              # gon.from_grade[13] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[13].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_15
              # gon.from_grade[14] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[14].col_1)                            
              # end        
              # b = @publisher_product_from_grade.grade_16
              # gon.from_grade[15] = b
              # if b
                # gon.from_grade_text.push(a_from_grades[15].col_1)                            
              # end        
          # end
          # @publisher_product_to_grade = publisher_product.publisher_product_to_grade
          # a_to_grades = Array.new
          # @to_grades_ordered = return_all_dtab9lets_ordered
          # @to_grades = return_all_dtab9lets
          # @to_grades.each do |to_grade|
            # a_to_grades.push(to_grade)
          # end
          # gon.to_grade = []
          # gon.to_grade_text = []    
          # gon.b_required_to_grade = @publisher_product_to_grade.required           
          # if (@publisher_product_to_grade.grade_1 or
              # @publisher_product_to_grade.grade_2 or
              # @publisher_product_to_grade.grade_3 or
              # @publisher_product_to_grade.grade_4 or
              # @publisher_product_to_grade.grade_5 or
              # @publisher_product_to_grade.grade_6 or
              # @publisher_product_to_grade.grade_7 or
              # @publisher_product_to_grade.grade_8 or
              # @publisher_product_to_grade.grade_9 or
              # @publisher_product_to_grade.grade_10 or
              # @publisher_product_to_grade.grade_11 or
              # @publisher_product_to_grade.grade_12 or
              # @publisher_product_to_grade.grade_13 or
              # @publisher_product_to_grade.grade_14 or
              # @publisher_product_to_grade.grade_15 or
              # @publisher_product_to_grade.grade_16)
              # # gon.b_required_to_grade = false
              # b = @publisher_product_to_grade.grade_1
              # gon.to_grade[0] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[0].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_2
              # gon.to_grade[1] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[1].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_3
              # gon.to_grade[2] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[2].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_4
              # gon.to_grade[3] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[3].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_5
              # gon.to_grade[4] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[4].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_6
              # gon.to_grade[5] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[5].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_7
              # gon.to_grade[6] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[6].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_8
              # gon.to_grade[7] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[7].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_9
              # gon.to_grade[8] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[8].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_10
              # gon.to_grade[9] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[9].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_11
              # gon.to_grade[10] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[10].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_12
              # gon.to_grade[11] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[11].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_13
              # gon.to_grade[12] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[12].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_14
              # gon.to_grade[13] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[13].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_15
              # gon.to_grade[14] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[14].col_1)                            
              # end        
              # b = @publisher_product_to_grade.grade_16
              # gon.to_grade[15] = b
              # if b
                # gon.to_grade_text.push(a_to_grades[15].col_1)                            
              # end        
          # end
          
          
          
          
          @publisher_product_market_target = publisher_product.publisher_product_market_target
          a_market_targets = Array.new
          @market_targets = return_all_dtab11lets
          @market_targets.each do |m_target|
            a_market_targets.push(m_target)
          end
          gon.market_target = []
          gon.market_target_text = []    
          gon.b_required_market_target = true                                
          if (@publisher_product_market_target.market_target_1 or
              @publisher_product_market_target.market_target_2)
              # @b_market_target_index = true
              gon.b_required_market_target = false
              b = @publisher_product_market_target.market_target_1
              gon.market_target[0] = b
              if b
                gon.market_target_text.push(a_market_targets[0].col_1)                            
              end        
              b = @publisher_product_market_target.market_target_2
              gon.market_target[1] = b
              if b
                gon.market_target_text.push(a_market_targets[1].col_1)                            
              end        
          end
          
          @publisher_product_platform = publisher_product.publisher_product_platform
          a_platforms = Array.new
          @platforms = return_all_dtab3lets
          @platforms.each do |pltfrm|
            a_platforms.push(pltfrm)
          end
          gon.platform = []    
          gon.platform_text = []    
          b_platform_other = false
          gon.has_platform_other = false
          gon.platform_other = ""
          if @publisher_product_platform.platform_other_b      
              b_platform_other = true
              gon.has_platform_other = true
              gon.platform_other = @publisher_product_platform.platform_other            
          end    
          gon.b_required_platform = true                        
          if (@publisher_product_platform.platform_1 or
              @publisher_product_platform.platform_2 or
              @publisher_product_platform.platform_3 or
              @publisher_product_platform.platform_4 or
              @publisher_product_platform.platform_5 or
              @publisher_product_platform.platform_6 or
              @publisher_product_platform.platform_7 or
              @publisher_product_platform.platform_8 or
              @publisher_product_platform.platform_9 or
              @publisher_product_platform.platform_10 or
              @publisher_product_platform.platform_11 or
              @publisher_product_platform.platform_12 or
              @publisher_product_platform.platform_13)
              # @b_platform = true
              gon.b_required_platform = false
              b = @publisher_product_platform.platform_1
              gon.platform[0] = b
              if b
                gon.platform_text.push(a_platforms[0].col_1)                            
              end        
              b = @publisher_product_platform.platform_2
              gon.platform[1] = b
              if b
                gon.platform_text.push(a_platforms[1].col_1)                            
              end        
              b = @publisher_product_platform.platform_3
              gon.platform[2] = b
              if b
                gon.platform_text.push(a_platforms[2].col_1)                            
              end        
              b = @publisher_product_platform.platform_4
              gon.platform[3] = b
              if b
                gon.platform_text.push(a_platforms[3].col_1)  
              end        
               b = @publisher_product_platform.platform_5
              gon.platform[4] = b
              if b
                gon.platform_text.push(a_platforms[4].col_1)  
              end        
              b = @publisher_product_platform.platform_6
              gon.platform[5] = b
              if b
                gon.platform_text.push(a_platforms[5].col_1)  
              end        
              b = @publisher_product_platform.platform_7
              gon.platform[6] = b
              if b
                gon.platform_text.push(a_platforms[6].col_1)  
              end        
              b = @publisher_product_platform.platform_8
              gon.platform[7] = b
              if b
                gon.platform_text.push(a_platforms[7].col_1)  
              end        
              b = @publisher_product_platform.platform_9
              gon.platform[8] = b
              if b
                gon.platform_text.push(a_platforms[8].col_1)  
              end        
              b = @publisher_product_platform.platform_10
              gon.platform[9] = b
              if b
                gon.platform_text.push(a_platforms[9].col_1)  
              end        
              b = @publisher_product_platform.platform_11
              gon.platform[10] = b
              if b
                gon.platform_text.push(a_platforms[10].col_1)  
              end        
              b = @publisher_product_platform.platform_12
              gon.platform[11] = b
              if b
                gon.platform_text.push(a_platforms[11].col_1)  
              end        
              b = @publisher_product_platform.platform_13
              gon.platform[12] = b
              if b
                gon.platform_text.push(a_platforms[12].col_1)  
              end        
          end
          
          @publisher_product_file_type = publisher_product.publisher_product_file_type
          a_file_types = Array.new
          @file_types = return_all_dtab1lets
          @file_types.each do |ft|
            a_file_types.push(ft)
          end
          gon.file_type = []    
          gon.file_type_text = []    
          b_file_type_other = false
          gon.has_file_type_other = false
          gon.file_type_other = ""
          if @publisher_product_file_type.file_type_other_b      
              b_file_type_other = true
              gon.has_file_type_other = true
              gon.file_type_other = @publisher_product_file_type.file_type_other            
          end        
          gon.b_required_file_type = true                            
          if (@publisher_product_file_type.file_type_1 or
              @publisher_product_file_type.file_type_2 or
              @publisher_product_file_type.file_type_3 or
              @publisher_product_file_type.file_type_4 or
              @publisher_product_file_type.file_type_5 or
              @publisher_product_file_type.file_type_6 or
              @publisher_product_file_type.file_type_7 or
              @publisher_product_file_type.file_type_8 or
              @publisher_product_file_type.file_type_9 or
              @publisher_product_file_type.file_type_10 or
              @publisher_product_file_type.file_type_11 or
              @publisher_product_file_type.file_type_12 or
              @publisher_product_file_type.file_type_13 or
              @publisher_product_file_type.file_type_14 or
              @publisher_product_file_type.file_type_15 or
              @publisher_product_file_type.file_type_16 or
              @publisher_product_file_type.file_type_17 or
              @publisher_product_file_type.file_type_18 or
              @publisher_product_file_type.file_type_19 or
              @publisher_product_file_type.file_type_20 or
              @publisher_product_file_type.file_type_21)
              # @b_file_type = true
              gon.b_required_file_type = false
              b = @publisher_product_file_type.file_type_1
              gon.file_type[0] = b
              if b
                gon.file_type_text.push(a_file_types[0].col_1)                            
              end        
              b = @publisher_product_file_type.file_type_2
              gon.file_type[1] = b
              if b
                gon.file_type_text.push(a_file_types[1].col_1)                            
              end        
              b = @publisher_product_file_type.file_type_3
              gon.file_type[2] = b
              if b
                gon.file_type_text.push(a_file_types[2].col_1)                            
              end        
              b = @publisher_product_file_type.file_type_4
              gon.file_type[3] = b
              if b
                gon.file_type_text.push(a_file_types[3].col_1)  
              end        
              b = @publisher_product_file_type.file_type_5
              gon.file_type[4] = b
              if b
                gon.file_type_text.push(a_file_types[4].col_1)  
              end        
              b = @publisher_product_file_type.file_type_6
              gon.file_type[5] = b
              if b
                gon.file_type_text.push(a_file_types[5].col_1)  
              end        
              b = @publisher_product_file_type.file_type_7
              gon.file_type[6] = b
              if b
                gon.file_type_text.push(a_file_types[6].col_1)  
              end        
              b = @publisher_product_file_type.file_type_8
              gon.file_type[7] = b
              if b
                gon.file_type_text.push(a_file_types[7].col_1)  
              end        
              b = @publisher_product_file_type.file_type_9
              gon.file_type[8] = b
              if b
                gon.file_type_text.push(a_file_types[8].col_1)  
              end        
              b = @publisher_product_file_type.file_type_10
              gon.file_type[9] = b
              if b
                gon.file_type_text.push(a_file_types[9].col_1)  
              end        
              b = @publisher_product_file_type.file_type_11
              gon.file_type[10] = b
              if b
                gon.file_type_text.push(a_file_types[10].col_1)  
              end        
              b = @publisher_product_file_type.file_type_12
              gon.file_type[11] = b
              if b
                gon.file_type_text.push(a_file_types[11].col_1)  
              end        
              b = @publisher_product_file_type.file_type_13
              gon.file_type[12] = b
              if b
                gon.file_type_text.push(a_file_types[12].col_1)  
              end        
              b = @publisher_product_file_type.file_type_14
              gon.file_type[13] = b
              if b
                gon.file_type_text.push(a_file_types[13].col_1)  
              end        
              b = @publisher_product_file_type.file_type_15
              gon.file_type[14] = b
              if b
                gon.file_type_text.push(a_file_types[14].col_1)  
              end        
              b = @publisher_product_file_type.file_type_16
              gon.file_type[15] = b
              if b
                gon.file_type_text.push(a_file_types[15].col_1)  
              end        
              b = @publisher_product_file_type.file_type_17
              gon.file_type[16] = b
              if b
                gon.file_type_text.push(a_file_types[16].col_1)  
              end        
              b = @publisher_product_file_type.file_type_18
              gon.file_type[17] = b
              if b
                gon.file_type_text.push(a_file_types[17].col_1)  
              end        
              b = @publisher_product_file_type.file_type_19
              gon.file_type[18] = b
              if b
                gon.file_type_text.push(a_file_types[18].col_1)  
              end        
              b = @publisher_product_file_type.file_type_20
              gon.file_type[19] = b
              if b
                gon.file_type_text.push(a_file_types[19].col_1)  
              end        
              b = @publisher_product_file_type.file_type_21
              gon.file_type[20] = b
              if b
                gon.file_type_text.push(a_file_types[20].col_1)  
              end        
          end

          @publisher_product_enhancement = publisher_product.publisher_product_enhancement
          a_enhancements = Array.new
          @enhancements = return_all_dtab6lets
          @enhancements.each do |enhncmnt|
            a_enhancements.push(enhncmnt)
          end
          gon.enhancement = []
          gon.enhancement_text = []    
          b_enhancement_other = false
          gon.has_enhancement_other = false
          gon.enhancement_other = ""
          if @publisher_product_enhancement.enhancement_other_b      
              b_enhancement_other = true
              gon.has_enhancement_other = true
              gon.enhancement_other = @publisher_product_enhancement.enhancement_other            
          end            
          gon.b_required_enhancement = true                                
          if (@publisher_product_enhancement.enhancement_1 or
              @publisher_product_enhancement.enhancement_2 or
              @publisher_product_enhancement.enhancement_3 or
              @publisher_product_enhancement.enhancement_4 or
              @publisher_product_enhancement.enhancement_5 or
              @publisher_product_enhancement.enhancement_6 or
              @publisher_product_enhancement.enhancement_7 or
              @publisher_product_enhancement.enhancement_8 or
              @publisher_product_enhancement.enhancement_9 or
              @publisher_product_enhancement.enhancement_10 or
              @publisher_product_enhancement.enhancement_11 or
              @publisher_product_enhancement.enhancement_12)
              gon.b_required_enhancement = false
              b = @publisher_product_enhancement.enhancement_1
              gon.enhancement[0] = b
              if b
                gon.enhancement_text.push(a_enhancements[0].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_2
              gon.enhancement[1] = b
              if b
                gon.enhancement_text.push(a_enhancements[1].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_3
              gon.enhancement[2] = b
              if b
                gon.enhancement_text.push(a_enhancements[2].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_4
              gon.enhancement[3] = b
              if b
                gon.enhancement_text.push(a_enhancements[3].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_5
              gon.enhancement[4] = b
              if b
                gon.enhancement_text.push(a_enhancements[4].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_6
              gon.enhancement[5] = b
              if b
                gon.enhancement_text.push(a_enhancements[5].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_7
              gon.enhancement[6] = b
              if b
                gon.enhancement_text.push(a_enhancements[6].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_8
              gon.enhancement[7] = b
              if b
                gon.enhancement_text.push(a_enhancements[7].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_9
              gon.enhancement[8] = b
              if b
                gon.enhancement_text.push(a_enhancements[8].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_10
              gon.enhancement[9] = b
              if b
                gon.enhancement_text.push(a_enhancements[9].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_11
              gon.enhancement[10] = b
              if b
                gon.enhancement_text.push(a_enhancements[10].col_1)                            
              end        
              b = @publisher_product_enhancement.enhancement_12
              gon.enhancement[11] = b
              if b
                gon.enhancement_text.push(a_enhancements[11].col_1)                            
              end        
          end
      
          @publisher_product_core_literacy_standards = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @core_literacy_standards = CoreLiteracyStandard.order(sort_column_core_literacy + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_core_literacy_standards = Array.new
          @b_core_literacy_standard = true
          gon.core_literacy_standard = []
          gon.core_literacy_standard_text = []
          gon.core_literacy_standards_count = @core_literacy_standards.count 
          if @publisher_product_core_literacy_standards.any?
            i = 0
            ii = 0
            @publisher_product_core_literacy_standards.each do |c|
              gon.core_literacy_standard[i] = c.id_standard
              ii = c.id_standard - 1
              a_core_literacy_standards[i] = @core_literacy_standards[ii].dot_not
              i += 1
            end
            gon.core_literacy_standard_text = a_core_literacy_standards
          else
            #
          end
      
          @publisher_product_core_math_standards = PublisherProductCoreMathStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @core_math_standards = CoreMathStandard.order(sort_column_core_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_core_math_standards = Array.new
          @b_core_math_standard = true
          gon.core_math_standard = []
          gon.core_math_standard_text = []
          gon.core_math_standards_count = @core_math_standards.count
          if @publisher_product_core_math_standards.any?
            i = 0
            ii = 0
            @publisher_product_core_math_standards.each do |c|
              gon.core_math_standard[i] = c.id_standard
              ii = c.id_standard - 1
              a_core_math_standards[i] = @core_math_standards[ii].dot_not
              i += 1
            end
            gon.core_math_standard_text = a_core_math_standards
          else
            #
          end

          # 122 english
          # 123 math              
          # 124 science
          # 125 social_studies
          # 126 languages_non_eng
          # 127 health_ed
          # 128 physical_ed
          # 129 fine_arts
          # 130 economics
          # 131 technology        
          # 132 career_dev
          # 133 second_language_eng_span        
          # 134 career_tech_ed

          @publisher_product_teks_english_standards = PublisherProductTeksEnglishStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_english_standards = TeksEnglishStandard.order(sort_column_teks_english + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_english_standards = Array.new
          @b_teks_english_standard = true
          gon.teks_english_standard = []
          gon.teks_english_standard_text = []
          gon.teks_english_standards_count = @teks_english_standards.count
          if @publisher_product_teks_english_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_english_standards.each do |c|
                  gon.teks_english_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_english_standards[i] = @teks_english_standards[ii].section_text
                  i += 1
              end
              gon.teks_english_standard_text = a_teks_english_standards
          else
              #
          end

          @publisher_product_teks_math_standards = PublisherProductTeksMathStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_math_standards = TeksMathStandard.order(sort_column_teks_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_math_standards = Array.new
          @b_teks_math_standard = true
          gon.teks_math_standard = []
          gon.teks_math_standard_text = []
          gon.teks_math_standards_count = @teks_math_standards.count
          if @publisher_product_teks_math_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_math_standards.each do |c|
                  gon.teks_math_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_math_standards[i] = @teks_math_standards[ii].section_text
                  i += 1
              end
              gon.teks_math_standard_text = a_teks_math_standards
          else
              #
          end

          @publisher_product_teks_science_standards = PublisherProductTeksScienceStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_science_standards = TeksScienceStandard.order(sort_column_teks_science + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_science_standards = Array.new
          @b_teks_science_standard = true
          gon.teks_science_standard = []
          gon.teks_science_standard_text = []
          gon.teks_science_standards_count = @teks_science_standards.count
          if @publisher_product_teks_science_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_science_standards.each do |c|
                  gon.teks_science_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_science_standards[i] = @teks_science_standards[ii].section_text
                  i += 1
              end
              gon.teks_science_standard_text = a_teks_science_standards
          else
              #
          end

          @publisher_product_teks_social_studies_standards = PublisherProductTeksSocialStudiesStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_social_studies_standards = TeksSocialStudiesStandard.order(sort_column_teks_social_studies + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_social_studies_standards = Array.new
          @b_teks_social_studies_standard = true
          gon.teks_social_studies_standard = []
          gon.teks_social_studies_standard_text = []
          gon.teks_social_studies_standards_count = @teks_social_studies_standards.count
          if @publisher_product_teks_social_studies_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_social_studies_standards.each do |c|
                  gon.teks_social_studies_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_social_studies_standards[i] = @teks_social_studies_standards[ii].section_text
                  i += 1
              end
              gon.teks_social_studies_standard_text = a_teks_social_studies_standards
          else
              #
          end

          @publisher_product_teks_languages_non_eng_standards = PublisherProductTeksLanguagesNonEngStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_languages_non_eng_standards = TeksLanguagesNonEngStandard.order(sort_column_teks_languages_non_eng + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_languages_non_eng_standards = Array.new
          @b_teks_languages_non_eng_standard = true
          gon.teks_languages_non_eng_standard = []
          gon.teks_languages_non_eng_standard_text = []
          gon.teks_languages_non_eng_standards_count = @teks_languages_non_eng_standards.count
          if @publisher_product_teks_languages_non_eng_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_languages_non_eng_standards.each do |c|
                  gon.teks_languages_non_eng_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_languages_non_eng_standards[i] = @teks_languages_non_eng_standards[ii].section_text
                  i += 1
              end
              gon.teks_languages_non_eng_standard_text = a_teks_languages_non_eng_standards
          else
              #
          end

          @publisher_product_teks_health_ed_standards = PublisherProductTeksHealthEdStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_health_ed_standards = TeksHealthEdStandard.order(sort_column_teks_health_ed + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_health_ed_standards = Array.new
          @b_teks_health_ed_standard = true
          gon.teks_health_ed_standard = []
          gon.teks_health_ed_standard_text = []
          gon.teks_health_ed_standards_count = @teks_health_ed_standards.count
          if @publisher_product_teks_health_ed_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_health_ed_standards.each do |c|
                  gon.teks_health_ed_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_health_ed_standards[i] = @teks_health_ed_standards[ii].section_text
                  i += 1
              end
              gon.teks_health_ed_standard_text = a_teks_health_ed_standards
          else
              #
          end

          @publisher_product_teks_physical_ed_standards = PublisherProductTeksPhysicalEdStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_physical_ed_standards = TeksPhysicalEdStandard.order(sort_column_teks_physical_ed + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_physical_ed_standards = Array.new
          @b_teks_physical_ed_standard = true
          gon.teks_physical_ed_standard = []
          gon.teks_physical_ed_standard_text = []
          gon.teks_physical_ed_standards_count = @teks_physical_ed_standards.count
          if @publisher_product_teks_physical_ed_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_physical_ed_standards.each do |c|
                  gon.teks_physical_ed_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_physical_ed_standards[i] = @teks_physical_ed_standards[ii].section_text
                  i += 1
              end
              gon.teks_physical_ed_standard_text = a_teks_physical_ed_standards
          else
              #
          end

          @publisher_product_teks_fine_arts_standards = PublisherProductTeksFineArtsStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_fine_arts_standards = TeksFineArtsStandard.order(sort_column_teks_fine_arts + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_fine_arts_standards = Array.new
          @b_teks_fine_arts_standard = true
          gon.teks_fine_arts_standard = []
          gon.teks_fine_arts_standard_text = []
          gon.teks_fine_arts_standards_count = @teks_fine_arts_standards.count
          if @publisher_product_teks_fine_arts_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_fine_arts_standards.each do |c|
                  gon.teks_fine_arts_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_fine_arts_standards[i] = @teks_fine_arts_standards[ii].section_text
                  i += 1
              end
              gon.teks_fine_arts_standard_text = a_teks_fine_arts_standards
          else
              #
          end

          @publisher_product_teks_economics_standards = PublisherProductTeksEconomicsStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_economics_standards = TeksEconomicsStandard.order(sort_column_teks_economics + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_economics_standards = Array.new
          @b_teks_economics_standard = true
          gon.teks_economics_standard = []
          gon.teks_economics_standard_text = []
          gon.teks_economics_standards_count = @teks_economics_standards.count
          if @publisher_product_teks_economics_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_economics_standards.each do |c|
                  gon.teks_economics_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_economics_standards[i] = @teks_economics_standards[ii].section_text
                  i += 1
              end
              gon.teks_economics_standard_text = a_teks_economics_standards
          else
              #
          end

          @publisher_product_teks_technology_standards = PublisherProductTeksTechnologyStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_technology_standards = TeksTechnologyStandard.order(sort_column_teks_technology + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_technology_standards = Array.new
          @b_teks_technology_standard = true
          gon.teks_technology_standard = []
          gon.teks_technology_standard_text = []
          gon.teks_technology_standards_count = @teks_technology_standards.count
          if @publisher_product_teks_technology_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_technology_standards.each do |c|
                  gon.teks_technology_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_technology_standards[i] = @teks_technology_standards[ii].section_text
                  i += 1
              end
              gon.teks_technology_standard_text = a_teks_technology_standards
          else
              #
          end

          @publisher_product_teks_career_dev_standards = PublisherProductTeksCareerDevStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_career_dev_standards = TeksCareerDevStandard.order(sort_column_teks_career_dev + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_career_dev_standards = Array.new
          @b_teks_career_dev_standard = true
          gon.teks_career_dev_standard = []
          gon.teks_career_dev_standard_text = []
          gon.teks_career_dev_standards_count = @teks_career_dev_standards.count
          if @publisher_product_teks_career_dev_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_career_dev_standards.each do |c|
                  gon.teks_career_dev_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_career_dev_standards[i] = @teks_career_dev_standards[ii].section_text
                  i += 1
              end
              gon.teks_career_dev_standard_text = a_teks_career_dev_standards
          else
              #
          end

          @publisher_product_teks_second_language_eng_span_standards = PublisherProductTeksSecondLanguageEngSpanStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_second_language_eng_span_standards = TeksSecondLanguageEngSpanStandard.order(sort_column_teks_second_language_eng_span + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_second_language_eng_span_standards = Array.new
          @b_teks_second_language_eng_span_standard = true
          gon.teks_second_language_eng_span_standard = []
          gon.teks_second_language_eng_span_standard_text = []
          gon.teks_second_language_eng_span_standards_count = @teks_second_language_eng_span_standards.count
          if @publisher_product_teks_second_language_eng_span_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_second_language_eng_span_standards.each do |c|
                  gon.teks_second_language_eng_span_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_second_language_eng_span_standards[i] = @teks_second_language_eng_span_standards[ii].section_text
                  i += 1
              end
              gon.teks_second_language_eng_span_standard_text = a_teks_second_language_eng_span_standards
          else
              #
          end

          @publisher_product_teks_career_tech_ed_standards = PublisherProductTeksCareerTechEdStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
          @teks_career_tech_ed_standards = TeksCareerTechEdStandard.order(sort_column_teks_career_tech_ed + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
          a_teks_career_tech_ed_standards = Array.new
          @b_teks_career_tech_ed_standard = true
          gon.teks_career_tech_ed_standard = []
          gon.teks_career_tech_ed_standard_text = []
          gon.teks_career_tech_ed_standards_count = @teks_career_tech_ed_standards.count
          if @publisher_product_teks_career_tech_ed_standards.any?
              i = 0
              ii = 0
              @publisher_product_teks_career_tech_ed_standards.each do |c|
                  gon.teks_career_tech_ed_standard[i] = c.id_standard
                  ii = c.id_standard - 1
                  a_teks_career_tech_ed_standards[i] = @teks_career_tech_ed_standards[ii].section_text
                  i += 1
              end
              gon.teks_career_tech_ed_standard_text = a_teks_career_tech_ed_standards
          else
              #
          end

          # 122 english
          # 123 math              
          # 124 science
          # 125 social_studies
          # 126 languages_non_eng
          # 127 health_ed
          # 128 physical_ed
          # 129 fine_arts
          # 130 economics
          # 131 technology        
          # 132 career_dev
          # 133 second_language_eng_span        
          # 134 career_tech_ed


          @publisher_product_by_review = publisher_product.publisher_product_by_review
          a_by_reviews = Array.new
          @by_reviews = return_all_dtab7lets
          @by_reviews.each do |by_review|
            a_by_reviews.push(by_review)
          end
          gon.by_review = []    
          gon.by_review_text = []
          b_by_review_other = false
          gon.b_has_by_review_listing = false
          gon.has_by_review_other = false
          gon.by_review_other = ""
          if @publisher_product_by_review.by_review_other_b      
              b_by_review_other = true
              gon.has_by_review_other = true
              gon.b_has_by_review_listing = true
              gon.by_review_other = @publisher_product_by_review.by_review_other            
          end                
          gon.b_required_by_review = true                    
          if (@publisher_product_by_review.by_review_1 or
              @publisher_product_by_review.by_review_2)
              gon.b_required_by_review = false          
              gon.b_has_by_review_listing = true          
              b = @publisher_product_by_review.by_review_1
              gon.by_review[0] = b
              if b
                gon.by_review_text.push(a_by_reviews[0].col_1)                            
              end        
              b = @publisher_product_by_review.by_review_2
              gon.by_review[1] = b
              if b
                gon.by_review_text.push(a_by_reviews[1].col_1)                            
              end        
          end

          # @publisher_product_character = publisher_product.publisher_product_character
          # gon.character = []    
          # if (@publisher_product_character.character_1 or
              # @publisher_product_character.character_2 or
              # @publisher_product_character.character_3 or
              # @publisher_product_character.character_4 or
              # @publisher_product_character.character_5 or
              # @publisher_product_character.character_6 or
              # @publisher_product_character.character_7 or
              # @publisher_product_character.character_8 or
              # @publisher_product_character.character_9 or
              # @publisher_product_character.character_10)
              # @b_character = true
              # gon.character[1] = @publisher_product_character.character_1
              # gon.character[2] = @publisher_product_character.character_2
              # gon.character[3] = @publisher_product_character.character_3
              # gon.character[4] = @publisher_product_character.character_4
              # gon.character[5] = @publisher_product_character.character_5
              # gon.character[6] = @publisher_product_character.character_6
              # gon.character[7] = @publisher_product_character.character_7
              # gon.character[8] = @publisher_product_character.character_8
              # gon.character[9] = @publisher_product_character.character_9
              # gon.character[10] = @publisher_product_character.character_10
          # end
      
          # determing last update to form
          date_0 = Time.zone.parse('2000-01-01 00:00:00')
          if @publisher_product_manifest
            date_updated_manifest = @publisher_product_manifest.updated_at
          else 
            date_updated_manifest = date_0
          end    
          if @publisher_product_image
            date_updated_image = @publisher_product_image.updated_at
          else
            date_updated_image = date_0
          end
          if @publisher_product_logo
            date_updated_logo =  @publisher_product_logo.updated_at
          else
            date_updated_logo = date_0
          end
          if @publisher_product_content_type
            date_updated_content_type = @publisher_product_content_type.updated_at
          else
            date_updated_content_type = date_0
          end
          if @publisher_product_category_subject
            date_updated_category_subject = @publisher_product_category_subject.updated_at
          else
            date_updated_content_type = date_0
          end    
          if @publisher_product_appropriate_age
            date_updated_appropriate_age = @publisher_product_appropriate_age.updated_at
          else
            date_updated_appropriate_age = date_0   
          end
          if @publisher_product_appropriate_grade
            date_updated_appropriate_grade = @publisher_product_appropriate_grade.updated_at
          else
            date_updated_appropriate_grade = date_0   
          end
          if @publisher_product_market_target
            date_updated_market_target = @publisher_product_market_target.updated_at
          else
            date_updated_market_target = date_0   
          end
          if @publisher_product_platform
            date_updated_platform = @publisher_product_platform.updated_at
          else
            date_updated_platform = date_0   
          end
          if @publisher_product_file_type
            date_updated_file_type = @publisher_product_file_type.updated_at
          else
            date_updated_file_type = date_0   
          end
          if @publisher_product_character
            date_updated_character = @publisher_product_character.updated_at
          else
            date_updated_character = date_0   
          end
          if @publisher_product_by_review
            date_updated_by_review = @publisher_product_by_review.updated_at
          else
            date_updated_by_review = date_0   
          end
          if @publisher_product_enhancement
            date_updated_enhancement = @publisher_product_enhancement.updated_at
          else
            date_updated_enhancement = date_0   
          end
          if @publisher_product_pricing_model
            date_updated_pricing_model = @publisher_product_pricing_model.updated_at
          else
            date_updated_pricing_model = date_0   
          end
          if @publisher_product_price
            date_updated_price = @publisher_product_price.updated_at
          else
            date_updated_price = date_0   
          end
          # if @publisher_product_lesson_time
            # date_updated_lesson_time = @publisher_product_lesson_time.updated_at
          # else
            # date_updated_lesson_time = date_0   
          # end
          ar_updated = Array.new
          ar_updated.push(date_updated_manifest)
          ar_updated.push(date_updated_image)
          ar_updated.push(date_updated_logo)    
          ar_updated.push(date_updated_content_type)
          ar_updated.push(date_updated_appropriate_age)
          ar_updated.push(date_updated_appropriate_grade)    
          ar_updated.push(date_updated_market_target)
          ar_updated.push(date_updated_platform)
          ar_updated.push(date_updated_file_type)
          ar_updated.push(date_updated_character)
          ar_updated.push(date_updated_by_review)
          ar_updated.push(date_updated_enhancement)
          ar_updated.push(date_updated_pricing_model)
          ar_updated.push(date_updated_price)
          # ar_updated.push(date_updated_lesson_time)    
          greatest_updated = date_0
          ar_updated.each do |updated|
            if updated > greatest_updated
              greatest_updated = updated
            end      
          end    
          @last_updated =greatest_updated #.to_s(:long)
          gon.updated = @publisher_product_manifest.updated_at.to_s(:long)


          
      rescue StandardError => e

          LogError.create(:user_id => 0, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'index', :description => e.message.to_s)

      end      

    
  end

  

  def required_text_field(obj)
    
      # if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
          # b_product_headline = true
      # end
      begin

          b_obj = false
          if !((obj.blank?) or (obj.empty?) or (obj.nil?)) 
              b_obj = true
          end
        
          return b_obj

      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'set_required', :description => e.message.to_s)
      end      
      
      
  end



  def set_required

      begin
            
          if @@was_edited

              publisher_product_manifest_id = @@publisher_product_manifest_id
              Rails.logger.info('publisher_product_manifest_id held = ' + publisher_product_manifest_id.to_s)
            
              ar = params[:publisher_product_manifest]
              h_obj = Hash.new
              ar.each do |obj|
                  h_obj = obj
              end
        
              publisher_id = h_obj[:publisher_id]
              publisher_product_id = h_obj[:publisher_product_id]
            
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id.to_s).first rescue nil
              if !publisher_product.nil?
                  publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
                  if !publisher_product_manifest.nil?

                      publisher_product_manifest_id = publisher_product_manifest.id
                      Rails.logger.info('publisher_product_manifest_id found = ' + publisher_product_manifest_id.to_s) 

                      # product_headline
                      b_product_headline = required_text_field(publisher_product_manifest.product_headline)            
                      if b_product_headline
                          h_update = Hash.new
                          h_update[:has_required_1] = true
                          if publisher_product.update_attributes(h_update)
                              #
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'set_required', :description => 'publisher_product_manifest was nil')
                              raise
                          end
                      end            
                    
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'set_required', :description => 'publisher_product_manifest was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'set_required', :description => 'publisher_product was nil')
                  raise
              end
          end  

      rescue StandardError => e
          LogError.create(:user_id => 0, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'set_required', :description => e.message.to_s)
      end      

    
  end



  def update_product_headline

      begin
      
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
    
          publisher_id = h_obj[:publisher_id]
          publisher_product_id = h_obj[:publisher_product_id]
          product_headline = h_obj[:product_headline]
          
          b_error = true
          
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
              if !publisher_product_manifest.nil?
                  h_update = Hash.new
                  h_update[:publisher_id] = publisher_id
                  h_update[:publisher_product_id] = publisher_product_id
                  h_update[:product_headline] = product_headline
                  if publisher_product_manifest.update_attributes(h_update)
                      publisher_product_manifest_product_headline_updated = publisher_product_manifest.product_headline
                      b_product_headline = false
                      b_required = false
                      if !((publisher_product_manifest_product_headline_updated.blank?) or (publisher_product_manifest_product_headline_updated.empty?) or (publisher_product_manifest_product_headline_updated.nil?)) 
                          publisher_product_manifest_product_headline = publisher_product_manifest_product_headline_updated 
                          b_product_headline = true
                          b_required = false      
                      else
                          publisher_product_manifest_product_headline = nil
                          b_product_headline = false
                          b_required = false      
                      end
                    
                      @@was_edited = true
                      set_required
                      
                      respond_to do |format|
                          format.html {}
                          format.json { render :json => { :b_product_headline => b_product_headline, 
                                                          :product_headline => publisher_product_manifest_product_headline,
                                                          :b_required => b_required,
                                                          :b_error => false,
                                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_headline', :description => 'publisher_product_manifest update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_headline', :description => 'publisher_product_manifest was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_headline', :description => 'publisher_product was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_headline', :description => e.message.to_s)

          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
        
  end  



  def update_product_tagline

      begin
      
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
    
          publisher_id = h_obj[:publisher_id]
          publisher_product_id = h_obj[:publisher_product_id]
          product_tagline = h_obj[:product_tagline]
          
          b_error = true
          
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
              if !publisher_product_manifest.nil?
                  h_update = Hash.new
                  h_update[:publisher_id] = publisher_id
                  h_update[:publisher_product_id] = publisher_product_id
                  h_update[:product_tagline] = product_tagline
                  if publisher_product_manifest.update_attributes(h_update)
                      publisher_product_manifest_product_tagline_updated = publisher_product_manifest.product_tagline
                      b_product_tagline = false
                      b_required = false
                      if !((publisher_product_manifest_product_tagline_updated.blank?) or (publisher_product_manifest_product_tagline_updated.empty?) or (publisher_product_manifest_product_tagline_updated.nil?)) 
                          publisher_product_manifest_product_tagline = publisher_product_manifest_product_tagline_updated 
                          b_product_tagline = true
                          b_required = false      
                      else
                          publisher_product_manifest_product_tagline = nil
                          b_product_tagline = false
                          b_required = false      
                      end
                    
                      respond_to do |format|
                          format.html {}
                          format.json { render :json => { :b_product_tagline => b_product_tagline, 
                                                          :product_tagline => publisher_product_manifest_product_tagline,
                                                          :b_required => b_required,
                                                          :b_error => false,
                                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_tagline', :description => 'publisher_product_manifest update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_tagline', :description => 'publisher_product_manifest was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_tagline', :description => 'publisher_product was nil')
              raise
              # Rails.logger.info(@user.errors.messages.inspect)
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_tagline', :description => e.message.to_s)

          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
        
  end  



  def update_product_name

      begin
      
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
    
          publisher_id = h_obj[:publisher_id]
          publisher_product_id = h_obj[:publisher_product_id]
          product_name = h_obj[:product_name]
          
          b_error = true
          
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
              if !publisher_product_manifest.nil?
                  h_update = Hash.new
                  h_update[:publisher_id] = publisher_id
                  h_update[:publisher_product_id] = publisher_product_id
                  h_update[:product_name] = product_name
                  if publisher_product_manifest.update_attributes(h_update)
                      publisher_product_manifest_product_name_updated = publisher_product_manifest.product_name
                      b_product_name = false
                      b_required = false
                      if !((publisher_product_manifest_product_name_updated.blank?) or (publisher_product_manifest_product_name_updated.empty?) or (publisher_product_manifest_product_name_updated.nil?)) 
                          publisher_product_manifest_product_name = publisher_product_manifest_product_name_updated 
                          b_product_name = true
                          b_required = false      
                      else
                          publisher_product_manifest_product_name = nil
                          b_product_name = false
                          b_required = false      
                      end
                    
                      respond_to do |format|
                          format.html {}
                          format.json { render :json => { :b_product_name => b_product_name, 
                                                          :product_name => publisher_product_manifest_product_name,
                                                          :b_required => b_required,
                                                          :b_error => false,
                                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_name', :description => 'publisher_product_manifest update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_name', :description => 'publisher_product_manifest was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_name', :description => 'publisher_product was nil')
              raise
              # Rails.logger.info(@user.errors.messages.inspect)
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_product_name', :description => e.message.to_s)

          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
        
  end  



  def update_versions

      begin
      
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
    
          publisher_id = h_obj[:publisher_id]
          publisher_product_id = h_obj[:publisher_product_id]
          versions = h_obj[:versions]
          
          b_error = true
          
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
              if !publisher_product_manifest.nil?
                  h_update = Hash.new
                  h_update[:publisher_id] = publisher_id
                  h_update[:publisher_product_id] = publisher_product_id
                  h_update[:versions] = versions
                  if publisher_product_manifest.update_attributes(h_update)
                      publisher_product_manifest_versions_updated = publisher_product_manifest.versions
                      b_versions = false
                      b_required = false
                      if !((publisher_product_manifest_versions_updated.blank?) or (publisher_product_manifest_versions_updated.empty?) or (publisher_product_manifest_versions_updated.nil?)) 
                          publisher_product_manifest_versions = publisher_product_manifest_versions_updated 
                          b_versions = true
                          b_required = false      
                      else
                          publisher_product_manifest_versions = nil
                          b_versions = false
                          b_required = false      
                      end
                    
                      respond_to do |format|
                          format.html {}
                          format.json { render :json => { :b_versions => b_versions, 
                                                          :versions => publisher_product_manifest_versions,
                                                          :b_required => b_required,
                                                          :b_error => false,
                                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_versions', :description => 'publisher_product_manifest update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_versions', :description => 'publisher_product_manifest was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_versions', :description => 'publisher_product was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_versions', :description => e.message.to_s)

          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
        
  end  



  def update_corporate_logo_url

      begin
      
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
    
          publisher_id = h_obj[:publisher_id]
          publisher_product_id = h_obj[:publisher_product_id]
          corporate_logo_url = h_obj[:corporate_logo_url]
          
          b_error = true
          
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
              if !publisher_product_manifest.nil?
                  h_update = Hash.new
                  h_update[:publisher_id] = publisher_id
                  h_update[:publisher_product_id] = publisher_product_id
                  h_update[:corporate_logo_url] = corporate_logo_url
                  if publisher_product_manifest.update_attributes(h_update)
                      publisher_product_manifest_corporate_logo_url_updated = publisher_product_manifest.corporate_logo_url
                      b_corporate_logo_url = false
                      b_required = false
                      if !((publisher_product_manifest_corporate_logo_url_updated.blank?) or (publisher_product_manifest_corporate_logo_url_updated.empty?) or (publisher_product_manifest_corporate_logo_url_updated.nil?)) 
                          publisher_product_manifest_corporate_logo_url = publisher_product_manifest_corporate_logo_url_updated 
                          b_corporate_logo_url = true
                          b_required = false      
                      else
                          publisher_product_manifest_corporate_logo_url = nil
                          b_corporate_logo_url = false
                          b_required = false      
                      end
                    
                      respond_to do |format|
                          format.html {}
                          format.json { render :json => { :b_corporate_logo_url => b_corporate_logo_url, 
                                                          :corporate_logo_url => publisher_product_manifest_corporate_logo_url,
                                                          :b_required => b_required,
                                                          :b_error => false,
                                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_corporate_logo_url', :description => 'publisher_product_manifest update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_corporate_logo_url', :description => 'publisher_product_manifest was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_corporate_logo_url', :description => 'publisher_product was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_corporate_logo_url', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
        
  end  



  def update_lesson_time

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          time_per_lesson = h_obj[:time_per_lesson]
          lesson_time_hours = h_obj[:lesson_time_hours]
          lesson_time_minutes = h_obj[:lesson_time_minutes]
          time_per_course = h_obj[:time_per_course]
          course_time_months = h_obj[:course_time_months]
          course_time_days = h_obj[:course_time_days]
          
          b_error = true
          
          publisher_product_manifest = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update = Hash.new
              h_update[:time_per_lesson] = time_per_lesson
              h_update[:lesson_time_hours] = lesson_time_hours
              h_update[:lesson_time_minutes] = lesson_time_minutes
              h_update[:time_per_course] = time_per_course
              h_update[:course_time_months] = course_time_months
              h_update[:course_time_days] = course_time_days
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest = nil
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :time_per_lesson => publisher_product_manifest_updated.time_per_lesson,
                                                        :lesson_time_hours => publisher_product_manifest_updated.lesson_time_hours,
                                                        :lesson_time_minutes => publisher_product_manifest_updated.lesson_time_minutes,
                                                        :time_per_course => publisher_product_manifest_updated.time_per_course,
                                                        :course_time_months => publisher_product_manifest_updated.course_time_months,
                                                        :course_time_days => publisher_product_manifest_updated.course_time_days,
                                                        :b_error => false,                                      
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_time', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_time', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_time', :description => 'publisher_product_manifest was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_time', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
    
  end  



  def update_allow_teacher_rating

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          allow_teacher_rating = h_obj[:allow_teacher_rating]
          b_error = true
      
          # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
          publisher_product_manifest = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
    
              h_update = Hash.new
              h_update[:allow_teacher_rating] = allow_teacher_rating
              h_update[:user_rating_1] = false
              h_update[:user_rating_2] = false
              h_update[:user_rating_3] = false
          
              # if allow_teacher_rating
                # user_rating = h_obj[:user_rating]
                # ar_user_rating = Array.new    
                # ar_user_rating = user_rating.split(',')
                # ar_user_rating.each do |rating|
                  # case rating.to_s  
                    # when "1"
                      # h_update[:user_rating_1] = true
                    # when "2"
                      # h_update[:user_rating_2] = true
                    # when "3"
                      # h_update[:user_rating_3] = true
                    # else
                      # #        
                  # end
                # end
              # end
            
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?              
                      # # h_update = nil
                      # # ar_user_rating = nil
                      # gon.user_rating = []
                      # # h_user_rating[:allow_teacher_rating] = publisher_product_manifest_updated.allow_teacher_rating
                      # gon.user_rating[0] = publisher_product_manifest_updated.user_rating_1
                      # gon.user_rating[1] = publisher_product_manifest_updated.user_rating_2
                      # gon.user_rating[2] = publisher_product_manifest_updated.user_rating_3
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :allow_teacher_rating => publisher_product_manifest_updated.allow_teacher_rating,
                                                        # :user_rating => gon.user_rating,
                                                        :b_error => false,
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_teacher_rating', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_teacher_rating', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_teacher_rating', :description => 'publisher_product_manifest was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_teacher_rating', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
      
    
  end  



  def update_allow_comments

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          allow_comments = h_obj[:allow_comments]
          b_error = true
      
          publisher_product_manifest = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update = Hash.new
              h_update[:allow_comments] = allow_comments
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest = nil
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?              
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :allow_comments => publisher_product_manifest_updated.allow_comments,
                                                        :b_error => false,
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_comments', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_comments', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_comments', :description => 'publisher_product_manifest was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_comments', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_allow_student_likes

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          allow_student_likes = h_obj[:allow_student_likes]
          b_error = true
      
          publisher_product_manifest = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update = Hash.new
              h_update[:allow_student_likes] = allow_student_likes
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest = nil
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?              
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :allow_student_likes => publisher_product_manifest_updated.allow_student_likes,
                                                        :b_error => false,
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_student_likes', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_student_likes', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_student_likes', :description => 'publisher_product_manifest was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_allow_student_likes', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_poster_print_purchase
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          poster_print_purchase = h_obj[:poster_print_purchase]
          b_error = true
      
          publisher_product_manifest = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update = Hash.new
              h_update[:poster_print_purchase] = poster_print_purchase
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :poster_print_purchase => publisher_product_manifest_updated.poster_print_purchase,
                                                        :b_error => false,
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_print_purchase', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_print_purchase', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_print_purchase', :description => 'publisher_product_manifest was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_print_purchase', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end
  
  
  
  def update_poster_pin_web

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          poster_pin_web = h_obj[:poster_pin_web]
          b_error = true
          
          publisher_product_manifest = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update = Hash.new
              h_update[:poster_pin_web] = poster_pin_web
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :poster_pin_web => publisher_product_manifest_updated.poster_pin_web,
                                                        :b_error => false,
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_web', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_web', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_web', :description => 'publisher_product_manifest was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_web', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end
  
  
  
  def update_poster_pin_purchase

      begin
            
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          poster_pin_purchase = h_obj[:poster_pin_purchase]
          b_error = true
      
          publisher_product_manifest = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update = Hash.new
              h_update[:poster_pin_purchase] = poster_pin_purchase
              if publisher_product_manifest.update_attributes(h_update)
                  publisher_product_manifest_updated = current_user.publisher.publisher_products.where("id =?", publisher_product_id).first.publisher_product_manifest rescue nil
                  if !publisher_product_manifest_updated.nil?
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :poster_pin_purchase => publisher_product_manifest_updated.poster_pin_purchase,
                                                        :b_error => false,
                                                        :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_purchase', :description => 'publisher_product_manifest_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_purchase', :description => 'publisher_product_manifest update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_purchase', :description => 'publisher_product_manifest was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_poster_pin_purchase', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  # def update_updating_refresh_rate
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    # updating_refresh_rate = h_obj[:updating_refresh_rate]
#     
    # h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:updating_refresh_rate] = updating_refresh_rate
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # gon.updating_refresh_rate = []
    # ar_updating_refresh_rate = Array.new
# 
    # ar_updating_refresh_rate = publisher_product_manifest_updated.updating_refresh_rate.split(',')
    # gon.updating_refresh_rate = ar_updating_refresh_rate
#     
    # b_has_updating_refresh_rate = false
    # len = ar_updating_refresh_rate.length
    # if (len > 0)
      # b_has_updating_refresh_rate = true
    # end
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :b_has_updating_refresh_rate => b_has_updating_refresh_rate,
                                      # :g_updated => gon.updating_refresh_rate,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }
# 
      # # format.json { render :json => {} }
# 
    # end
#     
  # end  



  # def update_updating_type
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    # updating_type = h_obj[:updating_type]
#     
    # h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:updating_type] = updating_type
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # gon.updating_type = []
    # ar_updating_type = Array.new
# 
    # ar_updating_type = publisher_product_manifest_updated.updating_type.split(',')
    # gon.updating_type = ar_updating_type
#     
    # b_has_updating_type = false
    # len = ar_updating_type.length
    # if (len > 0)
      # b_has_updating_type = true
    # end
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :b_has_updating_type => b_has_updating_type,
                                      # :g_updated => gon.updating_type,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }
# 
      # # format.json { render :json => {} }
# 
    # end
#     
  # end  



  # def update_reselling
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # # publisher_id = h_obj[:publisher_id]
    # # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    # reselling = h_obj[:reselling]
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # h_update = Hash.new
    # # h_update[:publisher_id] = publisher_id
    # # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:reselling] = reselling
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # # publisher_product_manifest_id = publisher_product_manifest.id
    # # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :reselling => publisher_product_manifest_updated.reselling,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
    # end
#     
  # end  



  # def update_evaluation
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # # publisher_id = h_obj[:publisher_id]
    # # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    # evaluation = h_obj[:evaluation]
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # h_update = Hash.new
    # # h_update[:publisher_id] = publisher_id
    # # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:evaluation] = evaluation
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # # publisher_product_manifest_id = publisher_product_manifest.id
    # # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :evaluation => publisher_product_manifest_updated.evaluation,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
    # end
#     
  # end  



  # def update_research
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    # # allow_teacher_rating = h_obj[:allow_teacher_rating]
# 
    # h_update = Hash.new
    # h_update[:research_1] = false
    # h_update[:research_2] = false   
    # research = h_obj[:research]
    # ar_research = Array.new    
    # ar_research = research.split(',')
    # ar_research.each do |rsrch|
      # case rsrch.to_s  
        # when "1"
          # h_update[:research_1] = true
        # when "2"
          # h_update[:research_2] = true
        # else
          # #        
      # end
    # end
# 
#     
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # h_update = nil
    # ar_research = nil
# 
    # gon.research = []
    # gon.research[0] = publisher_product_manifest_updated.research_1
    # gon.research[1] = publisher_product_manifest_updated.research_2
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :research => gon.research,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
    # end
#     
  # end  



  # def update_public_relations
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # # publisher_id = h_obj[:publisher_id]
    # # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
#     
    # h_update = Hash.new
    # # h_update[:publisher_id] = publisher_id
    # # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:pr_updates_1] = h_obj[:pr_updates_1]
    # h_update[:pr_updates_2] = h_obj[:pr_updates_2]
    # h_update[:pr_updates_3] = h_obj[:pr_updates_3]
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # # publisher_product_manifest_id = publisher_product_manifest.id
    # # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # gon.public_relations = []
    # gon.public_relations[0] = publisher_product_manifest_updated.pr_updates_1
    # gon.public_relations[1] = publisher_product_manifest_updated.pr_updates_2
    # gon.public_relations[2] = publisher_product_manifest_updated.pr_updates_3
#     
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :public_relations => gon.public_relations,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
    # end
#     
  # end  



  # def update_metrics
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # # publisher_id = h_obj[:publisher_id]
    # # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
#     
    # h_update = Hash.new
    # # h_update[:publisher_id] = publisher_id
    # # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:metrics_1] = h_obj[:metrics_1]
    # h_update[:metrics_2] = h_obj[:metrics_2]
    # h_update[:metrics_3] = h_obj[:metrics_3]
    # h_update[:metrics_4] = h_obj[:metrics_4]
    # h_update[:metrics_5] = h_obj[:metrics_5]
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # # publisher_product_manifest_id = publisher_product_manifest.id
    # # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # gon.metrics = []
    # gon.metrics[0] = publisher_product_manifest_updated.metrics_1
    # gon.metrics[1] = publisher_product_manifest_updated.metrics_2
    # gon.metrics[2] = publisher_product_manifest_updated.metrics_3
    # gon.metrics[3] = publisher_product_manifest_updated.metrics_4
    # gon.metrics[4] = publisher_product_manifest_updated.metrics_5
#     
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :metrics => gon.metrics,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }      
    # end
#     
  # end  
          
          

  # def update_source_url
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    # source_url = h_obj[:source_url]
# 
    # publisher_product_manifest = PublisherProductManifest.find(publisher_product_manifest_id)
# 
    # # @info1 = Rails.logger.info "clyde in update_name_first"
    # # @info2 = Rails.logger.info h_obj
# 
    # h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:source_url] = source_url
# 
    # if publisher_product_manifest.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_manifest = nil
    # publisher_product_manifest_updated = PublisherProductManifest.find(publisher_product_manifest_id)
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :source_url => publisher_product_manifest_updated.source_url,
                                      # :updated => publisher_product_manifest_updated.updated_at.to_s(:long) } }
#       
      # # format.json { render :partial => "publisher_profiles/test" }
      # # format.json { render :json => { :url => '/PublisherProfiles' } }
      # # format.json { render :json => @journal1poster_position }
    # end
#     
  # end  



  def update_pricing_model

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          pricing_model = h_obj[:pricing_model]
          
          publisher_product_pricing_model = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_pricing_model rescue nil
          if !publisher_product_pricing_model.nil?
    
              h_update = Hash.new
              h_update[:pricing_model_1] = false
              h_update[:pricing_model_2] = false
              h_update[:pricing_model_3] = false
    
              ar_pricing_model = Array.new
              ar_pricing_model = pricing_model.split(',')
              
              ar_pricing_model.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:pricing_model_1] = true
                  when "2"
                    h_update[:pricing_model_2] = true
                  when "3"
                    h_update[:pricing_model_3] = true
                  else
                    #        
                end
              end
          
              if publisher_product_pricing_model.update_attributes(h_update)
                  publisher_product_pricing_model = nil
                  publisher_product_pricing_model_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_pricing_model rescue nil              
                  if !publisher_product_pricing_model_updated.nil?
                    
                      a_pricing_models = Array.new
                      pricing_models = return_all_dtab10lets
                      pricing_models.each do |p_model|
                        a_pricing_models.push(p_model)
                      end
                      gon.pricing_model = []
                      gon.pricing_model_text = []    
                      b_required = true
                      if (publisher_product_pricing_model_updated.pricing_model_1 or
                          publisher_product_pricing_model_updated.pricing_model_2 or
                          publisher_product_pricing_model_updated.pricing_model_3)
                  
                          # b_has_enhancement = true
                          b_required = false
                              
                          b = publisher_product_pricing_model_updated.pricing_model_1
                          gon.pricing_model[0] = b
                          if b
                            gon.pricing_model_text.push(a_pricing_models[0].col_1)                            
                          end        
                  
                          b = publisher_product_pricing_model_updated.pricing_model_2
                          gon.pricing_model[1] = b
                          if b
                            gon.pricing_model_text.push(a_pricing_models[1].col_1)                            
                          end        
                  
                          b = publisher_product_pricing_model_updated.pricing_model_3
                          gon.pricing_model[2] = b
                          if b
                            gon.pricing_model_text.push(a_pricing_models[2].col_1)                            
                          end        
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :pricing_model => gon.pricing_model,
                                                        :pricing_model_text => gon.pricing_model_text,
                                                        :b_required_pricing_model => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_pricing_model_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_pricing_model', :description => 'publisher_product_pricing_model_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_pricing_model', :description => 'publisher_product_pricing_model update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_pricing_model', :description => 'publisher_product_pricing_model was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_pricing_model', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_price

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          
          publisher_product_price = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_price rescue nil
          if !publisher_product_price.nil?
            
              price_1 = h_obj[:price_1]
              price_1_dec = h_obj[:price_1_dec]
              price_2 = h_obj[:price_2]
              price_2_dec = h_obj[:price_2_dec]
              price_3 = h_obj[:price_3]
              price_3_dec = h_obj[:price_3_dec]
              price_4 = h_obj[:price_4]
              price_4_dec = h_obj[:price_4_dec]
              price_5 = h_obj[:price_5]
              price_5_dec = h_obj[:price_5_dec]
              price_6 = h_obj[:price_6]
              price_6_dec = h_obj[:price_6_dec]
              price_7 = h_obj[:price_7]
              price_7_dec = h_obj[:price_7_dec]
              price_8 = h_obj[:price_8]
              price_8_dec = h_obj[:price_8_dec]
              price_9 = h_obj[:price_9]
              price_9_dec = h_obj[:price_9_dec]
              price_10 = h_obj[:price_10]
              price_10_dec = h_obj[:price_10_dec]
              price_11 = h_obj[:price_11]
          
              if !price_1
                price_1_dec = 0.00
              end
              if !price_2
                price_2_dec = 0.00
              end
              if !price_3
                price_3_dec = 0.00
              end
              if !price_4
                price_4_dec = 0.00
              end
              if !price_5
                price_5_dec = 0.00
              end
              if !price_6
                price_6_dec = 0.00
              end
              if !price_7
                price_7_dec = 0.00
              end
              if !price_8
                price_8_dec = 0.00
              end
              if !price_9
                price_9_dec = 0.00
              end
              if !price_10
                price_10_dec = 0.00
              end
          
              h_update = Hash.new
              h_update[:price_1] = price_1
              h_update[:price_1_dec] = price_1_dec
              h_update[:price_2] = price_2
              h_update[:price_2_dec] = price_2_dec
              h_update[:price_3] = price_3
              h_update[:price_3_dec] = price_3_dec
              h_update[:price_4] = price_4
              h_update[:price_4_dec] = price_4_dec
              h_update[:price_5] = price_5
              h_update[:price_5_dec] = price_5_dec
              h_update[:price_6] = price_6
              h_update[:price_6_dec] = price_6_dec
              h_update[:price_7] = price_7
              h_update[:price_7_dec] = price_7_dec
              h_update[:price_8] = price_8
              h_update[:price_8_dec] = price_8_dec
              h_update[:price_9] = price_9
              h_update[:price_9_dec] = price_9_dec
              h_update[:price_10] = price_10
              h_update[:price_10_dec] = price_10_dec
              h_update[:price_11] = price_11
            
              if publisher_product_price.update_attributes(h_update)
                  publisher_product_price = nil
                  publisher_product_price_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_price rescue nil
                  if !publisher_product_price_updated.nil?
                    
                      a_price = Array.new(12).map!{Array.new(2)}    
                      gon.price = nil        
                      # b_has_price = false
                      b_required = true
                      if (publisher_product_price_updated.price_1 or
                          publisher_product_price_updated.price_2 or
                          publisher_product_price_updated.price_3 or
                          publisher_product_price_updated.price_4 or
                          publisher_product_price_updated.price_5 or
                          publisher_product_price_updated.price_6 or
                          publisher_product_price_updated.price_7 or
                          publisher_product_price_updated.price_8 or
                          publisher_product_price_updated.price_9 or
                          publisher_product_price_updated.price_10 or
                          publisher_product_price_updated.price_11 or
                          publisher_product_price_updated.price_12)
                  
                          # b_has_price = true
                          b_required = false
                      end
                          
                      a_price[1][0] = publisher_product_price_updated.price_1
                      a_price[1][1] = publisher_product_price_updated.price_1_dec
                      a_price[2][0] = publisher_product_price_updated.price_2
                      a_price[2][1] = publisher_product_price_updated.price_2_dec
                      a_price[3][0] = publisher_product_price_updated.price_3
                      a_price[3][1] = publisher_product_price_updated.price_3_dec
                      a_price[4][0] = publisher_product_price_updated.price_4
                      a_price[4][1] = publisher_product_price_updated.price_4_dec
                      a_price[5][0] = publisher_product_price_updated.price_5
                      a_price[5][1] = publisher_product_price_updated.price_5_dec
                      a_price[6][0] = publisher_product_price_updated.price_6
                      a_price[6][1] = publisher_product_price_updated.price_6_dec
                      a_price[7][0] = publisher_product_price_updated.price_7
                      a_price[7][1] = publisher_product_price_updated.price_7_dec
                      a_price[8][0] = publisher_product_price_updated.price_8
                      a_price[8][1] = publisher_product_price_updated.price_8_dec
                      a_price[9][0] = publisher_product_price_updated.price_9
                      a_price[9][1] = publisher_product_price_updated.price_9_dec
                      a_price[10][0] = publisher_product_price_updated.price_10
                      a_price[10][1] = publisher_product_price_updated.price_10_dec
                
                      a_price[11][0] = publisher_product_price_updated.price_11
                
                      gon.price = a_price
                          
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :g_price => gon.price,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_price_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_price', :description => 'publisher_product_price_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_price', :description => 'publisher_product_price update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_price', :description => 'publisher_product_price was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_price', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_content_type

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          content_type = h_obj[:content_type]
          content_type_other = h_obj[:content_type_other]
          content_type_other_b = h_obj[:content_type_other_b]
          publisher_product_id = h_obj[:publisher_product_id]
          publisher_product_content_type = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_content_type rescue nil
          if !publisher_product_content_type.nil?
            
              ar_content_type = Array.new
              ar_content_type = content_type.split(',')
          
              # ("Apps")
              # ("Assessment/Testing")
              # ("Digital Content")
              # ("Curriculum (Websites)")
              # ("eBook")
              # ("Learning Games")
              # ("Service")
              # ("School Management Software")
              # ("Technical Skills Software")
              # ("Software Tools (Collaboration, Creation, etc.)")
              # ("Video")
          
              h_update = Hash.new
              h_update[:content_type_1] = false
              h_update[:content_type_2] = false
              h_update[:content_type_3] = false
              h_update[:content_type_4] = false
              h_update[:content_type_5] = false
              h_update[:content_type_6] = false
              h_update[:content_type_7] = false
              h_update[:content_type_8] = false
              h_update[:content_type_9] = false
              h_update[:content_type_10] = false
              h_update[:content_type_11] = false
              h_update[:content_type_other_b] = content_type_other_b
              h_update[:content_type_other] = content_type_other
              
              ar_content_type.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:content_type_1] = true
                  when "2"
                    h_update[:content_type_2] = true
                  when "3"
                    h_update[:content_type_3] = true
                  when "4"
                    h_update[:content_type_4] = true
                  when "5"
                    h_update[:content_type_5] = true
                  when "6"
                    h_update[:content_type_6] = true
                  when "7"
                    h_update[:content_type_7] = true
                  when "8"
                    h_update[:content_type_8] = true
                  when "9"
                    h_update[:content_type_9] = true
                  when "10"
                    h_update[:content_type_10] = true
                  when "11"
                    h_update[:content_type_11] = true
                  else
                    #        
                end
              end
            
              if publisher_product_content_type.update_attributes(h_update)
                  publisher_product_content_type = nil
                  publisher_product_content_type_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_content_type rescue nil
                  if !publisher_product_content_type_updated.nil?
                    
                      gon.content_type = []
                      gon.content_type_text = []
                          
                      b_has_content_type = false
                      a_content_types = Array.new
                      @content_types = return_all_dtab2lets
                      @content_types.each do |ct|
                        a_content_types.push(ct)
                      end
                      b_required = true
                                          
                      b_content_type_other = false
                      content_type_other = ""            
                      if publisher_product_content_type_updated.content_type_other_b
                          b_content_type_other = true
                          content_type_other = publisher_product_content_type_updated.content_type_other
                      end
                  
                      if (publisher_product_content_type_updated.content_type_1 or
                          publisher_product_content_type_updated.content_type_2 or
                          publisher_product_content_type_updated.content_type_3 or
                          publisher_product_content_type_updated.content_type_4 or
                          publisher_product_content_type_updated.content_type_5 or
                          publisher_product_content_type_updated.content_type_6 or
                          publisher_product_content_type_updated.content_type_7 or
                          publisher_product_content_type_updated.content_type_8 or
                          publisher_product_content_type_updated.content_type_9 or
                          publisher_product_content_type_updated.content_type_10 or
                          publisher_product_content_type_updated.content_type_11 or
                          b_content_type_other)
                  
                          b_has_content_type = true
                          b_required = false                    
                          
                          b = publisher_product_content_type_updated.content_type_1
                          gon.content_type[0] = b
                          if b
                            gon.content_type_text.push(a_content_types[0].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_2
                          gon.content_type[1] = b
                          if b
                            gon.content_type_text.push(a_content_types[1].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_3
                          gon.content_type[2] = b
                          if b
                            gon.content_type_text.push(a_content_types[2].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_4
                          gon.content_type[3] = b
                          if b
                            gon.content_type_text.push(a_content_types[3].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_5
                          gon.content_type[4] = b
                          if b
                            gon.content_type_text.push(a_content_types[4].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_6
                          gon.content_type[5] = b
                          if b
                            gon.content_type_text.push(a_content_types[5].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_7
                          gon.content_type[6] = b
                          if b
                            gon.content_type_text.push(a_content_types[6].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_8
                          gon.content_type[7] = b
                          if b
                            gon.content_type_text.push(a_content_types[7].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_9
                          gon.content_type[8] = b
                          if b
                            gon.content_type_text.push(a_content_types[8].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_10
                          gon.content_type[9] = b
                          if b
                            gon.content_type_text.push(a_content_types[9].col_1)              
                          end        
                  
                          b = publisher_product_content_type_updated.content_type_11
                          gon.content_type[10] = b
                          if b
                            gon.content_type_text.push(a_content_types[10].col_1)              
                          end        
                          
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :b_has_content_type => b_has_content_type,
                                                        :content_type => gon.content_type,
                                                        :content_type_other => content_type_other,
                                                        :has_content_type_other => b_content_type_other,
                                                        :content_type_text => gon.content_type_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_content_type_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_content_type', :description => 'publisher_product_content_type_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_content_type', :description => 'publisher_product_content_type update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_content_type', :description => 'publisher_product_content_type was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_content_type', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_category_subject

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          category_subject = h_obj[:category_subject]
          category_subject_other = h_obj[:category_subject_other]
          category_subject_other_b = h_obj[:category_subject_other_b]
          publisher_product_id = h_obj[:publisher_product_id]  
          publisher_product_category_subject = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_category_subject rescue nil
          if !publisher_product_category_subject.nil?
            
              ar_category_subject = Array.new
              ar_category_subject = category_subject.split(',')
          
              h_update = Hash.new
              h_update[:category_subject_1] = false
              h_update[:category_subject_2] = false
              h_update[:category_subject_3] = false
              h_update[:category_subject_4] = false
              h_update[:category_subject_5] = false
              h_update[:category_subject_6] = false
              h_update[:category_subject_7] = false
              h_update[:category_subject_8] = false
              h_update[:category_subject_9] = false
              h_update[:category_subject_10] = false
              h_update[:category_subject_11] = false
              h_update[:category_subject_12] = false
              h_update[:category_subject_13] = false
              h_update[:category_subject_14] = false
              h_update[:category_subject_15] = false
              h_update[:category_subject_16] = false
              h_update[:category_subject_17] = false
              h_update[:category_subject_18] = false
              h_update[:category_subject_19] = false
              h_update[:category_subject_20] = false
              h_update[:category_subject_21] = false
              h_update[:category_subject_22] = false
              h_update[:category_subject_23] = false
              h_update[:category_subject_24] = false
              h_update[:category_subject_25] = false
              h_update[:category_subject_26] = false
              h_update[:category_subject_27] = false
              h_update[:category_subject_28] = false
              h_update[:category_subject_29] = false
              h_update[:category_subject_30] = false
              h_update[:category_subject_31] = false
              h_update[:category_subject_32] = false
              h_update[:category_subject_33] = false
              h_update[:category_subject_34] = false
              h_update[:category_subject_35] = false
              h_update[:category_subject_36] = false
              h_update[:category_subject_37] = false
              h_update[:category_subject_38] = false
              h_update[:category_subject_39] = false
              h_update[:category_subject_other_b] = category_subject_other_b
              h_update[:category_subject_other] = category_subject_other
              
              ar_category_subject.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:category_subject_1] = true
                  when "2"
                    h_update[:category_subject_2] = true
                  when "3"
                    h_update[:category_subject_3] = true
                  when "4"
                    h_update[:category_subject_4] = true
                  when "5"
                    h_update[:category_subject_5] = true
                  when "6"
                    h_update[:category_subject_6] = true
                  when "7"
                    h_update[:category_subject_7] = true
                  when "8"
                    h_update[:category_subject_8] = true
                  when "9"
                    h_update[:category_subject_9] = true
                  when "10"
                    h_update[:category_subject_10] = true
                  when "11"
                    h_update[:category_subject_11] = true
                  when "12"
                    h_update[:category_subject_12] = true
                  when "13"
                    h_update[:category_subject_13] = true
                  when "14"
                    h_update[:category_subject_14] = true
                  when "15"
                    h_update[:category_subject_15] = true
                  when "16"
                    h_update[:category_subject_16] = true
                  when "17"
                    h_update[:category_subject_17] = true
                  when "18"
                    h_update[:category_subject_18] = true
                  when "19"
                    h_update[:category_subject_19] = true
                  when "20"
                    h_update[:category_subject_20] = true
                  when "21"
                    h_update[:category_subject_21] = true
                  when "22"
                    h_update[:category_subject_22] = true
                  when "23"
                    h_update[:category_subject_23] = true
                  when "24"
                    h_update[:category_subject_24] = true
                  when "25"
                    h_update[:category_subject_25] = true
                  when "26"
                    h_update[:category_subject_26] = true
                  when "27"
                    h_update[:category_subject_27] = true
                  when "28"
                    h_update[:category_subject_28] = true
                  when "29"
                    h_update[:category_subject_29] = true
                  when "30"
                    h_update[:category_subject_30] = true
                  when "31"
                    h_update[:category_subject_31] = true
                  when "32"
                    h_update[:category_subject_32] = true
                  when "33"
                    h_update[:category_subject_33] = true
                  when "34"
                    h_update[:category_subject_34] = true
                  when "35"
                    h_update[:category_subject_35] = true
                  when "36"
                    h_update[:category_subject_36] = true
                  when "37"
                    h_update[:category_subject_37] = true
                  when "38"
                    h_update[:category_subject_38] = true
                  when "39"
                    h_update[:category_subject_39] = true
          
                  else
                    #        
                end
              end
            
              if publisher_product_category_subject.update_attributes(h_update)
                  publisher_product_category_subject = nil
                  publisher_product_category_subject_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_category_subject rescue nil
                  if !publisher_product_category_subject_updated.nil?
                  
                      gon.category_subject = []
                      
                      b_has_category_subject = false
                      a_category_subjects = Array.new
                      category_subjects = return_all_dtab4lets
                      category_subjects.each do |category_subj|
                        a_category_subjects.push(category_subj)
                      end
                      gon.category_subject_text = []
                      b_required = true
                      
                      b_category_subject_other = false
                      category_subject_other = ""            
                      if publisher_product_category_subject_updated.category_subject_other_b
                          b_category_subject_other = true
                          category_subject_other = publisher_product_category_subject_updated.category_subject_other
                      end
                      
                      if (publisher_product_category_subject_updated.category_subject_1 or
                          publisher_product_category_subject_updated.category_subject_2 or
                          publisher_product_category_subject_updated.category_subject_3 or
                          publisher_product_category_subject_updated.category_subject_4 or
                          publisher_product_category_subject_updated.category_subject_5 or
                          publisher_product_category_subject_updated.category_subject_6 or
                          publisher_product_category_subject_updated.category_subject_7 or
                          publisher_product_category_subject_updated.category_subject_8 or
                          publisher_product_category_subject_updated.category_subject_9 or
                          publisher_product_category_subject_updated.category_subject_10 or
                          publisher_product_category_subject_updated.category_subject_11 or
                          publisher_product_category_subject_updated.category_subject_12 or
                          publisher_product_category_subject_updated.category_subject_13 or
                          publisher_product_category_subject_updated.category_subject_14 or
                          publisher_product_category_subject_updated.category_subject_15 or
                          publisher_product_category_subject_updated.category_subject_16 or
                          publisher_product_category_subject_updated.category_subject_17 or
                          publisher_product_category_subject_updated.category_subject_18 or
                          publisher_product_category_subject_updated.category_subject_19 or
                          publisher_product_category_subject_updated.category_subject_20 or
                          publisher_product_category_subject_updated.category_subject_21 or
                          publisher_product_category_subject_updated.category_subject_22 or
                          publisher_product_category_subject_updated.category_subject_23 or
                          publisher_product_category_subject_updated.category_subject_24 or
                          publisher_product_category_subject_updated.category_subject_25 or
                          publisher_product_category_subject_updated.category_subject_26 or
                          publisher_product_category_subject_updated.category_subject_27 or
                          publisher_product_category_subject_updated.category_subject_28 or
                          publisher_product_category_subject_updated.category_subject_29 or
                          publisher_product_category_subject_updated.category_subject_30 or
                          publisher_product_category_subject_updated.category_subject_31 or
                          publisher_product_category_subject_updated.category_subject_32 or
                          publisher_product_category_subject_updated.category_subject_33 or
                          publisher_product_category_subject_updated.category_subject_34 or
                          publisher_product_category_subject_updated.category_subject_35 or
                          publisher_product_category_subject_updated.category_subject_36 or
                          publisher_product_category_subject_updated.category_subject_37 or
                          publisher_product_category_subject_updated.category_subject_38 or
                          publisher_product_category_subject_updated.category_subject_39)
                  
                          b_has_category_subject = true
                          b_required = false
                          
                          b = publisher_product_category_subject_updated.category_subject_1
                          gon.category_subject[0] = b
                          if b
                            # gon.category_subject_text[0] = a_category_subjects[0].col_1  
                            gon.category_subject_text.push(a_category_subjects[0].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_2
                          gon.category_subject[1] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[1].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_3
                          gon.category_subject[2] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[2].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_4
                          gon.category_subject[3] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[3].col_1)              
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_5
                          gon.category_subject[4] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[4].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_6
                          gon.category_subject[5] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[5].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_7
                          gon.category_subject[6] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[6].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_8
                          gon.category_subject[7] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[7].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_9
                          gon.category_subject[8] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[8].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_10
                          gon.category_subject[9] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[9].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_11
                          gon.category_subject[10] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[10].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_12
                          gon.category_subject[11] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[11].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_13
                          gon.category_subject[12] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[12].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_14
                          gon.category_subject[13] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[13].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_15
                          gon.category_subject[14] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[14].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_16
                          gon.category_subject[15] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[15].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_17
                          gon.category_subject[16] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[16].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_18
                          gon.category_subject[17] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[17].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_19
                          gon.category_subject[18] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[18].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_20
                          gon.category_subject[19] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[19].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_21
                          gon.category_subject[20] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[20].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_22
                          gon.category_subject[21] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[21].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_23
                          gon.category_subject[22] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[22].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_24
                          gon.category_subject[23] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[23].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_25
                          gon.category_subject[24] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[24].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_26
                          gon.category_subject[25] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[25].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_27
                          gon.category_subject[26] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[26].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_28
                          gon.category_subject[27] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[27].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_29
                          gon.category_subject[28] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[28].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_30
                          gon.category_subject[29] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[29].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_31
                          gon.category_subject[30] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[30].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_32
                          gon.category_subject[31] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[31].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_33
                          gon.category_subject[32] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[32].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_34
                          gon.category_subject[33] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[33].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_35
                          gon.category_subject[34] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[34].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_36
                          gon.category_subject[35] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[35].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_37
                          gon.category_subject[36] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[36].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_38
                          gon.category_subject[37] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[37].col_1)  
                          end        
                  
                          b = publisher_product_category_subject_updated.category_subject_39
                          gon.category_subject[38] = b
                          if b
                            gon.category_subject_text.push(a_category_subjects[38].col_1)  
                          end        
                          
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :b_has_category_subject => b_has_category_subject,
                                                        :category_subject => gon.category_subject,
                                                        :category_subject_other => category_subject_other,
                                                        :has_category_subject_other => b_category_subject_other,
                                                        :category_subject_text => gon.category_subject_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_category_subject_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_category_subject', :description => 'publisher_product_category_subject_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_category_subject', :description => 'publisher_product_category_subject update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_category_subject', :description => 'publisher_product_category_subject was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_category_subject', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  # def update_age_range
#     
      # begin
#         
          # ar = params[:publisher_product_manifest]
          # h_obj = Hash.new
          # ar.each do |obj|
            # h_obj = obj
          # end
#       
          # publisher_product_id = h_obj[:publisher_product_id]
#           
          # from_age = h_obj[:from_age]
          # ar_from_ages = Array.new
          # ar_from_ages = from_age.split(',')
#       
          # to_age = h_obj[:to_age]
          # ar_to_ages = Array.new
          # ar_to_ages = to_age.split(',')
#     
          # # catch exceptional
          # b_required_from_age = false
          # b_required_to_age = false   
          # z = ar_from_ages.length - 1 # length for single dropdown will always be 1, and z will be 0 for the first array element
          # for i in 0..z
            # if ((ar_from_ages[i].to_s == '0') and (ar_to_ages[i].to_s == '0'))
                # b_required_from_age = true
                # b_required_to_age = true      
            # elsif ((ar_from_ages[i].to_s == '19') or (ar_to_ages[i].to_s == '19'))
                # ar_from_ages[i] = '19'
                # ar_to_ages[i] = '0'
            # elsif ((ar_from_ages[i].to_s == '20') or (ar_to_ages[i].to_s == '20'))
                # ar_from_ages[i] = '20'
                # ar_to_ages[i] = '0'
            # elsif (ar_from_ages[i].to_s == ar_to_ages[i].to_s)
                # ar_to_ages[i] = 0
            # elsif ((ar_from_ages[i].to_s != '19') and (ar_from_ages[i].to_s != '20'))
                # v1 = ar_from_ages[i].to_i
                # v2 = ar_to_ages[i].to_i
                # if (v1 > v2)
                  # ar_from_ages[i] = v2.to_s
                  # ar_to_ages[i] = v1.to_s
                # elsif ((ar_from_ages[i].to_s == '0') and (ar_to_ages[i].to_s != '0'))
                  # ar_from_ages[i] = v2.to_s
                  # ar_to_ages[i] = v1.to_s              
                # end
            # end
          # end
#       
          # h_from_age = Hash.new
          # h_from_age[:age_1] = false
          # h_from_age[:age_2] = false
          # h_from_age[:age_3] = false
          # h_from_age[:age_4] = false
          # h_from_age[:age_5] = false
          # h_from_age[:age_6] = false
          # h_from_age[:age_7] = false
          # h_from_age[:age_8] = false
          # h_from_age[:age_9] = false
          # h_from_age[:age_10] = false
          # h_from_age[:age_11] = false
          # h_from_age[:age_12] = false
          # h_from_age[:age_13] = false
          # h_from_age[:age_14] = false
          # h_from_age[:age_15] = false
          # h_from_age[:age_16] = false
          # h_from_age[:age_17] = false
          # h_from_age[:age_18] = false
          # h_from_age[:age_19] = false
          # h_from_age[:age_20] = false
#       
          # ar_from_ages.each do |age|
            # case age.to_s  
              # when "1"
                # h_from_age[:age_1] = true
              # when "2"
                # h_from_age[:age_2] = true
              # when "3"
                # h_from_age[:age_3] = true
              # when "4"
                # h_from_age[:age_4] = true
              # when "5"
                # h_from_age[:age_5] = true
              # when "6"
                # h_from_age[:age_6] = true
              # when "7"
                # h_from_age[:age_7] = true
              # when "8"
                # h_from_age[:age_8] = true
              # when "9"
                # h_from_age[:age_9] = true
              # when "10"
                # h_from_age[:age_10] = true
              # when "11"
                # h_from_age[:age_11] = true
              # when "12"
                # h_from_age[:age_12] = true
              # when "13"
                # h_from_age[:age_13] = true
              # when "14"
                # h_from_age[:age_14] = true
              # when "15"
                # h_from_age[:age_15] = true
              # when "16"
                # h_from_age[:age_16] = true
              # when "17"
                # h_from_age[:age_17] = true
              # when "18"
                # h_from_age[:age_18] = true
              # when "19"
                # h_from_age[:age_19] = true
              # when "20"
                # h_from_age[:age_20] = true
              # else
                # #        
            # end
          # end
#     
          # h_to_age = Hash.new
          # h_to_age[:age_1] = false
          # h_to_age[:age_2] = false
          # h_to_age[:age_3] = false
          # h_to_age[:age_4] = false
          # h_to_age[:age_5] = false
          # h_to_age[:age_6] = false
          # h_to_age[:age_7] = false
          # h_to_age[:age_8] = false
          # h_to_age[:age_9] = false
          # h_to_age[:age_10] = false
          # h_to_age[:age_11] = false
          # h_to_age[:age_12] = false
          # h_to_age[:age_13] = false
          # h_to_age[:age_14] = false
          # h_to_age[:age_15] = false
          # h_to_age[:age_16] = false
          # h_to_age[:age_17] = false
          # h_to_age[:age_18] = false
          # h_to_age[:age_19] = false
          # h_to_age[:age_20] = false
#       
          # ar_to_ages.each do |age|
            # case age.to_s  
              # when "1"
                # h_to_age[:age_1] = true
              # when "2"
                # h_to_age[:age_2] = true
              # when "3"
                # h_to_age[:age_3] = true
              # when "4"
                # h_to_age[:age_4] = true
              # when "5"
                # h_to_age[:age_5] = true
              # when "6"
                # h_to_age[:age_6] = true
              # when "7"
                # h_to_age[:age_7] = true
              # when "8"
                # h_to_age[:age_8] = true
              # when "9"
                # h_to_age[:age_9] = true
              # when "10"
                # h_to_age[:age_10] = true
              # when "11"
                # h_to_age[:age_11] = true
              # when "12"
                # h_to_age[:age_12] = true
              # when "13"
                # h_to_age[:age_13] = true
              # when "14"
                # h_to_age[:age_14] = true
              # when "15"
                # h_to_age[:age_15] = true
              # when "16"
                # h_to_age[:age_16] = true
              # when "17"
                # h_to_age[:age_17] = true
              # when "18"
                # h_to_age[:age_18] = true
              # when "19"
                # h_to_age[:age_19] = true
              # when "20"
                # h_to_age[:age_20] = true
              # else
                # #        
            # end
          # end
#     
          # h_from_age[:required] = b_required_from_age
          # gon.from_age = []
          # gon.from_age_text = []    
#           
          # h_to_age[:required] = b_required_to_age
          # gon.to_age = []
          # gon.to_age_text = []    
#       
          # b_updated_from_age = false
          # b_updated_to_age = false
#       
          # publisher_product_from_age = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_from_age rescue nil
          # if !publisher_product_from_age.nil?
              # if publisher_product_from_age.update_attributes(h_from_age)
                  # publisher_product_from_age = nil
                  # publisher_product_from_age_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_from_age rescue nil
                  # if !publisher_product_from_age_updated.nil?
#                     
                      # a_from_ages = Array.new
                      # from_ages = return_all_dtab8lets
                      # from_ages.each do |age|
                        # a_from_ages.push(age)
                      # end
#                       
                      # if (publisher_product_from_age_updated.age_1 or
                          # publisher_product_from_age_updated.age_2 or
                          # publisher_product_from_age_updated.age_3 or
                          # publisher_product_from_age_updated.age_4 or
                          # publisher_product_from_age_updated.age_5 or
                          # publisher_product_from_age_updated.age_6 or
                          # publisher_product_from_age_updated.age_7 or
                          # publisher_product_from_age_updated.age_8 or
                          # publisher_product_from_age_updated.age_9 or
                          # publisher_product_from_age_updated.age_10 or
                          # publisher_product_from_age_updated.age_11 or
                          # publisher_product_from_age_updated.age_12 or
                          # publisher_product_from_age_updated.age_13 or
                          # publisher_product_from_age_updated.age_14 or
                          # publisher_product_from_age_updated.age_15 or
                          # publisher_product_from_age_updated.age_16 or
                          # publisher_product_from_age_updated.age_17 or
                          # publisher_product_from_age_updated.age_18 or
                          # publisher_product_from_age_updated.age_19 or
                          # publisher_product_from_age_updated.age_20)
#                   
                          # # b_required_from_age = false
#                               
                          # b = publisher_product_from_age_updated.age_1
                          # gon.from_age[0] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[0].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_2
                          # gon.from_age[1] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[1].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_3
                          # gon.from_age[2] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[2].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_4
                          # gon.from_age[3] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[3].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_5
                          # gon.from_age[4] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[4].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_6
                          # gon.from_age[5] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[5].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_7
                          # gon.from_age[6] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[6].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_8
                          # gon.from_age[7] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[7].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_9
                          # gon.from_age[8] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[8].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_10
                          # gon.from_age[9] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[9].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_11
                          # gon.from_age[10] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[10].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_12
                          # gon.from_age[11] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[11].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_13
                          # gon.from_age[12] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[12].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_14
                          # gon.from_age[13] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[13].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_15
                          # gon.from_age[14] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[14].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_16
                          # gon.from_age[15] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[15].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_17
                          # gon.from_age[16] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[16].col_1)                            
                          # end        
#                   
                          # b = publisher_product_from_age_updated.age_18
                          # gon.from_age[17] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[17].col_1)                            
                          # end        
#     
                          # b = publisher_product_from_age_updated.age_19
                          # gon.from_age[18] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[18].col_1)                            
                          # end        
#     
                          # b = publisher_product_from_age_updated.age_20
                          # gon.from_age[19] = b
                          # if b
                            # gon.from_age_text.push(a_from_ages[19].col_1)                            
                          # end        
#                           
                          # b_updated_from_age = true                      
                      # end
                  # else
                      # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_from_age_updated was nil')
                      # raise
                  # end          
              # else
                  # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_from_age update_attributes failed')
                  # raise
              # end          
          # else
              # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_from_age was nil')
              # raise
          # end
#               
          # publisher_product_to_age = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_to_age rescue nil          
          # if !publisher_product_to_age.nil?
              # if publisher_product_to_age.update_attributes(h_to_age)
                  # publisher_product_to_age = nil
                  # publisher_product_to_age_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_to_age rescue nil
                  # if !publisher_product_to_age_updated.nil?
#                     
                      # a_to_ages = Array.new
                      # to_ages = return_all_dtab8lets
                      # to_ages.each do |age|
                        # a_to_ages.push(age)
                      # end
#                       
                      # if (publisher_product_to_age_updated.age_1 or
                          # publisher_product_to_age_updated.age_2 or
                          # publisher_product_to_age_updated.age_3 or
                          # publisher_product_to_age_updated.age_4 or
                          # publisher_product_to_age_updated.age_5 or
                          # publisher_product_to_age_updated.age_6 or
                          # publisher_product_to_age_updated.age_7 or
                          # publisher_product_to_age_updated.age_8 or
                          # publisher_product_to_age_updated.age_9 or
                          # publisher_product_to_age_updated.age_10 or
                          # publisher_product_to_age_updated.age_11 or
                          # publisher_product_to_age_updated.age_12 or
                          # publisher_product_to_age_updated.age_13 or
                          # publisher_product_to_age_updated.age_14 or
                          # publisher_product_to_age_updated.age_15 or
                          # publisher_product_to_age_updated.age_16 or
                          # publisher_product_to_age_updated.age_17 or
                          # publisher_product_to_age_updated.age_18 or
                          # publisher_product_to_age_updated.age_19 or
                          # publisher_product_to_age_updated.age_20)
#                   
                          # # b_required_to_age = false
#                               
                          # b = publisher_product_to_age_updated.age_1
                          # gon.to_age[0] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[0].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_2
                          # gon.to_age[1] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[1].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_3
                          # gon.to_age[2] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[2].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_4
                          # gon.to_age[3] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[3].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_5
                          # gon.to_age[4] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[4].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_6
                          # gon.to_age[5] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[5].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_7
                          # gon.to_age[6] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[6].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_8
                          # gon.to_age[7] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[7].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_9
                          # gon.to_age[8] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[8].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_10
                          # gon.to_age[9] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[9].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_11
                          # gon.to_age[10] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[10].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_12
                          # gon.to_age[11] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[11].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_13
                          # gon.to_age[12] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[12].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_14
                          # gon.to_age[13] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[13].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_15
                          # gon.to_age[14] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[14].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_16
                          # gon.to_age[15] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[15].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_17
                          # gon.to_age[16] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[16].col_1)                            
                          # end        
#                   
                          # b = publisher_product_to_age_updated.age_18
                          # gon.to_age[17] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[17].col_1)                            
                          # end        
#     
                          # b = publisher_product_to_age_updated.age_19
                          # gon.to_age[18] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[18].col_1)                            
                          # end        
                          # b = publisher_product_to_age_updated.age_20
                          # gon.to_age[19] = b
                          # if b
                            # gon.to_age_text.push(a_to_ages[19].col_1)                            
                          # end
                      # end
#                       
                      # b_updated_to_age = true
                  # else
                      # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_to_age_updated was nil')
                      # raise
                  # end          
              # else
                  # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_to_age update_attributes failed')
                  # raise
              # end          
          # else
              # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_to_age was nil')
              # raise
          # end
#       
          # if (b_updated_from_age and b_updated_to_age)       
              # respond_to do |format|
                # format.html {}
                # format.json { render :json => { :g_from_age => gon.from_age,
                                                # :g_from_age_text => gon.from_age_text,
                                                # :b_required_from_age => b_required_from_age,
                                                # :g_to_age => gon.to_age,
                                                # :g_to_age_text => gon.to_age_text,
                                                # :b_required_to_age => b_required_to_age,
                                                # :b_error => false,
                                                # :updated => publisher_product_from_age_updated.updated_at.to_s(:long) } }
              # end
          # else
              # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'b_updated_from_age and b_updated_to_age was false')
              # raise
          # end
#     
      # rescue StandardError => e
# 
          # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => e.message.to_s)
          # respond_to do |format|
              # format.html {}
              # format.json { render :json => { :b_error => true } }
          # end
# 
      # end
#     
#     
  # end



  def update_age_range
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          from_age = h_obj[:from_age]
          to_age = h_obj[:to_age]



          from_age = h_obj[:from_age]
          ar_from_ages = Array.new
          ar_from_ages = from_age.split(',')
      
          to_age = h_obj[:to_age]
          ar_to_ages = Array.new
          ar_to_ages = to_age.split(',')

          from_age = from_age.to_i
          to_age = to_age.to_i
    
          Rails.logger.info("from_age = " + from_age.to_s)
          Rails.logger.info("to_age = " + to_age.to_s)
    
          # from_age = from_age.to_i - 1
          # to_age = to_age.to_i - 1
          if ((from_age == 0) and (to_age > 0))
              from_age = to_age
          end
          if ((from_age > 0) and (to_age == 0))
              to_age = from_age
          end

          # this assumes that there will be no failure when saving from_age and to_age
          # else, update_attributes() would need to be called twice
          b_required = true
          if ((from_age > 0) and (to_age > 0))
              b_required = false
          end


          # b_required_from_age and b_required_to_age are only for fields in the view
          # they do not exist in the model, only b_required
          b_required_from_age = false
          b_required_to_age = true
          
          b_updated_age_range = true
          gon.from_age = 0
          gon.from_age_text = ''
          gon.to_age = 0
          gon.to_age_text = ''
          b_error = true
          i_from_age = 0
          i_to_age = 0
          updated = nil

          publisher_product_age_range = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_age_range rescue nil
          if !publisher_product_age_range.nil?
              h_age_range = Hash.new
              h_age_range[:age_from] = from_age
              h_age_range[:age_to] = to_age
              h_age_range[:required] = b_required
              if publisher_product_age_range.update_attributes(h_age_range)
                  publisher_product_age_range = nil
                  publisher_product_age_range_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_age_range rescue nil
                  if !publisher_product_age_range_updated.nil?

                      a_from_ages = Array.new
                      from_ages = return_all_dtab8lets
                      from_ages.each do |age|
                        a_from_ages.push(age)
                      end

                      # a_to_ages = Array.new
                      # to_ages = return_all_dtab8lets
                      # to_ages.each do |age|
                        # a_to_ages.push(age)
                      # end

                      gon.from_age = []
                      gon.from_age_text = []    
                      gon.to_age = []
                      gon.to_age_text = []    
                      
                      from_age = publisher_product_age_range_updated.age_from
                      to_age = publisher_product_age_range_updated.age_to
                      
                      z = 18
                      for i in 0..z
                          gon.from_age[i] = false
                          gon.to_age[i] = false
                      end

                      i_from_age = from_age
                      i_to_age = to_age
                      
                      from_age = from_age -1
                      to_age = to_age -1
                      
                      gon.from_age[from_age] = true
                      gon.from_age_text.push(a_from_ages[from_age].col_1)                            
                      gon.to_age[to_age] = true
                      gon.to_age_text.push(a_from_ages[to_age].col_1) # a_to_ages is the same as a_from_ages
                      
                      # if ((from_age.to_s == '0') and (to_age.to_s == '0'))
                          # b_required_from_age = true
                          # b_required_to_age = true      
                      # end
                      
                      # b = publisher_product_from_age_updated.age_1
                      # gon.from_age[0] = b
                      # if b
                        # gon.from_age_text.push(a_from_ages[0].col_1)                            
                      # end        

                      b_required_to_age = false
                      b_updated_age_range = false

                      b_updated_age_range = true                      

                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_age_range_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_age_range update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'publisher_product_age_range was nil')
              raise
          end
              
      
          if b_updated_age_range       
              respond_to do |format|
                format.html {}
                format.json { render :json => { :from_age => gon.from_age,
                                                :from_age_text => gon.from_age_text,
                                                :b_required_from_age => b_required_from_age,
                                                :to_age => gon.to_age,
                                                :to_age_text => gon.to_age_text,
                                                :b_required_to_age => b_required_to_age,
                                                :b_error => false,
                                                :i_from_age => i_from_age,
                                                :i_to_age => i_to_age,
                                                :updated => publisher_product_age_range_updated.updated_at.to_s(:long) } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => 'b_updated_from_age and b_updated_to_age was false')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_age_range', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end
    
    
  end





























  def update_grade_range
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          
          from_grade = h_obj[:from_grade]
          ar_from_grades = Array.new
          ar_from_grades = from_grade.split(',')
      
          to_grade = h_obj[:to_grade]
          ar_to_grades = Array.new
          ar_to_grades = to_grade.split(',')
      
          # catch exceptional
          b_required_from_grade = false
          b_required_to_grade = false   
          z = ar_from_grades.length - 1 # length for single dropdown will always be 1, and z will be 0 for the first array element
          for i in 0..z
              if ((ar_from_grades[i].to_s == '0') and (ar_to_grades[i].to_s == '0'))
                  b_required_from_grade = true
                  b_required_to_grade = true      
              elsif ((ar_from_grades[i].to_s == '15') or (ar_to_grades[i].to_s == '15'))
                  ar_from_grades[i] = '15'
                  ar_to_grades[i] = '0'
              elsif ((ar_from_grades[i].to_s == '16') or (ar_to_grades[i].to_s == '16'))
                  ar_from_grades[i] = '16'
                  ar_to_grades[i] = '0'
              elsif (ar_from_grades[i].to_s == ar_to_grades[i].to_s)
                  ar_to_grades[i] = 0
              elsif ((ar_from_grades[i].to_s != '15') and (ar_from_grades[i].to_s != '16'))
                  v1 = ar_from_grades[i].to_i
                  v2 = ar_to_grades[i].to_i
                  if (v1 > v2)
                    ar_from_grades[i] = v2.to_s
                    ar_to_grades[i] = v1.to_s
                  elsif ((ar_from_grades[i].to_s == '0') and (ar_to_grades[i].to_s != '0'))
                    ar_from_grades[i] = v2.to_s
                    ar_to_grades[i] = v1.to_s              
                  end
              end
          end
      
          h_from_grade = Hash.new
          h_from_grade[:grade_1] = false
          h_from_grade[:grade_2] = false
          h_from_grade[:grade_3] = false
          h_from_grade[:grade_4] = false
          h_from_grade[:grade_5] = false
          h_from_grade[:grade_6] = false
          h_from_grade[:grade_7] = false
          h_from_grade[:grade_8] = false
          h_from_grade[:grade_9] = false
          h_from_grade[:grade_10] = false
          h_from_grade[:grade_11] = false
          h_from_grade[:grade_12] = false
          h_from_grade[:grade_13] = false
          h_from_grade[:grade_14] = false
          h_from_grade[:grade_15] = false
          h_from_grade[:grade_16] = false
      
          ar_from_grades.each do |grade|
            case grade.to_s  
              when "1"
                h_from_grade[:grade_1] = true
              when "2"
                h_from_grade[:grade_2] = true
              when "3"
                h_from_grade[:grade_3] = true
              when "4"
                h_from_grade[:grade_4] = true
              when "5"
                h_from_grade[:grade_5] = true
              when "6"
                h_from_grade[:grade_6] = true
              when "7"
                h_from_grade[:grade_7] = true
              when "8"
                h_from_grade[:grade_8] = true
              when "9"
                h_from_grade[:grade_9] = true
              when "10"
                h_from_grade[:grade_10] = true
              when "11"
                h_from_grade[:grade_11] = true
              when "12"
                h_from_grade[:grade_12] = true
              when "13"
                h_from_grade[:grade_13] = true
              when "14"
                h_from_grade[:grade_14] = true
              when "15"
                h_from_grade[:grade_15] = true
              when "16"
                h_from_grade[:grade_16] = true
              else
                #        
            end
          end
    
          h_to_grade = Hash.new
          h_to_grade[:grade_1] = false
          h_to_grade[:grade_2] = false
          h_to_grade[:grade_3] = false
          h_to_grade[:grade_4] = false
          h_to_grade[:grade_5] = false
          h_to_grade[:grade_6] = false
          h_to_grade[:grade_7] = false
          h_to_grade[:grade_8] = false
          h_to_grade[:grade_9] = false
          h_to_grade[:grade_10] = false
          h_to_grade[:grade_11] = false
          h_to_grade[:grade_12] = false
          h_to_grade[:grade_13] = false
          h_to_grade[:grade_14] = false
          h_to_grade[:grade_15] = false
          h_to_grade[:grade_16] = false
      
          ar_to_grades.each do |grade|
            case grade.to_s  
              when "1"
                h_to_grade[:grade_1] = true
              when "2"
                h_to_grade[:grade_2] = true
              when "3"
                h_to_grade[:grade_3] = true
              when "4"
                h_to_grade[:grade_4] = true
              when "5"
                h_to_grade[:grade_5] = true
              when "6"
                h_to_grade[:grade_6] = true
              when "7"
                h_to_grade[:grade_7] = true
              when "8"
                h_to_grade[:grade_8] = true
              when "9"
                h_to_grade[:grade_9] = true
              when "10"
                h_to_grade[:grade_10] = true
              when "11"
                h_to_grade[:grade_11] = true
              when "12"
                h_to_grade[:grade_12] = true
              when "13"
                h_to_grade[:grade_13] = true
              when "14"
                h_to_grade[:grade_14] = true
              when "15"
                h_to_grade[:grade_15] = true
              when "16"
                h_to_grade[:grade_16] = true
              else
                #        
            end
          end
    
          h_from_grade[:required] = b_required_from_grade      
          gon.from_grade = []
          gon.from_grade_text = []    
    
          h_to_grade[:required] = b_required_to_grade
          gon.to_grade = []
          gon.to_grade_text = []    
    
          b_updated_from_grade = false
          b_updated_to_grade = false
      
          publisher_product_from_grade = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_from_grade rescue nil
          if !publisher_product_from_grade.nil?
              if publisher_product_from_grade.update_attributes(h_from_grade)
                  publisher_product_from_grade = nil
                  publisher_product_from_grade_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_from_grade rescue nil
                  if !publisher_product_from_grade_updated.nil?
                    
                      a_from_grades = Array.new
                      from_grades = return_all_dtab9lets
                      from_grades.each do |grade|
                        a_from_grades.push(grade)
                      end
                      
                      if (publisher_product_from_grade_updated.grade_1 or
                          publisher_product_from_grade_updated.grade_2 or
                          publisher_product_from_grade_updated.grade_3 or
                          publisher_product_from_grade_updated.grade_4 or
                          publisher_product_from_grade_updated.grade_5 or
                          publisher_product_from_grade_updated.grade_6 or
                          publisher_product_from_grade_updated.grade_7 or
                          publisher_product_from_grade_updated.grade_8 or
                          publisher_product_from_grade_updated.grade_9 or
                          publisher_product_from_grade_updated.grade_10 or
                          publisher_product_from_grade_updated.grade_11 or
                          publisher_product_from_grade_updated.grade_12 or
                          publisher_product_from_grade_updated.grade_13 or
                          publisher_product_from_grade_updated.grade_14 or
                          publisher_product_from_grade_updated.grade_15 or
                          publisher_product_from_grade_updated.grade_16)
                  
                          # b_required_from_grade = false
                              
                          b = publisher_product_from_grade_updated.grade_1
                          gon.from_grade[0] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[0].col_1)          
                            Rails.logger.info("a_from_grades[0].col_1 = " + a_from_grades[0].col_1)                  
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_2
                          gon.from_grade[1] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[1].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_3
                          gon.from_grade[2] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[2].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_4
                          gon.from_grade[3] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[3].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_5
                          gon.from_grade[4] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[4].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_6
                          gon.from_grade[5] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[5].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_7
                          gon.from_grade[6] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[6].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_8
                          gon.from_grade[7] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[7].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_9
                          gon.from_grade[8] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[8].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_10
                          gon.from_grade[9] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[9].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_11
                          gon.from_grade[10] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[10].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_12
                          gon.from_grade[11] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[11].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_13
                          gon.from_grade[12] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[12].col_1)                            
                          end        
                  
                          b = publisher_product_from_grade_updated.grade_14
                          gon.from_grade[13] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[13].col_1)                            
                          end        
    
                          b = publisher_product_from_grade_updated.grade_15
                          gon.from_grade[14] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[14].col_1)                            
                          end        
                          b = publisher_product_from_grade_updated.grade_16
                          gon.from_grade[15] = b
                          if b
                            gon.from_grade_text.push(a_from_grades[15].col_1)                            
                          end        
                      end
                      
                      b_updated_from_grade = true
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'publisher_product_from_grade_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'publisher_product_from_grade update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'publisher_product_from_grade was nil')
              raise
          end
    
          publisher_product_to_grade = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_to_grade rescue nil
          if !publisher_product_to_grade.nil?
              if publisher_product_to_grade.update_attributes(h_to_grade)
                  publisher_product_to_grade = nil
                  publisher_product_to_grade_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_to_grade rescue nil
                  if !publisher_product_to_grade_updated.nil?
                    
                      a_to_grades = Array.new
                      to_grades = return_all_dtab9lets
                      to_grades.each do |grade|
                        a_to_grades.push(grade)
                      end
                      
                      if (publisher_product_to_grade_updated.grade_1 or
                          publisher_product_to_grade_updated.grade_2 or
                          publisher_product_to_grade_updated.grade_3 or
                          publisher_product_to_grade_updated.grade_4 or
                          publisher_product_to_grade_updated.grade_5 or
                          publisher_product_to_grade_updated.grade_6 or
                          publisher_product_to_grade_updated.grade_7 or
                          publisher_product_to_grade_updated.grade_8 or
                          publisher_product_to_grade_updated.grade_9 or
                          publisher_product_to_grade_updated.grade_10 or
                          publisher_product_to_grade_updated.grade_11 or
                          publisher_product_to_grade_updated.grade_12 or
                          publisher_product_to_grade_updated.grade_13 or
                          publisher_product_to_grade_updated.grade_14 or
                          publisher_product_to_grade_updated.grade_15 or
                          publisher_product_to_grade_updated.grade_16)
                  
                          # b_required_to_grade = false
                              
                          b = publisher_product_to_grade_updated.grade_1
                          gon.to_grade[0] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[0].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_2
                          gon.to_grade[1] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[1].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_3
                          gon.to_grade[2] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[2].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_4
                          gon.to_grade[3] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[3].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_5
                          gon.to_grade[4] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[4].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_6
                          gon.to_grade[5] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[5].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_7
                          gon.to_grade[6] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[6].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_8
                          gon.to_grade[7] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[7].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_9
                          gon.to_grade[8] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[8].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_10
                          gon.to_grade[9] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[9].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_11
                          gon.to_grade[10] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[10].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_12
                          gon.to_grade[11] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[11].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_13
                          gon.to_grade[12] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[12].col_1)                            
                          end        
                  
                          b = publisher_product_to_grade_updated.grade_14
                          gon.to_grade[13] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[13].col_1)                            
                          end        
    
                          b = publisher_product_to_grade_updated.grade_15
                          gon.to_grade[14] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[14].col_1)                            
                          end        
                          b = publisher_product_to_grade_updated.grade_16
                          gon.to_grade[15] = b
                          if b
                            gon.to_grade_text.push(a_to_grades[15].col_1)                            
                          end        
                      end
                      
                      b_updated_to_grade = true
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'publisher_product_to_grade_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'publisher_product_to_grade update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'publisher_product_to_grade was nil')
              raise
          end
      
          if (b_updated_from_grade and b_updated_to_grade)      
              respond_to do |format|
                format.html {}
                format.json { render :json => { :g_from_grade => gon.from_grade,
                                                :g_from_grade_text => gon.from_grade_text,
                                                :b_required_from_grade => b_required_from_grade,
                                                :g_to_grade => gon.to_grade,
                                                :g_to_grade_text => gon.to_grade_text,
                                                :b_required_to_grade => b_required_to_grade,
                                                :b_error => false,
                                                :updated => publisher_product_from_grade_updated.updated_at.to_s(:long) } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => 'b_updated_from_grade and b_updated_to_grade was false')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_grade_range', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def update_market_target

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_id = h_obj[:publisher_id]
          publisher_product_id = h_obj[:publisher_product_id]

          market_target = h_obj[:market_target]
          
          ar_market_target = Array.new
          ar_market_target = market_target.split(',')
      
          h_update = Hash.new
          h_update[:market_target_1] = false
          h_update[:market_target_2] = false
          
          ar_market_target.each do |target|
            
            case target.to_s  
              when "1"
                h_update[:market_target_1] = true
              when "2"
                h_update[:market_target_2] = true
              else
                #        
            end
            
          end
      
          h_update[:publisher_id] = publisher_id
          h_update[:publisher_product_id] = publisher_product_id
      
          publisher_product_market_target = PublisherProductMarketTarget.where("publisher_product_id = ?", publisher_product_id).first rescue nil 
          if !publisher_product_market_target.nil?
              if publisher_product_market_target.update_attributes(h_update)
                  publisher_product_market_target_id = publisher_product_market_target.id
                  publisher_product_market_target = nil
                  publisher_product_market_target_updated = PublisherProductMarketTarget.find(publisher_product_market_target_id) rescue nil
                  if !publisher_product_market_target_updated.nil?
                    
                      a_market_targets = Array.new
                      market_targets = return_all_dtab11lets
                      market_targets.each do |m_target|
                        a_market_targets.push(m_target)
                      end
                      gon.market_target = []
                      gon.market_target_text = []    
                      b_required = true                                
                      if (publisher_product_market_target_updated.market_target_1 or
                          publisher_product_market_target_updated.market_target_2)
                          
                          b_required = false
                  
                          b = publisher_product_market_target_updated.market_target_1
                          gon.market_target[0] = b
                          if b
                            gon.market_target_text.push(a_market_targets[0].col_1)                            
                          end        
                  
                          b = publisher_product_market_target_updated.market_target_2
                          gon.market_target[1] = b
                          if b
                            gon.market_target_text.push(a_market_targets[1].col_1)                            
                          end        
                          
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :market_target => gon.market_target,
                                                        :market_target_text => gon.market_target_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_market_target_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_market_target', :description => 'publisher_product_market_target_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_market_target', :description => 'publisher_product_market_target update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_market_target', :description => 'publisher_product_market_target was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_market_target', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_platform

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          platform = h_obj[:platform]
          platform_other = h_obj[:platform_other]
          platform_other_b = h_obj[:platform_other_b]
      
          publisher_product_platform = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_platform rescue nil
          if !publisher_product_platform.nil?
            
              ar_platform = Array.new
              ar_platform = platform.split(',')
          
              h_update = Hash.new
              h_update[:platform_1] = false
              h_update[:platform_2] = false
              h_update[:platform_3] = false
              h_update[:platform_4] = false
              h_update[:platform_5] = false
              h_update[:platform_6] = false
              h_update[:platform_7] = false
              h_update[:platform_8] = false
              h_update[:platform_9] = false
              h_update[:platform_10] = false
              h_update[:platform_11] = false
              h_update[:platform_12] = false
              h_update[:platform_13] = false
              h_update[:platform_other_b] = platform_other_b
              h_update[:platform_other] = platform_other
              
              ar_platform.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:platform_1] = true
                  when "2"
                    h_update[:platform_2] = true
                  when "3"
                    h_update[:platform_3] = true
                  when "4"
                    h_update[:platform_4] = true
                  when "5"
                    h_update[:platform_5] = true
                  when "6"
                    h_update[:platform_6] = true
                  when "7"
                    h_update[:platform_7] = true
                  when "8"
                    h_update[:platform_8] = true
                  when "9"
                    h_update[:platform_9] = true
                  when "10"
                    h_update[:platform_10] = true
                  when "11"
                    h_update[:platform_11] = true
                  when "12"
                    h_update[:platform_12] = true
                  when "13"
                    h_update[:platform_13] = true
          
                  else
                    #        
                end
              end
          
              if publisher_product_platform.update_attributes(h_update)
                  publisher_product_platform = nil
                  publisher_product_platform_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_platform rescue nil
                  if !publisher_product_platform_updated.nil?
      
                      gon.platform = []
                      
                      b_has_platform = false
                      a_platforms = Array.new
                      platforms = return_all_dtab3lets
                      platforms.each do |pltfrm|
                        a_platforms.push(pltfrm)
                      end
                      gon.platform_text = []
                      b_required = true
                      
                      b_platform_other = false
                      platform_other = ""            
                      if publisher_product_platform_updated.platform_other_b
                          b_platform_other = true
                          platform_other = publisher_product_platform_updated.platform_other
                      end
                      
                      if (publisher_product_platform_updated.platform_1 or
                          publisher_product_platform_updated.platform_2 or
                          publisher_product_platform_updated.platform_3 or
                          publisher_product_platform_updated.platform_4 or
                          publisher_product_platform_updated.platform_5 or
                          publisher_product_platform_updated.platform_6 or
                          publisher_product_platform_updated.platform_7 or
                          publisher_product_platform_updated.platform_8 or
                          publisher_product_platform_updated.platform_9 or
                          publisher_product_platform_updated.platform_10 or
                          publisher_product_platform_updated.platform_11 or
                          publisher_product_platform_updated.platform_12 or
                          publisher_product_platform_updated.platform_13)
                  
                          #b_has_platform = true
                          b_required = false
                                  
                          b = publisher_product_platform_updated.platform_1
                          gon.platform[0] = b
                          if b
                            gon.platform_text.push(a_platforms[0].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_2
                          gon.platform[1] = b
                          if b
                            gon.platform_text.push(a_platforms[1].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_3
                          gon.platform[2] = b
                          if b
                            gon.platform_text.push(a_platforms[2].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_4
                          gon.platform[3] = b
                          if b
                            gon.platform_text.push(a_platforms[3].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_5
                          gon.platform[4] = b
                          if b
                            gon.platform_text.push(a_platforms[4].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_6
                          gon.platform[5] = b
                          if b
                            gon.platform_text.push(a_platforms[5].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_7
                          gon.platform[6] = b
                          if b
                            gon.platform_text.push(a_platforms[6].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_8
                          gon.platform[7] = b
                          if b
                            gon.platform_text.push(a_platforms[7].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_9
                          gon.platform[8] = b
                          if b
                            gon.platform_text.push(a_platforms[8].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_10
                          gon.platform[9] = b
                          if b
                            gon.platform_text.push(a_platforms[9].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_11
                          gon.platform[10] = b
                          if b
                            gon.platform_text.push(a_platforms[10].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_12
                          gon.platform[11] = b
                          if b
                            gon.platform_text.push(a_platforms[11].col_1)  
                          end        
                  
                          b = publisher_product_platform_updated.platform_13
                          gon.platform[12] = b
                          if b
                            gon.platform_text.push(a_platforms[12].col_1)  
                          end        
                          
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :b_has_platform => b_has_platform,
                                                        :platform => gon.platform,
                                                        :platform_other => platform_other,
                                                        :has_platform_other => b_platform_other,
                                                        :platform_text => gon.platform_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_platform_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_platform', :description => 'publisher_product_platform_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_platform', :description => 'publisher_product_platform update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_platform', :description => 'publisher_product_platform was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_platform', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_file_type

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          file_type = h_obj[:file_type]
          file_type_other = h_obj[:file_type_other]
          file_type_other_b = h_obj[:file_type_other_b]
      
          publisher_product_file_type = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_file_type rescue nil
          if !publisher_product_file_type.nil?
            
              ar_file_type = Array.new
              ar_file_type = file_type.split(',')
          
              h_update = Hash.new
              h_update[:file_type_1] = false
              h_update[:file_type_2] = false
              h_update[:file_type_3] = false
              h_update[:file_type_4] = false
              h_update[:file_type_5] = false
              h_update[:file_type_6] = false
              h_update[:file_type_7] = false
              h_update[:file_type_8] = false
              h_update[:file_type_9] = false
              h_update[:file_type_10] = false
              h_update[:file_type_11] = false
              h_update[:file_type_12] = false
              h_update[:file_type_13] = false
              h_update[:file_type_14] = false
              h_update[:file_type_15] = false
              h_update[:file_type_16] = false
              h_update[:file_type_17] = false
              h_update[:file_type_18] = false
              h_update[:file_type_19] = false
              h_update[:file_type_20] = false
              h_update[:file_type_21] = false
              h_update[:file_type_other_b] = file_type_other_b
              h_update[:file_type_other] = file_type_other
              
              ar_file_type.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:file_type_1] = true
                  when "2"
                    h_update[:file_type_2] = true
                  when "3"
                    h_update[:file_type_3] = true
                  when "4"
                    h_update[:file_type_4] = true
                  when "5"
                    h_update[:file_type_5] = true
                  when "6"
                    h_update[:file_type_6] = true
                  when "7"
                    h_update[:file_type_7] = true
                  when "8"
                    h_update[:file_type_8] = true
                  when "9"
                    h_update[:file_type_9] = true
                  when "10"
                    h_update[:file_type_10] = true
                  when "11"
                    h_update[:file_type_11] = true
                  when "12"
                    h_update[:file_type_12] = true
                  when "13"
                    h_update[:file_type_13] = true
                  when "14"
                    h_update[:file_type_14] = true
                  when "15"
                    h_update[:file_type_15] = true
                  when "16"
                    h_update[:file_type_16] = true
                  when "17"
                    h_update[:file_type_17] = true
                  when "18"
                    h_update[:file_type_18] = true
                  when "19"
                    h_update[:file_type_19] = true
                  when "20"
                    h_update[:file_type_20] = true
                  when "21"
                    h_update[:file_type_21] = true
                  else
                    #        
                end
              end
    
              if publisher_product_file_type.update_attributes(h_update)
                  publisher_product_file_type = nil
                  publisher_product_file_type_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_file_type rescue nil
                  if !publisher_product_file_type_updated.nil?
                      gon.file_type = []
                      
                      b_has_file_type = false
                      
                      a_file_types = Array.new
                      file_types = return_all_dtab1lets
                      file_types.each do |ft|
                        a_file_types.push(ft)
                      end
                      gon.file_type_text = []
                      b_required = true
                      
                      b_file_type_other = false
                      file_type_other = ""            
                      if publisher_product_file_type_updated.file_type_other_b
                          b_file_type_other = true
                          file_type_other = publisher_product_file_type_updated.file_type_other
                      end
                      
                      if (publisher_product_file_type_updated.file_type_1 or
                          publisher_product_file_type_updated.file_type_2 or
                          publisher_product_file_type_updated.file_type_3 or
                          publisher_product_file_type_updated.file_type_4 or
                          publisher_product_file_type_updated.file_type_5 or
                          publisher_product_file_type_updated.file_type_6 or
                          publisher_product_file_type_updated.file_type_7 or
                          publisher_product_file_type_updated.file_type_8 or
                          publisher_product_file_type_updated.file_type_9 or
                          publisher_product_file_type_updated.file_type_10 or
                          publisher_product_file_type_updated.file_type_11 or
                          publisher_product_file_type_updated.file_type_12 or
                          publisher_product_file_type_updated.file_type_13 or
                          publisher_product_file_type_updated.file_type_14 or
                          publisher_product_file_type_updated.file_type_15 or
                          publisher_product_file_type_updated.file_type_16 or
                          publisher_product_file_type_updated.file_type_17 or
                          publisher_product_file_type_updated.file_type_18 or
                          publisher_product_file_type_updated.file_type_19 or
                          publisher_product_file_type_updated.file_type_20 or
                          publisher_product_file_type_updated.file_type_21)
                  
                          # b_has_file_type = true
                          b_required = false
                          
                          b = publisher_product_file_type_updated.file_type_1
                          gon.file_type[0] = b
                          if b
                            gon.file_type_text.push(a_file_types[0].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_2
                          gon.file_type[1] = b
                          if b
                            gon.file_type_text.push(a_file_types[1].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_3
                          gon.file_type[2] = b
                          if b
                            gon.file_type_text.push(a_file_types[2].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_4
                          gon.file_type[3] = b
                          if b
                            gon.file_type_text.push(a_file_types[3].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_5
                          gon.file_type[4] = b
                          if b
                            gon.file_type_text.push(a_file_types[4].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_6
                          gon.file_type[5] = b
                          if b
                            gon.file_type_text.push(a_file_types[5].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_7
                          gon.file_type[6] = b
                          if b
                            gon.file_type_text.push(a_file_types[6].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_8
                          gon.file_type[7] = b
                          if b
                            gon.file_type_text.push(a_file_types[7].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_9
                          gon.file_type[8] = b
                          if b
                            gon.file_type_text.push(a_file_types[8].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_10
                          gon.file_type[9] = b
                          if b
                            gon.file_type_text.push(a_file_types[9].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_11
                          gon.file_type[10] = b
                          if b
                            gon.file_type_text.push(a_file_types[10].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_12
                          gon.file_type[11] = b
                          if b
                            gon.file_type_text.push(a_file_types[11].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_13
                          gon.file_type[12] = b
                          if b
                            gon.file_type_text.push(a_file_types[12].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_14
                          gon.file_type[13] = b
                          if b
                            gon.file_type_text.push(a_file_types[13].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_15
                          gon.file_type[14] = b
                          if b
                            gon.file_type_text.push(a_file_types[14].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_16
                          gon.file_type[15] = b
                          if b
                            gon.file_type_text.push(a_file_types[15].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_17
                          gon.file_type[16] = b
                          if b
                            gon.file_type_text.push(a_file_types[16].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_18
                          gon.file_type[17] = b
                          if b
                            gon.file_type_text.push(a_file_types[17].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_19
                          gon.file_type[18] = b
                          if b
                            gon.file_type_text.push(a_file_types[18].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_20
                          gon.file_type[19] = b
                          if b
                            gon.file_type_text.push(a_file_types[19].col_1)  
                          end        
                  
                          b = publisher_product_file_type_updated.file_type_21
                          gon.file_type[20] = b
                          if b
                            gon.file_type_text.push(a_file_types[20].col_1)  
                          end        
                          
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :b_has_file_type => b_has_file_type,
                                                        :file_type => gon.file_type,
                                                        :file_type_other => file_type_other,
                                                        :has_file_type_other => b_file_type_other,
                                                        :file_type_text => gon.file_type_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_file_type_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_file_type', :description => 'publisher_product_file_type_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_file_type', :description => 'publisher_product_file_type update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_file_type', :description => 'publisher_product_file_type was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_file_type', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_enhancement

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          enhancement = h_obj[:enhancement]
          enhancement_other = h_obj[:enhancement_other]
          enhancement_other_b = h_obj[:enhancement_other_b]    
          
          publisher_product_enhancement = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_enhancement rescue first
          if !publisher_product_enhancement.nil?
            
              ar_enhancement = Array.new
              ar_enhancement = enhancement.split(',')
          
              h_update = Hash.new
              h_update[:enhancement_1] = false
              h_update[:enhancement_2] = false
              h_update[:enhancement_3] = false
              h_update[:enhancement_4] = false
              h_update[:enhancement_5] = false
              h_update[:enhancement_6] = false
              h_update[:enhancement_7] = false
              h_update[:enhancement_8] = false
              h_update[:enhancement_9] = false
              h_update[:enhancement_10] = false
              h_update[:enhancement_11] = false
              h_update[:enhancement_12] = false
              h_update[:enhancement_other_b] = enhancement_other_b
              h_update[:enhancement_other] = enhancement_other
              
              ar_enhancement.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:enhancement_1] = true
                  when "2"
                    h_update[:enhancement_2] = true
                  when "3"
                    h_update[:enhancement_3] = true
                  when "4"
                    h_update[:enhancement_4] = true
                  when "5"
                    h_update[:enhancement_5] = true
                  when "6"
                    h_update[:enhancement_6] = true
                  when "7"
                    h_update[:enhancement_7] = true
                  when "8"
                    h_update[:enhancement_8] = true
                  when "9"
                    h_update[:enhancement_9] = true
                  when "10"
                    h_update[:enhancement_10] = true
                  when "11"
                    h_update[:enhancement_11] = true
                  when "12"
                    h_update[:enhancement_12] = true
                  else
                    #        
                end
              end
            
              if publisher_product_enhancement.update_attributes(h_update)
                  publisher_product_enhancement = nil
                  publisher_product_enhancement_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_enhancement rescue first
                  if !publisher_product_enhancement_updated.nil?
                    
                      b_has_enhancement = false
                      a_enhancements = Array.new
                      @enhancements = return_all_dtab6lets
                      @enhancements.each do |enhncmnt|
                        a_enhancements.push(enhncmnt)
                      end
                      gon.enhancement = []
                      gon.enhancement_text = []    
                      b_required = true
                      
                      b_enhancement_other = false
                      enhancement_other = ""            
                      if publisher_product_enhancement_updated.enhancement_other_b
                          b_enhancement_other = true
                          enhancement_other = publisher_product_enhancement_updated.enhancement_other
                      end
                      
                      if (publisher_product_enhancement_updated.enhancement_1 or
                          publisher_product_enhancement_updated.enhancement_2 or
                          publisher_product_enhancement_updated.enhancement_3 or
                          publisher_product_enhancement_updated.enhancement_4 or
                          publisher_product_enhancement_updated.enhancement_5 or
                          publisher_product_enhancement_updated.enhancement_6 or
                          publisher_product_enhancement_updated.enhancement_7 or
                          publisher_product_enhancement_updated.enhancement_8 or
                          publisher_product_enhancement_updated.enhancement_9 or
                          publisher_product_enhancement_updated.enhancement_10 or
                          publisher_product_enhancement_updated.enhancement_11 or
                          publisher_product_enhancement_updated.enhancement_12)
                  
                          # b_has_enhancement = true
                          b_required = false
                              
                          b = publisher_product_enhancement_updated.enhancement_1
                          gon.enhancement[0] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[0].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_2
                          gon.enhancement[1] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[1].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_3
                          gon.enhancement[2] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[2].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_4
                          gon.enhancement[3] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[3].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_5
                          gon.enhancement[4] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[4].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_6
                          gon.enhancement[5] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[5].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_7
                          gon.enhancement[6] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[6].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_8
                          gon.enhancement[7] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[7].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_9
                          gon.enhancement[8] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[8].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_10
                          gon.enhancement[9] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[9].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_11
                          gon.enhancement[10] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[10].col_1)                            
                          end        
                  
                          b = publisher_product_enhancement_updated.enhancement_12
                          gon.enhancement[11] = b
                          if b
                            gon.enhancement_text.push(a_enhancements[11].col_1)                            
                          end        
                      end
                      
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :b_has_enhancement => b_has_enhancement,
                                                        :enhancement => gon.enhancement,
                                                        :enhancement_other => enhancement_other,
                                                        :has_enhancement_other => b_enhancement_other,
                                                        :enhancement_text => gon.enhancement_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_enhancement_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_enhancement', :description => 'publisher_product_enhancement_updated was nil')
                      raise
                  end          
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_enhancement', :description => 'publisher_product_enhancement update_attributes failed')
                  raise
              end          
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_enhancement', :description => 'publisher_product_enhancement was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_enhancement', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  def update_core_literacy_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          core_literacy_standard = h_obj[:core_literacy_standard]
          
          if PublisherProductCoreLiteracyStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_literacy_standard', :description => 'publisher_product_core_literacy_standard delete_record failed')
              raise
          end
      
          ar_core_literacy_standards = Array.new
          ar_core_literacy_standards = core_literacy_standard.split(',')
          
          ar_core_literacy_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_core_literacy_standard = PublisherProductCoreLiteracyStandard.new(h_new)
              if publisher_product_core_literacy_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_literacy_standard', :description => 'publisher_product_core_literacy_standard save failed')
                  raise
              end
              
              publisher_product_core_literacy_standard = nil
          end
          
          publisher_product_core_literacy_standards_updated = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          core_literacy_standards = CoreLiteracyStandard.order(sort_column_core_literacy + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_core_literacy_standard_updated.updated_at = date_0
          if ((!publisher_product_core_literacy_standards_updated.nil?) and (!core_literacy_standards.nil?))      
              updated = nil
              a_core_literacy_standards = Array.new    
              gon.core_literacy_standard = []
              gon.core_literacy_standard_text = []
              if publisher_product_core_literacy_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_core_literacy_standards_updated.each do |c|
                    gon.core_literacy_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_core_literacy_standards[i] = core_literacy_standards[ii].dot_not
                    i += 1
                  end
                  # gon.core_literacy_standard_text = a_core_literacy_standards.reverse!
                  gon.core_literacy_standard_text = a_core_literacy_standards
                  updated = publisher_product_core_literacy_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :core_literacy_standard => gon.core_literacy_standard,
                                                :core_literacy_standard_text => gon.core_literacy_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_literacy_standard', :description => 'publisher_product_core_literacy_standards_updated or core_literacy_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_literacy_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_core_math_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          core_math_standard = h_obj[:core_math_standard]
          
          if PublisherProductCoreMathStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_math_standard', :description => 'publisher_product_core_math_standard delete_record failed')
              raise
          end
      
          ar_core_math_standards = Array.new
          ar_core_math_standards = core_math_standard.split(',')
          
          ar_core_math_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_core_math_standard = PublisherProductCoreMathStandard.new(h_new)
              if publisher_product_core_math_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_math_standard', :description => 'publisher_product_core_math_standard save failed')
                  raise
              end
              
              publisher_product_core_math_standard = nil
          end
          
          publisher_product_core_math_standards_updated = PublisherProductCoreMathStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          core_math_standards = CoreMathStandard.order(sort_column_core_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_core_math_standard_updated.updated_at = date_0
          if ((!publisher_product_core_math_standards_updated.nil?) and (!core_math_standards.nil?))      
              updated = nil
              a_core_math_standards = Array.new    
              gon.core_math_standard = []
              gon.core_math_standard_text = []
              if publisher_product_core_math_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_core_math_standards_updated.each do |c|
                    gon.core_math_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_core_math_standards[i] = core_math_standards[ii].dot_not
                    i += 1
                  end
                  # gon.core_math_standard_text = a_core_math_standards.reverse!
                  gon.core_math_standard_text = a_core_math_standards
                  updated = publisher_product_core_math_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :core_math_standard => gon.core_math_standard,
                                                :core_math_standard_text => gon.core_math_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_math_standard', :description => 'publisher_product_core_math_standards_updated or core_math_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_core_math_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  # 122 english
  # 123 math              
  # 124 science
  # 125 social_studies
  # 126 languages_non_eng
  # 127 health_ed
  # 128 physical_ed
  # 129 fine_arts
  # 130 economics
  # 131 technology        
  # 132 career_dev
  # 133 second_language_eng_span        
  # 134 career_tech_ed

  def update_teks_english_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_english_standard = h_obj[:teks_english_standard]
          
          if PublisherProductTeksEnglishStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_english_standard', :description => 'publisher_product_teks_english_standard delete_record failed')
              raise
          end
      
          ar_teks_english_standards = Array.new
          ar_teks_english_standards = teks_english_standard.split(',')
          
          ar_teks_english_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_english_standard = PublisherProductTeksEnglishStandard.new(h_new)
              if publisher_product_teks_english_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_english_standard', :description => 'publisher_product_teks_english_standard save failed')
                  raise
              end
              
              publisher_product_teks_english_standard = nil
          end
          
          publisher_product_teks_english_standards_updated = PublisherProductTeksEnglishStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_english_standards = TeksEnglishStandard.order(sort_column_teks_english + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_english_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_english_standards_updated.nil?) and (!teks_english_standards.nil?))      
              updated = nil
              a_teks_english_standards = Array.new    
              teks_english_standard = []
              teks_english_standard_text = []
              if publisher_product_teks_english_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_english_standards_updated.each do |c|
                    teks_english_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_english_standards[i] = teks_english_standards[ii].section_text
                    i += 1
                  end
                  teks_english_standard_text = a_teks_english_standards
                  updated = publisher_product_teks_english_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_english_standard => teks_english_standard,
                                                :teks_english_standard_text => teks_english_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_english_standard', :description => 'publisher_product_teks_english_standards_updated or teks_english_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_english_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_math_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_math_standard = h_obj[:teks_math_standard]
          
          if PublisherProductTeksEnglishStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_math_standard', :description => 'publisher_product_teks_math_standard delete_record failed')
              raise
          end
      
          ar_teks_math_standards = Array.new
          ar_teks_math_standards = teks_math_standard.split(',')
          
          ar_teks_math_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_math_standard = PublisherProductTeksEnglishStandard.new(h_new)
              if publisher_product_teks_math_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_math_standard', :description => 'publisher_product_teks_math_standard save failed')
                  raise
              end
              
              publisher_product_teks_math_standard = nil
          end
          
          publisher_product_teks_math_standards_updated = PublisherProductTeksEnglishStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_math_standards = TeksEnglishStandard.order(sort_column_teks_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_math_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_math_standards_updated.nil?) and (!teks_math_standards.nil?))      
              updated = nil
              a_teks_math_standards = Array.new    
              teks_math_standard = []
              teks_math_standard_text = []
              if publisher_product_teks_math_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_math_standards_updated.each do |c|
                    teks_math_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_math_standards[i] = teks_math_standards[ii].section_text
                    i += 1
                  end
                  teks_math_standard_text = a_teks_math_standards
                  updated = publisher_product_teks_math_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_math_standard => teks_math_standard,
                                                :teks_math_standard_text => teks_math_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_math_standard', :description => 'publisher_product_teks_math_standards_updated or teks_math_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_math_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_science_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_science_standard = h_obj[:teks_science_standard]
          
          if PublisherProductTeksScienceStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_science_standard', :description => 'publisher_product_teks_science_standard delete_record failed')
              raise
          end
      
          ar_teks_science_standards = Array.new
          ar_teks_science_standards = teks_science_standard.split(',')
          
          ar_teks_science_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_science_standard = PublisherProductTeksScienceStandard.new(h_new)
              if publisher_product_teks_science_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_science_standard', :description => 'publisher_product_teks_science_standard save failed')
                  raise
              end
              
              publisher_product_teks_science_standard = nil
          end
          
          publisher_product_teks_science_standards_updated = PublisherProductTeksScienceStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_science_standards = TeksScienceStandard.order(sort_column_teks_science + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_science_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_science_standards_updated.nil?) and (!teks_science_standards.nil?))      
              updated = nil
              a_teks_science_standards = Array.new    
              teks_science_standard = []
              teks_science_standard_text = []
              if publisher_product_teks_science_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_science_standards_updated.each do |c|
                    teks_science_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_science_standards[i] = teks_science_standards[ii].section_text
                    i += 1
                  end
                  teks_science_standard_text = a_teks_science_standards
                  updated = publisher_product_teks_science_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_science_standard => teks_science_standard,
                                                :teks_science_standard_text => teks_science_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_science_standard', :description => 'publisher_product_teks_science_standards_updated or teks_science_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_science_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_social_studies_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_social_studies_standard = h_obj[:teks_social_studies_standard]
          
          if PublisherProductTeksSocialStudiesStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_social_studies_standard', :description => 'publisher_product_teks_social_studies_standard delete_record failed')
              raise
          end
      
          ar_teks_social_studies_standards = Array.new
          ar_teks_social_studies_standards = teks_social_studies_standard.split(',')
          
          ar_teks_social_studies_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_social_studies_standard = PublisherProductTeksSocialStudiesStandard.new(h_new)
              if publisher_product_teks_social_studies_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_social_studies_standard', :description => 'publisher_product_teks_social_studies_standard save failed')
                  raise
              end
              
              publisher_product_teks_social_studies_standard = nil
          end
          
          publisher_product_teks_social_studies_standards_updated = PublisherProductTeksSocialStudiesStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_social_studies_standards = TeksSocialStudiesStandard.order(sort_column_teks_social_studies + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_social_studies_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_social_studies_standards_updated.nil?) and (!teks_social_studies_standards.nil?))      
              updated = nil
              a_teks_social_studies_standards = Array.new    
              teks_social_studies_standard = []
              teks_social_studies_standard_text = []
              if publisher_product_teks_social_studies_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_social_studies_standards_updated.each do |c|
                    teks_social_studies_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_social_studies_standards[i] = teks_social_studies_standards[ii].section_text
                    i += 1
                  end
                  teks_social_studies_standard_text = a_teks_social_studies_standards
                  updated = publisher_product_teks_social_studies_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_social_studies_standard => teks_social_studies_standard,
                                                :teks_social_studies_standard_text => teks_social_studies_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_social_studies_standard', :description => 'publisher_product_teks_social_studies_standards_updated or teks_social_studies_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_social_studies_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_languages_non_eng_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_languages_non_eng_standard = h_obj[:teks_languages_non_eng_standard]
          
          if PublisherProductTeksLanguagesNonEngStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_languages_non_eng_standard', :description => 'publisher_product_teks_languages_non_eng_standard delete_record failed')
              raise
          end
      
          ar_teks_languages_non_eng_standards = Array.new
          ar_teks_languages_non_eng_standards = teks_languages_non_eng_standard.split(',')
          
          ar_teks_languages_non_eng_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_languages_non_eng_standard = PublisherProductTeksLanguagesNonEngStandard.new(h_new)
              if publisher_product_teks_languages_non_eng_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_languages_non_eng_standard', :description => 'publisher_product_teks_languages_non_eng_standard save failed')
                  raise
              end
              
              publisher_product_teks_languages_non_eng_standard = nil
          end
          
          publisher_product_teks_languages_non_eng_standards_updated = PublisherProductTeksLanguagesNonEngStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_languages_non_eng_standards = TeksLanguagesNonEngStandard.order(sort_column_teks_languages_non_eng + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_languages_non_eng_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_languages_non_eng_standards_updated.nil?) and (!teks_languages_non_eng_standards.nil?))      
              updated = nil
              a_teks_languages_non_eng_standards = Array.new    
              teks_languages_non_eng_standard = []
              teks_languages_non_eng_standard_text = []
              if publisher_product_teks_languages_non_eng_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_languages_non_eng_standards_updated.each do |c|
                    teks_languages_non_eng_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_languages_non_eng_standards[i] = teks_languages_non_eng_standards[ii].section_text
                    i += 1
                  end
                  teks_languages_non_eng_standard_text = a_teks_languages_non_eng_standards
                  updated = publisher_product_teks_languages_non_eng_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_languages_non_eng_standard => teks_languages_non_eng_standard,
                                                :teks_languages_non_eng_standard_text => teks_languages_non_eng_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_languages_non_eng_standard', :description => 'publisher_product_teks_languages_non_eng_standards_updated or teks_languages_non_eng_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_languages_non_eng_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_health_ed_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_health_ed_standard = h_obj[:teks_health_ed_standard]
          
          if PublisherProductTeksHealthEdStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_health_ed_standard', :description => 'publisher_product_teks_health_ed_standard delete_record failed')
              raise
          end
      
          ar_teks_health_ed_standards = Array.new
          ar_teks_health_ed_standards = teks_health_ed_standard.split(',')
          
          ar_teks_health_ed_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_health_ed_standard = PublisherProductTeksHealthEdStandard.new(h_new)
              if publisher_product_teks_health_ed_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_health_ed_standard', :description => 'publisher_product_teks_health_ed_standard save failed')
                  raise
              end
              
              publisher_product_teks_health_ed_standard = nil
          end
          
          publisher_product_teks_health_ed_standards_updated = PublisherProductTeksHealthEdStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_health_ed_standards = TeksHealthEdStandard.order(sort_column_teks_health_ed + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_health_ed_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_health_ed_standards_updated.nil?) and (!teks_health_ed_standards.nil?))      
              updated = nil
              a_teks_health_ed_standards = Array.new    
              teks_health_ed_standard = []
              teks_health_ed_standard_text = []
              if publisher_product_teks_health_ed_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_health_ed_standards_updated.each do |c|
                    teks_health_ed_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_health_ed_standards[i] = teks_health_ed_standards[ii].section_text
                    i += 1
                  end
                  teks_health_ed_standard_text = a_teks_health_ed_standards
                  updated = publisher_product_teks_health_ed_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_health_ed_standard => teks_health_ed_standard,
                                                :teks_health_ed_standard_text => teks_health_ed_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_health_ed_standard', :description => 'publisher_product_teks_health_ed_standards_updated or teks_health_ed_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_health_ed_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_physical_ed_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_physical_ed_standard = h_obj[:teks_physical_ed_standard]
          
          if PublisherProductTeksPhysicalEdStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_physical_ed_standard', :description => 'publisher_product_teks_physical_ed_standard delete_record failed')
              raise
          end
      
          ar_teks_physical_ed_standards = Array.new
          ar_teks_physical_ed_standards = teks_physical_ed_standard.split(',')
          
          ar_teks_physical_ed_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_physical_ed_standard = PublisherProductTeksPhysicalEdStandard.new(h_new)
              if publisher_product_teks_physical_ed_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_physical_ed_standard', :description => 'publisher_product_teks_physical_ed_standard save failed')
                  raise
              end
              
              publisher_product_teks_physical_ed_standard = nil
          end
          
          publisher_product_teks_physical_ed_standards_updated = PublisherProductTeksPhysicalEdStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_physical_ed_standards = TeksPhysicalEdStandard.order(sort_column_teks_physical_ed + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_physical_ed_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_physical_ed_standards_updated.nil?) and (!teks_physical_ed_standards.nil?))      
              updated = nil
              a_teks_physical_ed_standards = Array.new    
              teks_physical_ed_standard = []
              teks_physical_ed_standard_text = []
              if publisher_product_teks_physical_ed_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_physical_ed_standards_updated.each do |c|
                    teks_physical_ed_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_physical_ed_standards[i] = teks_physical_ed_standards[ii].section_text
                    i += 1
                  end
                  teks_physical_ed_standard_text = a_teks_physical_ed_standards
                  updated = publisher_product_teks_physical_ed_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_physical_ed_standard => teks_physical_ed_standard,
                                                :teks_physical_ed_standard_text => teks_physical_ed_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_physical_ed_standard', :description => 'publisher_product_teks_physical_ed_standards_updated or teks_physical_ed_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_physical_ed_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_fine_arts_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_fine_arts_standard = h_obj[:teks_fine_arts_standard]
          
          if PublisherProductTeksFineArtsStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_fine_arts_standard', :description => 'publisher_product_teks_fine_arts_standard delete_record failed')
              raise
          end
      
          ar_teks_fine_arts_standards = Array.new
          ar_teks_fine_arts_standards = teks_fine_arts_standard.split(',')
          
          ar_teks_fine_arts_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_fine_arts_standard = PublisherProductTeksFineArtsStandard.new(h_new)
              if publisher_product_teks_fine_arts_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_fine_arts_standard', :description => 'publisher_product_teks_fine_arts_standard save failed')
                  raise
              end
              
              publisher_product_teks_fine_arts_standard = nil
          end
          
          publisher_product_teks_fine_arts_standards_updated = PublisherProductTeksFineArtsStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_fine_arts_standards = TeksFineArtsStandard.order(sort_column_teks_fine_arts + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_fine_arts_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_fine_arts_standards_updated.nil?) and (!teks_fine_arts_standards.nil?))      
              updated = nil
              a_teks_fine_arts_standards = Array.new    
              teks_fine_arts_standard = []
              teks_fine_arts_standard_text = []
              if publisher_product_teks_fine_arts_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_fine_arts_standards_updated.each do |c|
                    teks_fine_arts_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_fine_arts_standards[i] = teks_fine_arts_standards[ii].section_text
                    i += 1
                  end
                  teks_fine_arts_standard_text = a_teks_fine_arts_standards
                  updated = publisher_product_teks_fine_arts_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_fine_arts_standard => teks_fine_arts_standard,
                                                :teks_fine_arts_standard_text => teks_fine_arts_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_fine_arts_standard', :description => 'publisher_product_teks_fine_arts_standards_updated or teks_fine_arts_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_fine_arts_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_economics_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_economics_standard = h_obj[:teks_economics_standard]
          
          if PublisherProductTeksEconomicsStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_economics_standard', :description => 'publisher_product_teks_economics_standard delete_record failed')
              raise
          end
      
          ar_teks_economics_standards = Array.new
          ar_teks_economics_standards = teks_economics_standard.split(',')
          
          ar_teks_economics_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_economics_standard = PublisherProductTeksEconomicsStandard.new(h_new)
              if publisher_product_teks_economics_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_economics_standard', :description => 'publisher_product_teks_economics_standard save failed')
                  raise
              end
              
              publisher_product_teks_economics_standard = nil
          end
          
          publisher_product_teks_economics_standards_updated = PublisherProductTeksEconomicsStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_economics_standards = TeksEconomicsStandard.order(sort_column_teks_economics + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_economics_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_economics_standards_updated.nil?) and (!teks_economics_standards.nil?))      
              updated = nil
              a_teks_economics_standards = Array.new    
              teks_economics_standard = []
              teks_economics_standard_text = []
              if publisher_product_teks_economics_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_economics_standards_updated.each do |c|
                    teks_economics_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_economics_standards[i] = teks_economics_standards[ii].section_text
                    i += 1
                  end
                  teks_economics_standard_text = a_teks_economics_standards
                  updated = publisher_product_teks_economics_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_economics_standard => teks_economics_standard,
                                                :teks_economics_standard_text => teks_economics_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_economics_standard', :description => 'publisher_product_teks_economics_standards_updated or teks_economics_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_economics_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_technology_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_technology_standard = h_obj[:teks_technology_standard]
          
          if PublisherProductTeksTechnologyStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_technology_standard', :description => 'publisher_product_teks_technology_standard delete_record failed')
              raise
          end
      
          ar_teks_technology_standards = Array.new
          ar_teks_technology_standards = teks_technology_standard.split(',')
          
          ar_teks_technology_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_technology_standard = PublisherProductTeksTechnologyStandard.new(h_new)
              if publisher_product_teks_technology_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_technology_standard', :description => 'publisher_product_teks_technology_standard save failed')
                  raise
              end
              
              publisher_product_teks_technology_standard = nil
          end
          
          publisher_product_teks_technology_standards_updated = PublisherProductTeksTechnologyStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_technology_standards = TeksTechnologyStandard.order(sort_column_teks_technology + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_technology_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_technology_standards_updated.nil?) and (!teks_technology_standards.nil?))      
              updated = nil
              a_teks_technology_standards = Array.new    
              teks_technology_standard = []
              teks_technology_standard_text = []
              if publisher_product_teks_technology_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_technology_standards_updated.each do |c|
                    teks_technology_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_technology_standards[i] = teks_technology_standards[ii].section_text
                    i += 1
                  end
                  teks_technology_standard_text = a_teks_technology_standards
                  updated = publisher_product_teks_technology_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_technology_standard => teks_technology_standard,
                                                :teks_technology_standard_text => teks_technology_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_technology_standard', :description => 'publisher_product_teks_technology_standards_updated or teks_technology_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_technology_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_career_dev_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_career_dev_standard = h_obj[:teks_career_dev_standard]
          
          if PublisherProductTeksCareerDevStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_dev_standard', :description => 'publisher_product_teks_career_dev_standard delete_record failed')
              raise
          end
      
          ar_teks_career_dev_standards = Array.new
          ar_teks_career_dev_standards = teks_career_dev_standard.split(',')
          
          ar_teks_career_dev_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_career_dev_standard = PublisherProductTeksCareerDevStandard.new(h_new)
              if publisher_product_teks_career_dev_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_dev_standard', :description => 'publisher_product_teks_career_dev_standard save failed')
                  raise
              end
              
              publisher_product_teks_career_dev_standard = nil
          end
          
          publisher_product_teks_career_dev_standards_updated = PublisherProductTeksCareerDevStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_career_dev_standards = TeksCareerDevStandard.order(sort_column_teks_career_dev + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_career_dev_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_career_dev_standards_updated.nil?) and (!teks_career_dev_standards.nil?))      
              updated = nil
              a_teks_career_dev_standards = Array.new    
              teks_career_dev_standard = []
              teks_career_dev_standard_text = []
              if publisher_product_teks_career_dev_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_career_dev_standards_updated.each do |c|
                    teks_career_dev_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_career_dev_standards[i] = teks_career_dev_standards[ii].section_text
                    i += 1
                  end
                  teks_career_dev_standard_text = a_teks_career_dev_standards
                  updated = publisher_product_teks_career_dev_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_career_dev_standard => teks_career_dev_standard,
                                                :teks_career_dev_standard_text => teks_career_dev_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_dev_standard', :description => 'publisher_product_teks_career_dev_standards_updated or teks_career_dev_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_dev_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_second_language_eng_span_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_second_language_eng_span_standard = h_obj[:teks_second_language_eng_span_standard]
          
          if PublisherProductTeksSecondLanguageEngSpanStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_second_language_eng_span_standard', :description => 'publisher_product_teks_second_language_eng_span_standard delete_record failed')
              raise
          end
      
          ar_teks_second_language_eng_span_standards = Array.new
          ar_teks_second_language_eng_span_standards = teks_second_language_eng_span_standard.split(',')
          
          ar_teks_second_language_eng_span_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_second_language_eng_span_standard = PublisherProductTeksSecondLanguageEngSpanStandard.new(h_new)
              if publisher_product_teks_second_language_eng_span_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_second_language_eng_span_standard', :description => 'publisher_product_teks_second_language_eng_span_standard save failed')
                  raise
              end
              
              publisher_product_teks_second_language_eng_span_standard = nil
          end
          
          publisher_product_teks_second_language_eng_span_standards_updated = PublisherProductTeksSecondLanguageEngSpanStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_second_language_eng_span_standards = TeksSecondLanguageEngSpanStandard.order(sort_column_teks_second_language_eng_span + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_second_language_eng_span_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_second_language_eng_span_standards_updated.nil?) and (!teks_second_language_eng_span_standards.nil?))      
              updated = nil
              a_teks_second_language_eng_span_standards = Array.new    
              teks_second_language_eng_span_standard = []
              teks_second_language_eng_span_standard_text = []
              if publisher_product_teks_second_language_eng_span_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_second_language_eng_span_standards_updated.each do |c|
                    teks_second_language_eng_span_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_second_language_eng_span_standards[i] = teks_second_language_eng_span_standards[ii].section_text
                    i += 1
                  end
                  teks_second_language_eng_span_standard_text = a_teks_second_language_eng_span_standards
                  updated = publisher_product_teks_second_language_eng_span_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_second_language_eng_span_standard => teks_second_language_eng_span_standard,
                                                :teks_second_language_eng_span_standard_text => teks_second_language_eng_span_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_second_language_eng_span_standard', :description => 'publisher_product_teks_second_language_eng_span_standards_updated or teks_second_language_eng_span_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_second_language_eng_span_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end



  def update_teks_career_tech_ed_standard

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
              h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          teks_career_tech_ed_standard = h_obj[:teks_career_tech_ed_standard]
          
          if PublisherProductTeksCareerTechEdStandard.delete_record(publisher_product_id.to_s)
              #
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_tech_ed_standard', :description => 'publisher_product_teks_career_tech_ed_standard delete_record failed')
              raise
          end
      
          ar_teks_career_tech_ed_standards = Array.new
          ar_teks_career_tech_ed_standards = teks_career_tech_ed_standard.split(',')
          
          ar_teks_career_tech_ed_standards.each do |i|
              h_new = Hash.new
              h_new[:publisher_id] = current_user.publisher.id
              h_new[:publisher_product_id] = publisher_product_id
              h_new[:id_standard] = i.to_i
              
              publisher_product_teks_career_tech_ed_standard = PublisherProductTeksCareerTechEdStandard.new(h_new)
              if publisher_product_teks_career_tech_ed_standard.save
                  #
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_tech_ed_standard', :description => 'publisher_product_teks_career_tech_ed_standard save failed')
                  raise
              end
              
              publisher_product_teks_career_tech_ed_standard = nil
          end
          
          publisher_product_teks_career_tech_ed_standards_updated = PublisherProductTeksCareerTechEdStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC") rescue nil
          teks_career_tech_ed_standards = TeksCareerTechEdStandard.order(sort_column_teks_career_tech_ed + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page]) rescue nil
          # date_0 = Time.zone.parse('2000-01-01 00:00:00')
          # publisher_product_teks_career_tech_ed_standard_updated.updated_at = date_0
          if ((!publisher_product_teks_career_tech_ed_standards_updated.nil?) and (!teks_career_tech_ed_standards.nil?))      
              updated = nil
              a_teks_career_tech_ed_standards = Array.new    
              teks_career_tech_ed_standard = []
              teks_career_tech_ed_standard_text = []
              if publisher_product_teks_career_tech_ed_standards_updated.any?
                  i = 0
                  ii = 0
                  publisher_product_teks_career_tech_ed_standards_updated.each do |c|
                    teks_career_tech_ed_standard[i] = c.id_standard
                    ii = c.id_standard - 1
                    a_teks_career_tech_ed_standards[i] = teks_career_tech_ed_standards[ii].section_text
                    i += 1
                  end
                  teks_career_tech_ed_standard_text = a_teks_career_tech_ed_standards
                  updated = publisher_product_teks_career_tech_ed_standards_updated[0].updated_at.to_s(:long)
              else
                #
              end
          
              respond_to do |format|
                format.html {}
                format.json { render :json => { :teks_career_tech_ed_standard => teks_career_tech_ed_standard,
                                                :teks_career_tech_ed_standard_text => teks_career_tech_ed_standard_text,
                                                :b_error => false,
                                                :updated => updated } }
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_tech_ed_standard', :description => 'publisher_product_teks_career_tech_ed_standards_updated or teks_career_tech_ed_standards was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_teks_career_tech_ed_standard', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end


  end


  # 122 english
  # 123 math              
  # 124 science
  # 125 social_studies
  # 126 languages_non_eng
  # 127 health_ed
  # 128 physical_ed
  # 129 fine_arts
  # 130 economics
  # 131 technology        
  # 132 career_dev
  # 133 second_language_eng_span        
  # 134 career_tech_ed



  def update_by_review

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          by_review = h_obj[:by_review]
          by_review_other = h_obj[:by_review_other]
          by_review_other_b = h_obj[:by_review_other_b]
          
          publisher_product_by_review = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_by_review rescue nil
          if !publisher_product_by_review.nil?
            
              ar_by_review = Array.new
              ar_by_review = by_review.split(',')
              len = ar_by_review.length
          
              h_update = Hash.new
              h_update[:by_review_1] = false
              h_update[:by_review_2] = false
              h_update[:by_review_other_b] = by_review_other_b
              h_update[:by_review_other] = by_review_other
              
              ar_by_review.each do |target|
                case target.to_s  
                  when "1"
                    h_update[:by_review_1] = true
                  when "2"
                    h_update[:by_review_2] = true
                  else
                    #        
                end
              end
            
              if publisher_product_by_review.update_attributes(h_update)
                  publisher_product_by_review = nil
                  publisher_product_by_review_updated = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first.publisher_product_by_review rescue nil              
                  if !publisher_product_by_review_updated.nil?
    
                      gon.by_review = []
                      
                      b_has_by_review = false
                      b_has_by_review_listing = false
                      a_by_reviews = Array.new
                      by_reviews = return_all_dtab7lets
                      by_reviews.each do |category_subj|
                        a_by_reviews.push(category_subj)
                      end
                      gon.by_review_text = []
                      b_required = true
                      
                      b_by_review_other = false
                      by_review_other = ""            
                      if publisher_product_by_review_updated.by_review_other_b
                          b_by_review_other = true
                          b_has_by_review_listing = true
                          by_review_other = publisher_product_by_review_updated.by_review_other
                      end
                      
                      if (publisher_product_by_review_updated.by_review_1 or
                          publisher_product_by_review_updated.by_review_2)
                  
                          b_has_by_review = true
                          b_has_by_review_listing = true
                          b_required = false
                          
                          b = publisher_product_by_review_updated.by_review_1
                          gon.by_review[0] = b
                          if b
                            gon.by_review_text.push(a_by_reviews[0].col_1)  
                          end        
                  
                          b = publisher_product_by_review_updated.by_review_2
                          gon.by_review[1] = b
                          if b
                            gon.by_review_text.push(a_by_reviews[1].col_1)  
                          end        
                      end
                  
                      respond_to do |format|
                        format.html {}
                        format.json { render :json => { :b_has_by_review => b_has_by_review,
                                                        :by_review => gon.by_review,
                                                        :by_review_other => by_review_other,
                                                        :has_by_review_other => b_by_review_other,
                                                        :b_has_by_review_listing => b_has_by_review_listing,
                                                        :by_review_text => gon.by_review_text,
                                                        :b_required => b_required,
                                                        :b_error => false,
                                                        :updated => publisher_product_by_review_updated.updated_at.to_s(:long) } }
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_by_review', :description => 'publisher_product_by_review_updated was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_by_review', :description => 'publisher_product_by_review update_attributes failed')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_by_review', :description => 'publisher_product_by_review was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_by_review', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end  



  # def update_core_math_standard
# 
      # ar = params[:publisher_product_manifest]
      # h_obj = Hash.new
      # ar.each do |obj|
        # h_obj = obj
      # end
#   
      # publisher_product_id = h_obj[:publisher_product_id]
      # core_math_standard = h_obj[:core_math_standard]
#       
      # PublisherProductCoreMathStandard.delete_record(publisher_product_id.to_s)
#   
      # ar_core_math_standards = Array.new
      # ar_core_math_standards = core_math_standard.split(',')
#       
      # ar_core_math_standards.each do |i|
        # h_new = Hash.new
        # h_new[:publisher_id] = current_user.publisher.id
        # h_new[:publisher_product_id] = publisher_product_id
        # h_new[:id_standard] = i.to_i
#         
        # publisher_product_core_math_standard = PublisherProductCoreMathStandard.new(h_new)
        # if publisher_product_core_math_standard.save
          # #
        # else
          # #
        # end
#         
        # publisher_product_core_math_standard = nil
      # end
#       
      # publisher_product_core_math_standards_updated = PublisherProductCoreMathStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC")
      # core_math_standards = CoreMathStandard.order(sort_column_core_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
      # # date_0 = Time.zone.parse('2000-01-01 00:00:00')
      # # publisher_product_core_math_standard_updated.updated_at = date_0
      # if ((!publisher_product_core_math_standards_updated.nil?) and (!core_math_standards.nil?))      
          # updated = nil
          # b_updated = false
          # a_core_math_standards = Array.new    
          # gon.core_math_standard = []
          # gon.core_math_standard_text = []
          # if publisher_product_core_math_standards_updated.any?
              # i = 0
              # ii = 0
              # publisher_product_core_math_standards_updated.each do |c|
                # gon.core_math_standard[i] = c.id_standard
                # ii = c.id_standard - 1
                # a_core_math_standards[i] = core_math_standards[ii].dot_not
                # i += 1
              # end
              # # gon.core_math_standard_text = a_core_math_standards.reverse!
              # gon.core_math_standard_text = a_core_math_standards
              # b_updated = true
              # updated = publisher_product_core_math_standards_updated[0].updated_at.to_s(:long)
          # else
            # #
          # end
#           
          # respond_to do |format|
            # format.html {}
            # format.json { render :json => { :g_core_math_standard => gon.core_math_standard,
                                            # :g_core_math_standard_text => gon.core_math_standard_text,
                                            # :b_updated => b_updated,
                                            # :updated => updated } }
          # end
      # else
          # respond_to do |format|
            # format.html {}
            # format.json { render :json => { :b_updated => false } }
          # end
      # end
# 
# 
  # end



  # def update_character
# 
    # ar = params[:publisher_product_manifest]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # # publisher_product_description_id = h_obj[:publisher_product_description_id]
    # character = h_obj[:character]
#     
    # ar_character = Array.new
    # ar_character = character.split(',')
    # len = ar_character.length
# 
    # h_update = Hash.new
    # h_update[:character_1] = false
    # h_update[:character_2] = false
    # h_update[:character_3] = false
    # h_update[:character_4] = false
    # h_update[:character_5] = false
    # h_update[:character_6] = false
    # h_update[:character_7] = false
    # h_update[:character_8] = false
    # h_update[:character_9] = false
    # h_update[:character_10] = false
#     
    # ar_character.each do |target|
#       
      # case target.to_s  
        # when "1"
          # h_update[:character_1] = true
        # when "2"
          # h_update[:character_2] = true
        # when "3"
          # h_update[:character_3] = true
        # when "4"
          # h_update[:character_4] = true
        # when "5"
          # h_update[:character_5] = true
        # when "6"
          # h_update[:character_6] = true
        # when "7"
          # h_update[:character_7] = true
        # when "8"
          # h_update[:character_8] = true
        # when "9"
          # h_update[:character_9] = true
        # when "10"
          # h_update[:character_10] = true
        # else
          # #        
      # end
#       
    # end
# 
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    # # h_update[:publisher_product_description_id] = publisher_product_description_id
# 
    # publisher_product_character = PublisherProductCharacter.where("publisher_product_id = ?", publisher_product_id).first
# 
    # if publisher_product_character.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_character_id = publisher_product_character.id
    # publisher_product_character = nil
    # publisher_product_character_updated = PublisherProductCharacter.find(publisher_product_character_id)
#     
    # gon.character = []
#     
    # gon.character[1] = publisher_product_character_updated.character_1
    # gon.character[2] = publisher_product_character_updated.character_2
    # gon.character[3] = publisher_product_character_updated.character_3
    # gon.character[4] = publisher_product_character_updated.character_4
    # gon.character[5] = publisher_product_character_updated.character_5
    # gon.character[6] = publisher_product_character_updated.character_6
    # gon.character[7] = publisher_product_character_updated.character_7
    # gon.character[8] = publisher_product_character_updated.character_8
    # gon.character[9] = publisher_product_character_updated.character_9
    # gon.character[10] = publisher_product_character_updated.character_10
# 
    # b_has_character = false
#     
    # if (publisher_product_character_updated.character_1 or
        # publisher_product_character_updated.character_2 or
        # publisher_product_character_updated.character_3 or
        # publisher_product_character_updated.character_4 or
        # publisher_product_character_updated.character_5 or
        # publisher_product_character_updated.character_6 or
        # publisher_product_character_updated.character_7 or
        # publisher_product_character_updated.character_8 or
        # publisher_product_character_updated.character_9 or
        # publisher_product_character_updated.character_10)
# 
        # b_has_character = true
    # end
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :b_has_character => b_has_character,
                                      # :g_updated => gon.character,
                                      # :updated => publisher_product_character_updated.updated_at.to_s(:long) } }
# 
      # # format.json { render :json => {} }
# 
    # end
#     
  # end  



  def update_description
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          description = h_obj[:description]
      
          b_description = false
          b_required = false
      
          # publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil    
          if !publisher_product.nil?
              publisher_product_description = publisher_product.publisher_product_description rescue nil
              if !publisher_product_description.nil?
                  h_update = Hash.new
                  h_update[:description_text] = description
                  if publisher_product_description.update_attributes(h_update)
                      publisher_product_description_updated = publisher_product.publisher_product_description rescue nil
                      if !publisher_product_description_updated.nil?
                          if !((publisher_product_description_updated.description_text.blank?) or (publisher_product_description_updated.description_text.empty?) or (publisher_product_description_updated.description_text.nil?))
                              publisher_product_description = publisher_product_description_updated 
                              b_description = true
                              b_required = false      
                          else
                              publisher_product_description = nil
                              b_description = false
                              b_required = false
                          end
                          
                          respond_to do |format|
                              format.html {}
                              format.json { render :json => { :description => description,
                                                              :b_description => b_description,
                                                              :b_required => b_required,  
                                                              :b_error => false,                                        
                                                              :updated => publisher_product_description.updated_at.to_s(:long) } }
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_description', :description => 'publisher_product_description_updated was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_description', :description => 'publisher_product_description update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_description', :description => 'publisher_product_description was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_description', :description => 'publisher_product was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_description', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def update_lesson_plan_subject
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          subject = h_obj[:subject]
      
          b_subject = false
          b_required = false
      
          # publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil    
          if !publisher_product.nil?
              publisher_product_subject = publisher_product.publisher_product_subject rescue nil
              if !publisher_product_subject.nil?
                  h_update = Hash.new
                  h_update[:subject_text] = subject
                  if publisher_product_subject.update_attributes(h_update)
                      publisher_product_subject_updated = publisher_product.publisher_product_subject rescue nil
                      if !publisher_product_subject_updated.nil?
                          if !((publisher_product_subject_updated.subject_text.blank?) or (publisher_product_subject_updated.subject_text.empty?) or (publisher_product_subject_updated.subject_text.nil?))
                              publisher_product_subject = publisher_product_subject_updated 
                              b_subject = true
                              b_required = false      
                          else
                              publisher_product_subject = nil
                              b_subject = false
                              b_required = false
                          end
                          
                          respond_to do |format|
                              format.html {}
                              format.json { render :json => { :subject => subject,
                                                              :b_subject => b_subject,
                                                              :b_required => b_required,  
                                                              :b_error => false,                                        
                                                              :updated => publisher_product_subject.updated_at.to_s(:long) } }
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_plan_subject', :description => 'publisher_product_subject_updated was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_plan_subject', :description => 'publisher_product_subject update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_plan_subject', :description => 'publisher_product_subject was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_plan_subject', :description => 'publisher_product was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_lesson_plan_subject', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def update_topic
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          topic = h_obj[:topic]
      
          b_topic = false
          b_required = false
      
          # publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              publisher_product_topic = publisher_product.publisher_product_topic rescue nil
              if !publisher_product_topic.nil?
                  h_update = Hash.new
                  h_update[:topic_text] = topic
                  if publisher_product_topic.update_attributes(h_update)
                      publisher_product_topic_updated = publisher_product.publisher_product_topic rescue nil
                      if !publisher_product_topic_updated.nil?
                          if !((publisher_product_topic_updated.topic_text.blank?) or (publisher_product_topic_updated.topic_text.empty?) or (publisher_product_topic_updated.topic_text.nil?))
                              publisher_product_topic = publisher_product_topic_updated 
                              b_topic = true
                              b_required = false      
                          else
                              publisher_product_topic = nil
                              b_topic = false
                              b_required = false
                          end
                          
                          respond_to do |format|
                              format.html {}
                              format.json { render :json => { :topic => topic,
                                                              :b_topic => b_topic,
                                                              :b_required => b_required,  
                                                              :b_error => false,                                        
                                                              :updated => publisher_product_topic.updated_at.to_s(:long) } }
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_topic', :description => 'publisher_product_topic_updated was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_topic', :description => 'publisher_product_topic update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_topic', :description => 'publisher_product_topic was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_topic', :description => 'publisher_product was nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_topic', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end

  
  
  def upload_pdf

      @errors = false
      
      begin
        
          @publisher_product_pdfs = nil
       
          publisher_product_id = params[:publisher_product_id]
          name_file = params[:name_file]    
          name_pdf = File.basename(name_file.original_filename, '.*').titleize if name_file
      
          if( (!publisher_product_id.nil?) and (!name_file.nil?) and (!name_pdf.nil?) )
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  h_pdf = Hash.new
                  h_pdf[:name_file] = name_file
                  h_pdf[:name_pdf] = name_pdf
                  h_pdf[:publisher_id] = current_user.publisher.id 
                  h_pdf[:publisher_product_id] = publisher_product_id 
                  # publisher_product_pdf = PublisherProductPdf.new
                  # publisher_product_pdf.name_file = uploaded_file
                  # publisher_product_pdf.name_pdf = name_pdf  
                  # publisher_product_pdf.publisher_id = current_user.publisher.id
                  # publisher_product_pdf.publisher_product_id = publisher_product_id
                  publisher_product_pdf = publisher_product.publisher_product_pdfs.build(h_pdf)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pdf.save
                
                          publisher_product_pdfs = publisher_product.publisher_product_pdfs rescue nil
                          
                          gon.name_pdf = []    
                          i = 0
                          publisher_product_pdfs.each do |pdf|
                              gon.name_pdf[i] = pdf.name_pdf
                              i += 1        
                          end
                          
                          pdf_image = MiniMagick::Image.open("public" + publisher_product_pdf.name_file.url)
                          
                          # Rails.logger.info("pdf_image_path = " + "public" + publisher_product_pdf.name_file.url)
                          # pdf_image_path = public/uploads/publisher_product_pdf/name_file/14/e78eb970-1cea-47be-8340-2a91af76841d.pdf
    
                          pdf_image.format("png", 0)
                          pdf_thumb = pdf_image.resize('200x270')
                          
                          # pdf_thumb = pdf_image.resize_to_limit(200, 300) #.scale(200, 270)
                          # new_image.resize('345x300')
                          
                          h_pdf_img = Hash.new
                          # h_pdf_img[:publisher_id] = current_user.publisher.id 
                          # h_pdf_img[:publisher_product_id] = publisher_product_id 
                          # h_pdf_img['publisher_product_manifest_id'] = publisher_product_manifest_id 
                          # h_pdf_img[:publisher_product_pdf_id] = publisher_product_pdf.id 
                  
                          # publisher_product_pdf_image = PublisherProductPdfImage.new(h_pdf_img)
                          publisher_product_pdf_image = publisher_product_pdf.build_publisher_product_pdf_image(h_pdf_img)
                          publisher_product_pdf_image.image = File.open("public/images_publisher_product_pdf_image/add_generic_publisher_product_pdf_image_w200_h270.png")
                          
                          if publisher_product_pdf_image.save
                              image_file = "public" + publisher_product_pdf_image.image_url
                              image = MiniMagick::Image.open(image_file)
                              FileUtils.rm_rf(image_file)
                              pdf_thumb.write image_file
                              @publisher_product_pdfs = publisher_product_pdfs.order(created_at: :asc)
    
                              gon.publisher_product_pdfs_count = 0
                              if !publisher_product_pdfs.nil?
                                  gon.publisher_product_pdfs_count = publisher_product_pdfs.count 
                              end

                              # image = Magick::Image.read("public" + publisher_product_pdf_image.image_url)[0]
                              # Rails.logger.info("image_file = " + image_file.to_s)
                              # image_file = public/uploads/publisher_product_pdf_image/image/13/c49164c5-8079-42e4-91c0-ce6ca347e413.png
                              # image = MiniMagick::Image.open("public" + publisher_product_pdf_image.image_url)
                              # img_name = File.basename(publisher_product_pdf_image.image_url)
                              # img_dir = "public" + File.dirname(publisher_product_pos4_image.image_url)
                              # Rails.logger.info(img_name)
                              # Rails.logger.info(img_dir)
                              # image_path = img_dir + "/" + img_name 
                              # FileUtils.rm_rf(image_path) 
                              # new_image.write image_345_300_path
                              # Rails.logger.info(image.details)
                              # Rails.logger.info(image.basename)
                              # Rails.logger.info(File.basename(image.to_s))
                              # Rails.logger.info(File.basename(publisher_product_pdf_image.image_url))
                              # Rails.logger.info(image.basename)
                              # image_filename = image.filename
                              # FileUtils.rm_rf(Dir.glob(image.filename))
                              # pdf_thumb.write image_filename
                              # @publisher_product_pdfs = publisher_product_pdfs
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf', :description => 'publisher_product_pdf_image save failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf', :description => 'publisher_product_pdf save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf', :description => 'request remotipart failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf', :description => 'upload_pdf_image params were nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf', :description => e.message.to_s)
          @errors = true
          
      end

    
  end

 
  # {
    # "Base filename"=>"mini_magick20150916-10819-cfh9ic.png", 
    # "Format"=>"PNG (Portable Network Graphics)", 
    # "Class"=>"PseudoClass", 
    # "Geometry"=>"1x1+0+0", 
    # "Resolution"=>"37.4x37.01", 
    # "Print size"=>"0.026738x0.0270197", 
    # "Units"=>"PixelsPerCentimeter", 
    # "Type"=>"Palette", 
    # "Endianess"=>"Undefined", 
    # "Colorspace"=>"sRGB", 
    # "Depth"=>"8-bit", 
    # "Channel depth"=>{
      # "red"=>"8-bit", 
      # "green"=>"8-bit", 
      # "blue"=>"4-bit"
    # }, 
    # "Channel statistics"=>{
      # "Red"=>{
        # "min"=>"142 (0.556863)", 
        # "max"=>"142 (0.556863)", 
        # "mean"=>"142 (0.556863)", 
        # "standard deviation"=>"0 (0)", 
        # "kurtosis"=>"0", 
        # "skewness"=>"0"
      # }, 
      # "Green"=>{
        # "min"=>"179 (0.701961)", 
        # "max"=>"179 (0.701961)", 
        # "mean"=>"179 (0.701961)", 
        # "standard deviation"=>"0 (0)", 
        # "kurtosis"=>"0", 
        # "skewness"=>"0"
      # }, 
      # "Blue"=>{
        # "min"=>"136 (0.533333)", 
        # "max"=>"136 (0.533333)", 
        # "mean"=>"136 (0.533333)", 
        # "standard deviation"=>"0 (0)", 
        # "kurtosis"=>"0", 
        # "skewness"=>"0"
      # }
    # }, 
    # "Image statistics"=>{
      # "Overall"=>{
        # "min"=>"136 (0.533333)", 
        # "max"=>"179 (0.701961)", 
        # "mean"=>"152.333 (0.597386)", 
        # "standard deviation"=>"0 (0)", 
        # "kurtosis"=>"0", "skewness"=>"0"
      # }
    # }, 
    # "Colors"=>"1", 
    # "Histogram"=>{
      # "1"=>"(142,179,136) #8EB388 srgb(142,179,136)"
    # }, 
    # "Colormap"=>"2", 
    # "0"=>"(142,179,136) #8EB388 srgb(142,179,136)", 
    # "1"=>"(255,255,255) #FFFFFF white", 
    # "Rendering intent"=>"Perceptual", 
    # "Gamma"=>"0.45455", 
    # "Chromaticity"=>{
      # "red primary"=>"(0.64,0.33)", 
      # "green primary"=>"(0.3,0.6)", 
      # "blue primary"=>"(0.15,0.06)", 
      # "white point"=>"(0.3127,0.329)"
    # }, 
    # "Interlace"=>"None", 
    # "Background color"=>"white", 
    # "Border color"=>"srgb(223,223,223)", 
    # "Matte color"=>"grey74", 
    # "Transparent color"=>"black", 
    # "Compose"=>"Over", 
    # "Page geometry"=>"1x1+0+0", 
    # "Dispose"=>"Undefined", 
    # "Iterations"=>"0", 
    # "Compression"=>"Zip", 
    # "Orientation"=>"Undefined", 
    # "Properties"=>{
      # "date:create"=>"2015-09-16T12:46:48+03:00", 
      # "date:modify"=>"2015-09-16T12:46:48+03:00", 
      # "png:bKGD"=>"chunk was found (see Background color, above)", 
      # "png:cHRM"=>"chunk was found (see Chromaticity, above)", 
      # "png:gAMA"=>"gamma=0.45454544 (See Gamma, above)", 
      # "png:IHDR.bit_depth"=>"8", 
      # "png:IHDR.color_type"=>"3 (Indexed)", 
      # "png:IHDR.interlace_method"=>"0 (Not interlaced)", 
      # "png:IHDR.width,height"=>"1, 1", 
      # "png:pHYs"=>"x_res=3740, y_res=3701, units=1", 
      # "png:PLTE.number_colors"=>"2", 
      # "png:sRGB"=>"intent=0 (See Rendering intent)", 
      # "png:text"=>"2 tEXt/zTXt/iTXt chunks were found", 
      # "signature"=>"d1c56acb42755bbec56ebbbb6041fb5b46e23cb5e31cbcbf07f7cc50a040de38"
    # }, 
    # "Artifacts"=>{
      # "filename"=>"/tmp/mini_magick20150916-10819-cfh9ic.png[0]", 
      # "verbose"=>"true"
    # }, 
    # "Tainted"=>"False", 
    # "Filesize"=>"290B", 
    # "Number pixels"=>"1", 
    # "Pixels per second"=>"100B", 
    # "User time"=>"0.000u", 
    # "Elapsed time"=>"0:01.009", 
    # "Version"=>"ImageMagick 6.7.7-10 2014-03-06 Q16 http://www.imagemagick.org"
  # }
 

  def update_name_pdf
    
      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
      
          publisher_product_id = h_obj[:publisher_product_id]
          publisher_product_pdf_id = h_obj[:publisher_product_pdf_id]
          name_pdf = h_obj[:name_pdf]
          n_name = h_obj[:n_name]
      
          b_name_pdf = false
          b_required = true
          publisher_product_pdf_name_pdf = "PDF Name"
            
          if( !((publisher_product_id.nil?) or (publisher_product_pdf_id.nil?) or (name_pdf.nil?) or (n_name.nil?)) )
            
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                    publisher_product_pdf = publisher_product.publisher_product_pdfs.where("id = ?", publisher_product_pdf_id).first rescue nil
                  if !publisher_product_pdf.nil?
                      h_update = Hash.new
                      h_update[:name_pdf] = name_pdf
                      if publisher_product_pdf.update_attributes(h_update)
                          publisher_product_pdf = nil
                          publisher_product_pdf_updated = publisher_product.publisher_product_pdfs.where("id = ?", publisher_product_pdf_id).first rescue nil
                          if !publisher_product_pdf_updated.nil?
                              if !((publisher_product_pdf_updated.name_pdf.blank?) or (publisher_product_pdf_updated.name_pdf.empty?) or (publisher_product_pdf_updated.name_pdf.nil?)) 
                                  publisher_product_pdf_name_pdf = publisher_product_pdf_updated.name_pdf
                                  b_name_pdf = true
                                  b_required = false      
                              end
                              
                              respond_to do |format|
                                format.html {}
                                format.json { render :json => { :b_name_pdf => b_name_pdf, 
                                                                :name_pdf => publisher_product_pdf_name_pdf,
                                                                :n_name => n_name,
                                                                :b_required => b_required,
                                                                :publisher_product_pdf_id => publisher_product_pdf_id,  
                                                                :b_error => false,                                    
                                                                :updated => publisher_product_pdf_updated.updated_at.to_s(:long) } }
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_name_pdf', :description => 'publisher_product_pdf_updated was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_name_pdf', :description => 'publisher_product_pdf update_attributes failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_name_pdf', :description => 'publisher_product_pdf was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_name_pdf', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_name_pdf', :description => 'update_name_pdf params were nil')
              raise
          end

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'update_name_pdf', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_pdf_image
   
      @errors = false
      
      begin
        
          @publisher_product_pdfs = nil
          
          image = params[:publisher_product_pdf_image][:image]
          publisher_product_id = params[:publisher_product_id]
          publisher_product_pdf_id = params[:publisher_product_pdf_id]
          
          # Rails.logger.info("publisher_product_id = " + publisher_product_id.to_s)
          # Rails.logger.info("publisher_product_pdf_id = " + publisher_product_pdf_id.to_s)
          # Rails.logger.info("image = " + image.to_s)
          
          # if( !((image.nil?) or (publisher_product_id.nil?) or (publisher_product_pdf_id.nil?)) )
          # if( !((publisher_product_id.nil?) or (publisher_product_pdf_id.nil?)) )
          if !publisher_product_id.nil? 
              if !publisher_product_pdf_id.nil? 
                  if !image.nil?
                      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      if !publisher_product.nil?
                          publisher_product_pdf = publisher_product.publisher_product_pdfs.where("id = ?", publisher_product_pdf_id).first rescue nil
                          if !publisher_product_pdf.nil?
                              h_pdf = Hash.new
                              h_pdf[:image] = image
                              # h_pdf[:publisher_id] = current_user.publisher.id
                              # h_pdf[:publisher_product_id] = publisher_product_id
                              # h_pdf[:publisher_product_pdf_id] = publisher_product_pdf_id
                              # publisher_product_pdf_image = PublisherProductPdfImage.new(h_pdf)
                              publisher_product_pdf_image = publisher_product_pdf.build_publisher_product_pdf_image(h_pdf)
                              if request.xhr? || remotipart_submitted?
                                  if publisher_product_pdf_image.save
                                      # Rails.logger.info("publisher_product_pdf_image save successful")
                                      @publisher_product_pdfs = publisher_product.publisher_product_pdfs.order(created_at: :asc) rescue nil
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'publisher_product_pdf_image save failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'remotipart request failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'publisher_product_pdf was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'publisher_product was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'publisher_product_pdf_id was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_pdf_image_change

      @errors = false
      
      begin
           
          @publisher_product_pdfs = nil
          
          image = params[:publisher_product_pdf_image][:image]      
          publisher_product_id = params[:publisher_product_id]
          publisher_product_pdf_id = params[:publisher_product_pdf_id]
          # image = params[:image]
          
          if !publisher_product_id.nil? 
              if !publisher_product_pdf_id.nil? 
                  if !image.nil?
                      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      if !publisher_product.nil?
                          publisher_product_pdf = publisher_product.publisher_product_pdfs.where("id = ?", publisher_product_pdf_id).first rescue nil
                          if !publisher_product_pdf.nil?
                              publisher_product_pdf_image = publisher_product_pdf.publisher_product_pdf_image
                              if !publisher_product_pdf_image.nil?
                                  if publisher_product_pdf_image.destroy
                                      #
                                  else
                                      Rails.logger.info("publisher_product_pdf_image destroy failed")
                                  end
                              end
            
                              h_pdf = Hash.new
                              h_pdf[:image] = image
                              # publisher_product_pdf_image_new = publisher_product_pdf.publisher_product_pdf_image.build(h_pdf)
                              publisher_product_pdf_image_new = publisher_product_pdf.build_publisher_product_pdf_image(h_pdf)
                              # publisher_product_pdf_image = PublisherProductPdfImage.new(h_pdf)
                              if request.xhr? || remotipart_submitted?
                                  if publisher_product_pdf_image_new.save
                                      @publisher_product_pdfs = publisher_product.publisher_product_pdfs.order(created_at: :asc) rescue nil
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image', :description => 'publisher_product_pdf_image save failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => 'remotipart request failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => 'publisher_product_pdf was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => 'publisher_product was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => 'image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => 'publisher_product_pdf_id was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_pdf_image_change', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def destroy_pdf

      begin
                
          @publisher_product_pdfs = nil
          
          publisher_product_pdf_id = params[:publisher_product_pdf_id]
          publisher_product_id = params[:publisher_product_id]
          
          if !publisher_product_id.nil?
              if !publisher_product_pdf_id.nil?
                  publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                  if !publisher_product.nil?
                      publisher_product_pdf = publisher_product.publisher_product_pdfs.where("id = ?", publisher_product_pdf_id).first rescue nil
                      if !publisher_product_pdf.nil?
                          publisher_product_pdf_image = publisher_product_pdf.publisher_product_pdf_image
                          if !publisher_product_pdf_image.nil?
                              if publisher_product_pdf_image.destroy
                                  if publisher_product_pdf.destroy
                                      publisher_product_pdfs = publisher_product.publisher_product_pdfs.order(created_at: :asc) rescue nil
                                      @publisher_product_pdfs = publisher_product_pdfs
                                      publisher_product_pdfs_count = 0
                                      if !publisher_product_pdfs.nil?
                                          publisher_product_pdfs_count = publisher_product_pdfs.count  
                                      end
                                      respond_to do |format|
                                          format.html {}
                                          format.json { render :json => { :b_error => false, :publisher_product_pdfs_count => publisher_product_pdfs_count } }
                                      end
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product_pdf destroy failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product_pdf_image destroy failed')
                                  raise
                              end
                          else
                              if publisher_product_pdf.destroy
                                  @publisher_product_pdfs = publisher_product.publisher_product_pdfs.order(created_at: :asc) rescue nil
                                  respond_to do |format|
                                      format.html {}
                                      format.json { render :json => { :b_error => false } }
                                  end                                  
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product_pdf destroy failed')
                                  raise
                              end
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product_pdf was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product_pdf_id passed was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => 'publisher_product_id passed was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

      
  end



  def destroy_pdf_image

      begin
                
          @publisher_product_pdfs = nil
          
          publisher_product_pdf_id = params[:publisher_product_pdf_id]
          publisher_product_id = params[:publisher_product_id]
          
          if !publisher_product_id.nil?
              if !publisher_product_pdf_id.nil?
                  publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                  if !publisher_product.nil?
                      publisher_product_pdf = publisher_product.publisher_product_pdfs.where("id = ?", publisher_product_pdf_id).first rescue nil
                      if !publisher_product_pdf.nil?
                          publisher_product_pdf_image = publisher_product_pdf.publisher_product_pdf_image
                          if !publisher_product_pdf_image.nil?
                              if publisher_product_pdf_image.destroy
                                  @publisher_product_pdfs = publisher_product.publisher_product_pdfs.order(created_at: :asc) rescue nil
                                  respond_to do |format|
                                      format.html {}
                                      format.json { render :json => { :b_error => false } }
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => 'publisher_product_pdf_image destroy failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => 'publisher_product_pdf_image was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => 'publisher_product_pdf was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => 'publisher_product was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => 'publisher_product_pdf_id passed was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => 'publisher_product_id passed was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_pdf_image', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_image_1

      @errors = false
      
      begin
           
          @image_1_id = nil
          @image_1 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos1_image][:publisher_product_id]
          # publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
          
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  h_image = Hash.new
                  h_image[:image] = params[:publisher_product_pos1_image][:image]
                  h_image[:publisher_product_id] = publisher_product.id
                  h_image[:publisher_id] = current_user.publisher.id
                  h_image[:user_id] = current_user.id
                  h_image[:crop_x] = @crop_x
                  h_image[:crop_y] = @crop_y
                  h_image[:crop_w] = @crop_w
                  h_image[:crop_h] = @crop_h
                  publisher_product_pos1_image = PublisherProductPos1Image.new(h_image)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pos1_image.save
                          img = publisher_product_pos1_image
                          image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                          w = image.width
                          h = image.height
                          w_max = false
                          h_max = false
                          w_h_equal = false
                          x = 0
                          y = 0
                          l = 0                    
                          d = 0
                          if ( w == h)
                              w_h_equal = true
                          else
                              if ( w > h )
                                w_max = true
                              else
                                h_max = true
                              end
                          end
                          if w_max
                              d = w - h
                              d = (d/2).round
                              x = d
                              l = h  
                          end
                          if h_max
                              d = h - w
                              d = (d/2).round
                              y = d
                              l = w  
                          end
                          if w_h_equal
                              l = w
                          end
          
                          h_update = Hash.new
                          h_update[:crop_x] = x
                          h_update[:crop_y] = y
                          h_update[:crop_w] = l
                          h_update[:crop_h] = l
                          if publisher_product_pos1_image.update_attributes(h_update)
                              @image_1_id = publisher_product_pos1_image.id      
                              @image_1 = publisher_product_pos1_image
                              @publisher_product = publisher_product_pos1_image.publisher_product
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1', :description => 'publisher_product_pos1_image updated_attributes failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1', :description => 'publisher_product_pos1_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1', :description => 'request remotipart failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_image_1_change

      @errors = false

      begin
        
          @image_1_id = nil
          @image_1 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos1_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos1_image = publisher_product.publisher_product_pos1_image rescue nil
                  if !publisher_product_pos1_image.nil?
                      if publisher_product_pos1_image.destroy
                          h_image = Hash.new
                          h_image[:image] = params[:publisher_product_pos1_image][:image]
                          h_image[:publisher_product_id] = publisher_product.id
                          h_image[:publisher_id] = current_user.publisher.id
                          h_image[:user_id] = current_user.id
                          h_image[:crop_x] = @crop_x
                          h_image[:crop_y] = @crop_y
                          h_image[:crop_w] = @crop_w
                          h_image[:crop_h] = @crop_h
                          publisher_product_pos1_image = PublisherProductPos1Image.new(h_image)
                          if request.xhr? || remotipart_submitted?
                              if publisher_product_pos1_image.save
                                  img = publisher_product_pos1_image
                                  image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                                  w = image.width
                                  h = image.height
                                  w_max = false
                                  h_max = false
                                  w_h_equal = false
                                  x = 0
                                  y = 0
                                  l = 0                    
                                  d = 0
                                  if ( w == h)
                                      w_h_equal = true
                                  else
                                      if ( w > h )
                                        w_max = true
                                      else
                                        h_max = true
                                      end
                                  end
                                  if w_max
                                      d = w - h
                                      d = (d/2).round
                                      x = d
                                      l = h  
                                  end
                                  if h_max
                                      d = h - w
                                      d = (d/2).round
                                      y = d
                                      l = w  
                                  end
                                  if w_h_equal
                                      l = w
                                  end
                  
                                  h_update = Hash.new
                                  h_update[:crop_x] = x
                                  h_update[:crop_y] = y
                                  h_update[:crop_w] = l
                                  h_update[:crop_h] = l
                                  if publisher_product_pos1_image.update_attributes(h_update)
                                      @image_1_id = publisher_product_pos1_image.id      
                                      @image_1 = publisher_product_pos1_image
                                      @publisher_product = publisher_product_pos1_image.publisher_product
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'publisher_product_pos1_image updated_attributes failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'publisher_product_pos1_image save failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'request remotipart failed')
                              raise
                          end
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'publisher_product_pos1_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'publisher_product_pos1_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => 'publisher_product_id was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_1_change', :description => e.message.to_s)
          @errors = true
          
      end
        
    
  end



  def crop_image_1
    
      @errors = false
      
      begin
        
          @image_1 = nil    
          @image_1_id = nil      
          @publisher_product = nil
          
          # x = params[:crop_x]
          # y = params[:crop_y]
          # w = params[:crop_w]
          # h = params[:crop_h]
          
          publisher_product_id = params[:publisher_product_id]
      
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              Rails.logger.info "publisher_product was found"
              publisher_product_pos1_image = publisher_product.publisher_product_pos1_image rescue nil
              if !publisher_product_pos1_image.nil?
    
                  # img = publisher_product_pos1_image
                  # image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
    
                  image = MiniMagick::Image.open("public" + publisher_product_pos1_image.image_url(:image_600_600))
              
                  crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
                  new_image = image.crop(crop_params)
                  
                  # img_name = File.basename(img.image.to_s)
                  # img_dir = "public" + File.dirname(img.image.to_s)
    
                  img_name = File.basename(publisher_product_pos1_image.image.to_s)
                  img_dir = "public" + File.dirname(publisher_product_pos1_image.image.to_s)
            
                  image_375_300_path = img_dir + "/" + "image_375_300_" + img_name 
                  image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
                  image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
            
                  FileUtils.rm_rf(image_375_300_path) 
                  FileUtils.rm_rf(image_200_200_path) 
                  FileUtils.rm_rf(image_100_100_path) 
            
                  new_image.resize('375x300')
                  new_image.write image_375_300_path
                  new_image.resize('200x200')
                  new_image.write image_200_200_path
                  new_image.resize('100x100')
                  new_image.write image_100_100_path      
            
                  x = params[:crop_x]
                  y = params[:crop_y]
                  w = params[:crop_w]
                  h = params[:crop_h]
                  x = x.to_i
                  y = y.to_i
                  w = w.to_i
                  h = h.to_i
            
                  h_crop = Hash.new
                  h_crop[:crop_x] = x
                  h_crop[:crop_y] = y
                  h_crop[:crop_w] = w
                  h_crop[:crop_h] = h
              
                  # x = x.to_i
                  # y = y.to_i
                  # w = w.to_i
                  # h = h.to_i
                  # image_new = image.crop(x, y, w, h)
                  # new_image_200_200 = image_new.resize_to_fill(200, 200)    
                  # new_image_100_100 = image_new.resize_to_fill(100, 100)    
                  # # new_image_50_50 = image_new.resize_to_fill(50, 50)
                  # # new_image_34_34 = image_new.resize_to_fill(34, 34)
                  # image_200_200 = Magick::Image.read("public" + img.image_url(:image_200_200))[0]    
                  # image_100_100 = Magick::Image.read("public" + img.image_url(:image_100_100))[0]
                  # # image_50_50 = Magick::Image.read("public" + img.image_url(:image_50_50))[0]
                  # # image_34_34 = Magick::Image.read("public" + img.image_url(:image_34_34))[0]
                  # image_200_200_filename = image_200_200.filename
                  # image_100_100_filename = image_100_100.filename
                  # # image_50_50_filename = image_50_50.filename
                  # # image_34_34_filename = image_34_34.filename
                  # FileUtils.rm_rf(Dir.glob(image_200_200.filename))
                  # FileUtils.rm_rf(Dir.glob(image_100_100.filename))
                  # # FileUtils.rm_rf(Dir.glob(image_50_50.filename))
                  # # FileUtils.rm_rf(Dir.glob(image_34_34.filename))
                  # new_image_200_200.write image_200_200_filename
                  # new_image_100_100.write image_100_100_filename
                  # # new_image_50_50.write image_50_50_filename
                  # # new_image_34_34.write image_34_34_filename
                  # h_crop = Hash.new
                  # h_crop[:crop_x] = x
                  # h_crop[:crop_y] = y
                  # h_crop[:crop_w] = w
                  # h_crop[:crop_h] = h
            
                  if publisher_product_pos1_image.update_attributes(h_crop)
                      @image_1_id = publisher_product_pos1_image.id      
                      @image_1 = publisher_product_pos1_image
                      # @publisher_product = publisher_product_pos1_image.publisher_product
                      @publisher_product = publisher_product
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_1', :description => 'publisher_product_pos1_image update_attributes failed')
                      raise
                  end
                  
                  # publisher_product_pos1_image_updated = publisher_product.publisher_product_pos1_image rescue nil
                  # if !publisher_product_pos1_image_updated.nil?
                      # @image_1_id = publisher_product_pos1_image_updated.id      
                      # @image_1 = publisher_product_pos1_image_updated
                      # @publisher_product = publisher_product_pos1_image_updated.publisher_product
                  # else
                      # #
                  # end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_1', :description => 'publisher_product_pos1_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_1', :description => 'publisher_product_id was nil')
              raise
          end      

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_1', :description => e.message.to_s)
          @errors = true
          
      end
  
    
  end



  def destroy_image_1

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          @image_1 = nil
          @publisher_product = nil
          
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos1_image = publisher_product.publisher_product_pos1_image rescue nil
                  if !publisher_product_pos1_image.nil?
                      if publisher_product_pos1_image.destroy
                          @publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_1', :description => 'publisher_product_pos1_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_1', :description => 'publisher_product_pos1_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_1', :description => 'publisher_product was nil')
                  raise
              end
          else
              Rails.logger.info("publisher_product_id was nil")
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_1', :description => 'publisher_product_id was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_1', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_image_2

      @errors = false
      
      begin
           
          @image_2_id = nil
          @image_2 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos2_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  h_image = Hash.new
                  h_image[:image] = params[:publisher_product_pos2_image][:image]
                  h_image[:publisher_product_id] = publisher_product.id
                  h_image[:publisher_id] = current_user.publisher.id
                  h_image[:user_id] = current_user.id
                  h_image[:crop_x] = @crop_x
                  h_image[:crop_y] = @crop_y
                  h_image[:crop_w] = @crop_w
                  h_image[:crop_h] = @crop_h
                  publisher_product_pos2_image = PublisherProductPos2Image.new(h_image)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pos2_image.save
                          img = publisher_product_pos2_image
                          image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                          w = image.width
                          h = image.height
                          w_max = false
                          h_max = false
                          w_h_equal = false
                          x = 0
                          y = 0
                          l = 0                    
                          d = 0
                          if ( w == h)
                              w_h_equal = true
                          else
                              if ( w > h )
                                w_max = true
                              else
                                h_max = true
                              end
                          end
                          if w_max
                              d = w - h
                              d = (d/2).round
                              x = d
                              l = h  
                          end
                          if h_max
                              d = h - w
                              d = (d/2).round
                              y = d
                              l = w  
                          end
                          if w_h_equal
                              l = w
                          end
          
                          h_update = Hash.new
                          h_update[:crop_x] = x
                          h_update[:crop_y] = y
                          h_update[:crop_w] = l
                          h_update[:crop_h] = l
                          if publisher_product_pos2_image.update_attributes(h_update)
                              @image_2_id = publisher_product_pos2_image.id      
                              @image_2 = publisher_product_pos2_image
                              @publisher_product = publisher_product_pos2_image.publisher_product
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2', :description => 'publisher_product_pos2_image updated_attributes failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2', :description => 'publisher_product_pos2_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2', :description => 'request remotipart failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_image_2_change

      @errors = false

      begin
        
          @image_2_id = nil
          @image_2 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos2_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos2_image = publisher_product.publisher_product_pos2_image rescue nil
                  if !publisher_product_pos2_image.nil?
                      if publisher_product_pos2_image.destroy
                          h_image = Hash.new
                          h_image[:image] = params[:publisher_product_pos2_image][:image]
                          h_image[:publisher_product_id] = publisher_product.id
                          h_image[:publisher_id] = current_user.publisher.id
                          h_image[:user_id] = current_user.id
                          h_image[:crop_x] = @crop_x
                          h_image[:crop_y] = @crop_y
                          h_image[:crop_w] = @crop_w
                          h_image[:crop_h] = @crop_h
                          publisher_product_pos2_image = PublisherProductPos2Image.new(h_image)
                          if request.xhr? || remotipart_submitted?
                              if publisher_product_pos2_image.save
                                  img = publisher_product_pos2_image
                                  image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                                  w = image.width
                                  h = image.height
                                  w_max = false
                                  h_max = false
                                  w_h_equal = false
                                  x = 0
                                  y = 0
                                  l = 0                    
                                  d = 0
                                  if ( w == h)
                                      w_h_equal = true
                                  else
                                      if ( w > h )
                                        w_max = true
                                      else
                                        h_max = true
                                      end
                                  end
                                  if w_max
                                      d = w - h
                                      d = (d/2).round
                                      x = d
                                      l = h  
                                  end
                                  if h_max
                                      d = h - w
                                      d = (d/2).round
                                      y = d
                                      l = w  
                                  end
                                  if w_h_equal
                                      l = w
                                  end
                  
                                  h_update = Hash.new
                                  h_update[:crop_x] = x
                                  h_update[:crop_y] = y
                                  h_update[:crop_w] = l
                                  h_update[:crop_h] = l
                                  if publisher_product_pos2_image.update_attributes(h_update)
                                      @image_2_id = publisher_product_pos2_image.id      
                                      @image_2 = publisher_product_pos2_image
                                      @publisher_product = publisher_product_pos2_image.publisher_product
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'publisher_product_pos2_image updated_attributes failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'publisher_product_pos2_image save failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'request remotipart failed')
                              raise
                          end
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'publisher_product_pos2_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'publisher_product_pos2_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => 'publisher_product_id was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_2_change', :description => e.message.to_s)
          @errors = true
          
      end
        
    
  end



  def crop_image_2
    
      @errors = false
      
      begin
        
          @image_2 = nil    
          @image_2_id = nil      
          @publisher_product = nil
          
          # x = params[:crop_x]
          # y = params[:crop_y]
          # w = params[:crop_w]
          # h = params[:crop_h]
          
          publisher_product_id = params[:publisher_product_id]
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              Rails.logger.info "publisher_product was found"
              publisher_product_pos2_image = publisher_product.publisher_product_pos2_image rescue nil
              if !publisher_product_pos2_image.nil?
                  image = MiniMagick::Image.open("public" + publisher_product_pos2_image.image_url(:image_600_600))
                  crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
                  new_image = image.crop(crop_params)
                  img_name = File.basename(publisher_product_pos2_image.image.to_s)
                  img_dir = "public" + File.dirname(publisher_product_pos2_image.image.to_s)
            
                  image_375_300_path = img_dir + "/" + "image_375_300_" + img_name 
                  image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
                  image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
            
                  FileUtils.rm_rf(image_375_300_path) 
                  FileUtils.rm_rf(image_200_200_path) 
                  FileUtils.rm_rf(image_100_100_path) 
            
                  new_image.resize('375x300')
                  new_image.write image_375_300_path
                  new_image.resize('200x200')
                  new_image.write image_200_200_path
                  new_image.resize('100x100')
                  new_image.write image_100_100_path      
            
                  x = params[:crop_x]
                  y = params[:crop_y]
                  w = params[:crop_w]
                  h = params[:crop_h]
                  x = x.to_i
                  y = y.to_i
                  w = w.to_i
                  h = h.to_i
            
                  h_crop = Hash.new
                  h_crop[:crop_x] = x
                  h_crop[:crop_y] = y
                  h_crop[:crop_w] = w
                  h_crop[:crop_h] = h
              
                  if publisher_product_pos2_image.update_attributes(h_crop)
                      @image_2_id = publisher_product_pos2_image.id      
                      @image_2 = publisher_product_pos2_image
                      @publisher_product = publisher_product
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_2', :description => 'publisher_product_pos2_image update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_2', :description => 'publisher_product_pos2_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_2', :description => 'publisher_product_id was nil')
              raise
          end      

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_2', :description => e.message.to_s)
          @errors = true
          
      end
  
    
  end



  def destroy_image_2

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          @image_2 = nil
          @publisher_product = nil
          
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos2_image = publisher_product.publisher_product_pos2_image rescue nil
                  if !publisher_product_pos2_image.nil?
                      if publisher_product_pos2_image.destroy
                          @publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_2', :description => 'publisher_product_pos2_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_2', :description => 'publisher_product_pos2_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_2', :description => 'publisher_product was nil')
                  raise
              end
          else
              Rails.logger.info("publisher_product_id was nil")
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_2', :description => 'publisher_product_id was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_2', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_image_3

      @errors = false
      
      begin
           
          @image_3_id = nil
          @image_3 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos3_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  h_image = Hash.new
                  h_image[:image] = params[:publisher_product_pos3_image][:image]
                  h_image[:publisher_product_id] = publisher_product.id
                  h_image[:publisher_id] = current_user.publisher.id
                  h_image[:user_id] = current_user.id
                  h_image[:crop_x] = @crop_x
                  h_image[:crop_y] = @crop_y
                  h_image[:crop_w] = @crop_w
                  h_image[:crop_h] = @crop_h
                  publisher_product_pos3_image = PublisherProductPos3Image.new(h_image)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pos3_image.save
                          img = publisher_product_pos3_image
                          image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                          w = image.width
                          h = image.height
                          w_max = false
                          h_max = false
                          w_h_equal = false
                          x = 0
                          y = 0
                          l = 0                    
                          d = 0
                          if ( w == h)
                              w_h_equal = true
                          else
                              if ( w > h )
                                w_max = true
                              else
                                h_max = true
                              end
                          end
                          if w_max
                              d = w - h
                              d = (d/2).round
                              x = d
                              l = h  
                          end
                          if h_max
                              d = h - w
                              d = (d/2).round
                              y = d
                              l = w  
                          end
                          if w_h_equal
                              l = w
                          end
          
                          h_update = Hash.new
                          h_update[:crop_x] = x
                          h_update[:crop_y] = y
                          h_update[:crop_w] = l
                          h_update[:crop_h] = l
                          if publisher_product_pos3_image.update_attributes(h_update)
                              @image_3_id = publisher_product_pos3_image.id      
                              @image_3 = publisher_product_pos3_image
                              @publisher_product = publisher_product_pos3_image.publisher_product
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3', :description => 'publisher_product_pos3_image updated_attributes failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3', :description => 'publisher_product_pos3_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3', :description => 'request remotipart failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_image_3_change

      @errors = false

      begin
        
          @image_3_id = nil
          @image_3 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos3_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos3_image = publisher_product.publisher_product_pos3_image rescue nil
                  if !publisher_product_pos3_image.nil?
                      if publisher_product_pos3_image.destroy
                          h_image = Hash.new
                          h_image[:image] = params[:publisher_product_pos3_image][:image]
                          h_image[:publisher_product_id] = publisher_product.id
                          h_image[:publisher_id] = current_user.publisher.id
                          h_image[:user_id] = current_user.id
                          h_image[:crop_x] = @crop_x
                          h_image[:crop_y] = @crop_y
                          h_image[:crop_w] = @crop_w
                          h_image[:crop_h] = @crop_h
                          publisher_product_pos3_image = PublisherProductPos3Image.new(h_image)
                          if request.xhr? || remotipart_submitted?
                              if publisher_product_pos3_image.save
                                  img = publisher_product_pos3_image
                                  image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                                  w = image.width
                                  h = image.height
                                  w_max = false
                                  h_max = false
                                  w_h_equal = false
                                  x = 0
                                  y = 0
                                  l = 0                    
                                  d = 0
                                  if ( w == h)
                                      w_h_equal = true
                                  else
                                      if ( w > h )
                                        w_max = true
                                      else
                                        h_max = true
                                      end
                                  end
                                  if w_max
                                      d = w - h
                                      d = (d/2).round
                                      x = d
                                      l = h  
                                  end
                                  if h_max
                                      d = h - w
                                      d = (d/2).round
                                      y = d
                                      l = w  
                                  end
                                  if w_h_equal
                                      l = w
                                  end
                  
                                  h_update = Hash.new
                                  h_update[:crop_x] = x
                                  h_update[:crop_y] = y
                                  h_update[:crop_w] = l
                                  h_update[:crop_h] = l
                                  if publisher_product_pos3_image.update_attributes(h_update)
                                      @image_3_id = publisher_product_pos3_image.id      
                                      @image_3 = publisher_product_pos3_image
                                      @publisher_product = publisher_product_pos3_image.publisher_product
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'publisher_product_pos3_image updated_attributes failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'publisher_product_pos3_image save failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'request remotipart failed')
                              raise
                          end
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'publisher_product_pos3_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'publisher_product_pos3_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => 'publisher_product_id was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_3_change', :description => e.message.to_s)
          @errors = true
          
      end
        
    
  end



  def crop_image_3
    
      @errors = false
      
      begin
        
          @image_3 = nil    
          @image_3_id = nil      
          @publisher_product = nil
          
          # x = params[:crop_x]
          # y = params[:crop_y]
          # w = params[:crop_w]
          # h = params[:crop_h]
          
          publisher_product_id = params[:publisher_product_id]
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              Rails.logger.info "publisher_product was found"
              publisher_product_pos3_image = publisher_product.publisher_product_pos3_image rescue nil
              if !publisher_product_pos3_image.nil?
                  image = MiniMagick::Image.open("public" + publisher_product_pos3_image.image_url(:image_600_600))
                  crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
                  new_image = image.crop(crop_params)
                  img_name = File.basename(publisher_product_pos3_image.image.to_s)
                  img_dir = "public" + File.dirname(publisher_product_pos3_image.image.to_s)
            
                  image_345_300_path = img_dir + "/" + "image_345_300_" + img_name 
                  image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
                  image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
            
                  FileUtils.rm_rf(image_345_300_path) 
                  FileUtils.rm_rf(image_200_200_path) 
                  FileUtils.rm_rf(image_100_100_path) 
            
                  new_image.resize('345x300')
                  new_image.write image_345_300_path
                  new_image.resize('200x200')
                  new_image.write image_200_200_path
                  new_image.resize('100x100')
                  new_image.write image_100_100_path      
            
                  x = params[:crop_x]
                  y = params[:crop_y]
                  w = params[:crop_w]
                  h = params[:crop_h]
                  x = x.to_i
                  y = y.to_i
                  w = w.to_i
                  h = h.to_i
            
                  h_crop = Hash.new
                  h_crop[:crop_x] = x
                  h_crop[:crop_y] = y
                  h_crop[:crop_w] = w
                  h_crop[:crop_h] = h
              
                  if publisher_product_pos3_image.update_attributes(h_crop)
                      @image_3_id = publisher_product_pos3_image.id      
                      @image_3 = publisher_product_pos3_image
                      @publisher_product = publisher_product
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_3', :description => 'publisher_product_pos3_image update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_3', :description => 'publisher_product_pos3_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_3', :description => 'publisher_product_id was nil')
              raise
          end      

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_3', :description => e.message.to_s)
          @errors = true
          
      end
  
    
  end



  def destroy_image_3

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          @image_3 = nil
          @publisher_product = nil
          
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos3_image = publisher_product.publisher_product_pos3_image rescue nil
                  if !publisher_product_pos3_image.nil?
                      if publisher_product_pos3_image.destroy
                          @publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_3', :description => 'publisher_product_pos3_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_3', :description => 'publisher_product_pos3_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_3', :description => 'publisher_product was nil')
                  raise
              end
          else
              Rails.logger.info("publisher_product_id was nil")
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_3', :description => 'publisher_product_id was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_3', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_image_4

      @errors = false
      
      begin
           
          @image_4_id = nil
          @image_4 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos4_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  h_image = Hash.new
                  h_image[:image] = params[:publisher_product_pos4_image][:image]
                  h_image[:publisher_product_id] = publisher_product.id
                  h_image[:publisher_id] = current_user.publisher.id
                  h_image[:user_id] = current_user.id
                  h_image[:crop_x] = @crop_x
                  h_image[:crop_y] = @crop_y
                  h_image[:crop_w] = @crop_w
                  h_image[:crop_h] = @crop_h
                  publisher_product_pos4_image = PublisherProductPos4Image.new(h_image)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pos4_image.save
                          img = publisher_product_pos4_image
                          image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                          w = image.width
                          h = image.height
                          w_max = false
                          h_max = false
                          w_h_equal = false
                          x = 0
                          y = 0
                          l = 0                    
                          d = 0
                          if ( w == h)
                              w_h_equal = true
                          else
                              if ( w > h )
                                w_max = true
                              else
                                h_max = true
                              end
                          end
                          if w_max
                              d = w - h
                              d = (d/2).round
                              x = d
                              l = h  
                          end
                          if h_max
                              d = h - w
                              d = (d/2).round
                              y = d
                              l = w  
                          end
                          if w_h_equal
                              l = w
                          end
          
                          h_update = Hash.new
                          h_update[:crop_x] = x
                          h_update[:crop_y] = y
                          h_update[:crop_w] = l
                          h_update[:crop_h] = l
                          if publisher_product_pos4_image.update_attributes(h_update)
                              @image_4_id = publisher_product_pos4_image.id      
                              @image_4 = publisher_product_pos4_image
                              @publisher_product = publisher_product_pos4_image.publisher_product
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4', :description => 'publisher_product_pos4_image updated_attributes failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4', :description => 'publisher_product_pos4_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4', :description => 'request remotipart failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4', :description => e.message.to_s)
          @errors = true
          
      end

    
  end



  def upload_image_4_change

      @errors = false

      begin
        
          @image_4_id = nil
          @image_4 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos4_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos4_image = publisher_product.publisher_product_pos4_image rescue nil
                  if !publisher_product_pos4_image.nil?
                      if publisher_product_pos4_image.destroy
                          h_image = Hash.new
                          h_image[:image] = params[:publisher_product_pos4_image][:image]
                          h_image[:publisher_product_id] = publisher_product.id
                          h_image[:publisher_id] = current_user.publisher.id
                          h_image[:user_id] = current_user.id
                          h_image[:crop_x] = @crop_x
                          h_image[:crop_y] = @crop_y
                          h_image[:crop_w] = @crop_w
                          h_image[:crop_h] = @crop_h
                          publisher_product_pos4_image = PublisherProductPos4Image.new(h_image)
                          if request.xhr? || remotipart_submitted?
                              if publisher_product_pos4_image.save
                                  img = publisher_product_pos4_image
                                  image = MiniMagick::Image.open("public" + img.image_url(:image_600_600))
                                  w = image.width
                                  h = image.height
                                  w_max = false
                                  h_max = false
                                  w_h_equal = false
                                  x = 0
                                  y = 0
                                  l = 0                    
                                  d = 0
                                  if ( w == h)
                                      w_h_equal = true
                                  else
                                      if ( w > h )
                                        w_max = true
                                      else
                                        h_max = true
                                      end
                                  end
                                  if w_max
                                      d = w - h
                                      d = (d/2).round
                                      x = d
                                      l = h  
                                  end
                                  if h_max
                                      d = h - w
                                      d = (d/2).round
                                      y = d
                                      l = w  
                                  end
                                  if w_h_equal
                                      l = w
                                  end
                  
                                  h_update = Hash.new
                                  h_update[:crop_x] = x
                                  h_update[:crop_y] = y
                                  h_update[:crop_w] = l
                                  h_update[:crop_h] = l
                                  if publisher_product_pos4_image.update_attributes(h_update)
                                      @image_4_id = publisher_product_pos4_image.id      
                                      @image_4 = publisher_product_pos4_image
                                      @publisher_product = publisher_product_pos4_image.publisher_product
                                  else
                                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'publisher_product_pos4_image updated_attributes failed')
                                      raise
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'publisher_product_pos4_image save failed')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'request remotipart failed')
                              raise
                          end
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'publisher_product_pos4_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'publisher_product_pos4_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => 'publisher_product_id was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_4_change', :description => e.message.to_s)
          @errors = true
          
      end
        
    
  end



  def crop_image_4
    
      @errors = false
      
      begin
        
          @image_4 = nil    
          @image_4_id = nil      
          @publisher_product = nil
          
          # x = params[:crop_x]
          # y = params[:crop_y]
          # w = params[:crop_w]
          # h = params[:crop_h]
          
          publisher_product_id = params[:publisher_product_id]
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              Rails.logger.info "publisher_product was found"
              publisher_product_pos4_image = publisher_product.publisher_product_pos4_image rescue nil
              if !publisher_product_pos4_image.nil?
                  image = MiniMagick::Image.open("public" + publisher_product_pos4_image.image_url(:image_600_600))
                  crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
                  new_image = image.crop(crop_params)
                  img_name = File.basename(publisher_product_pos4_image.image.to_s)
                  img_dir = "public" + File.dirname(publisher_product_pos4_image.image.to_s)
            
                  image_345_300_path = img_dir + "/" + "image_345_300_" + img_name 
                  image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
                  image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
            
                  FileUtils.rm_rf(image_345_300_path) 
                  FileUtils.rm_rf(image_200_200_path) 
                  FileUtils.rm_rf(image_100_100_path) 
            
                  new_image.resize('345x300')
                  new_image.write image_345_300_path
                  new_image.resize('200x200')
                  new_image.write image_200_200_path
                  new_image.resize('100x100')
                  new_image.write image_100_100_path      
            
                  x = params[:crop_x]
                  y = params[:crop_y]
                  w = params[:crop_w]
                  h = params[:crop_h]
                  x = x.to_i
                  y = y.to_i
                  w = w.to_i
                  h = h.to_i
            
                  h_crop = Hash.new
                  h_crop[:crop_x] = x
                  h_crop[:crop_y] = y
                  h_crop[:crop_w] = w
                  h_crop[:crop_h] = h
              
                  if publisher_product_pos4_image.update_attributes(h_crop)
                      @image_4_id = publisher_product_pos4_image.id      
                      @image_4 = publisher_product_pos4_image
                      @publisher_product = publisher_product
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_4', :description => 'publisher_product_pos4_image update_attributes failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_4', :description => 'publisher_product_pos4_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_4', :description => 'publisher_product_id was nil')
              raise
          end      

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_4', :description => e.message.to_s)
          @errors = true
          
      end
  
    
  end



  def destroy_image_4

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          @image_4 = nil
          @publisher_product = nil
          
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos4_image = publisher_product.publisher_product_pos4_image rescue nil
                  if !publisher_product_pos4_image.nil?
                      if publisher_product_pos4_image.destroy
                          @publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_4', :description => 'publisher_product_pos4_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_4', :description => 'publisher_product_pos4_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_4', :description => 'publisher_product was nil')
                  raise
              end
          else
              Rails.logger.info("publisher_product_id was nil")
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_4', :description => 'publisher_product_id was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_4', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end



  def upload_image_5

      @errors = false
      
      begin
           
          @image_5 = nil
          @image_5_id = nil
          @image_5_url = nil
          @publisher_product = nil
          @crop_x_image_5 = 0
          @crop_y_image_5 = 0
          @crop_w_image_5 = 100
          @crop_h_image_5 = 25
          
          publisher_product_id = params[:publisher_product_pos5_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  h_image = Hash.new
                  h_image[:image] = params[:publisher_product_pos5_image][:image]
                  h_image[:publisher_product_id] = publisher_product.id
                  h_image[:publisher_id] = current_user.publisher.id
                  h_image[:user_id] = current_user.id
                  h_image[:crop_x] = @crop_x
                  h_image[:crop_y] = @crop_y
                  h_image[:crop_w] = @crop_w
                  h_image[:crop_h] = @crop_h
                  publisher_product_pos5_image = PublisherProductPos5Image.new(h_image)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pos5_image.save
                          img = publisher_product_pos5_image
                          image = MiniMagick::Image.open("public" + img.image_url(:image_500_500))
                          w = image.width
                          h = image.height

                          # # Background aspect ratio (1200:300 or 4:1)
                          bkgrnd_asp_ratio = 4
                          crop_w = image.width
                          crop_h = (image.width / bkgrnd_asp_ratio).round
                          crop_x = 0
                          crop_y = ((image.height - crop_h) / 2).round

                          h_update = Hash.new
                          h_update[:crop_x] = crop_x
                          h_update[:crop_y] = crop_y
                          h_update[:crop_w] = crop_w
                          h_update[:crop_h] = crop_h
                          
                          if publisher_product_pos5_image.update_attributes(h_update)
                              image_5 = publisher_product_pos5_image
                              if !image_5.nil?
                                gon.image_5_id = image_5.id
                                @image_5 = image_5
                                @image_5_id = image_5.id
                                @image_5_url = image_5.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                                @crop_x_image_5 = image_5.crop_x
                                @crop_y_image_5 = image_5.crop_y
                                @crop_w_image_5 = image_5.crop_w
                                @crop_h_image_5 = image_5.crop_h
                              else
                                @image_5 = nil
                                gon.image_5_id = nil
                                @image_5_id = nil
                                @image_5_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                              end

                              image_1 = publisher_product.publisher_product_pos1_image rescue nil
                              @image_1 = image_1
                              if !image_1.nil?
                                @image_1_id = image_1.id
                                gon.image_1_id = image_1.id
                                @crop_x_image_1 = image_1.crop_x
                                @crop_y_image_1 = image_1.crop_y
                                @crop_w_image_1 = image_1.crop_w
                                @crop_h_image_1 = image_1.crop_h
                              else
                                @image_1_id = nil
                                gon.image_1_id = nil
                              end

                              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
                              if !publisher_product_manifest.nil?
                                  @publisher_product_manifest_product_headline = publisher_product_manifest.product_headline
                                  @product_headline = "Product Headline"
                                  @b_product_headline = false
                                  @b_required_product_headline = true
                                  if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
                                      # @b_product_headline = true
                                      @product_headline = publisher_product_manifest.product_headline
                                      @b_product_headline = true
                                      @b_required_product_headline = false
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => 'publisher_product_manifest was nil')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => 'publisher_product_pos5_image updated_attributes failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => 'publisher_product_pos5_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => 'request remotipart failed')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => 'publisher_product_id was nil')
              raise
          end
    
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5', :description => e.message.to_s)
          @errors = true
          
      end

    
  end







  # def upload_user_background1_image
# 
      # @user_bkgrnd_image = nil
      # @bkgrnd_crop_x = 0
      # @bkgrnd_crop_y = 0
      # @bkgrnd_crop_w = 1200
      # @bkgrnd_crop_h = 300
#       
      # # publisher = Publisher.where("user_id = ?", current_user.id).first rescue nil
      # # if !publisher.nil?
      # if signed_in?
          # h_user_bkgrnd_image = Hash.new
          # h_user_bkgrnd_image[:image] = params[:user_bkgrnd_image][:image]
          # h_user_bkgrnd_image[:user_id] = current_user.id
          # # h_user_bkgrnd_image[:publisher_id] = publisher.id
          # h_user_bkgrnd_image[:primary] = true
          # h_user_bkgrnd_image[:crop_x] = @bkgrnd_crop_x
          # h_user_bkgrnd_image[:crop_y] = @bkgrnd_crop_y
          # h_user_bkgrnd_image[:crop_w] = @bkgrnd_crop_w
          # h_user_bkgrnd_image[:crop_h] = @bkgrnd_crop_h
          # user_bkgrnd_image = UserBkgrndImage.new(h_user_bkgrnd_image)
# 
          # user_bkgrnd_images = current_user.user_bkgrnd_images
          # user_bkgrnd_image_old = user_bkgrnd_images.where( :primary => true ).first rescue nil
#    
          # if request.xhr? || remotipart_submitted?
              # if user_bkgrnd_image.save
                  # if !user_bkgrnd_image_old.nil?
                      # # TODO Check if image destroyed
                      # # user_bkgrnd_image_old.update_attributes( :primary => false )
                      # user_bkgrnd_image_old.destroy
                  # end
#                   
                  # user_bkgrnd_image = user_bkgrnd_images.where( :primary => true ).last rescue nil
#                   
                  # if !user_bkgrnd_image.nil? 
                      # @user_bkgrnd_image = user_bkgrnd_image
# 
                      # img = user_bkgrnd_image
                      # image = MiniMagick::Image.open("public" + img.image_url(:image_800_500))
# 
                      # # Background aspect ratio (1200:300 or 4:1)
                      # bkgrnd_asp_ratio = 4
# 
                      # crop_w = image.width
                      # crop_h = image.width / bkgrnd_asp_ratio
                      # crop_x = 0
                      # crop_y = (image.height - crop_h) / 2
# 
                      # @bkgrnd_crop_x = crop_x
                      # @bkgrnd_crop_y = crop_y
                      # @bkgrnd_crop_w = crop_w
                      # @bkgrnd_crop_h = crop_h
# 
                      # h_update = Hash.new
                      # h_update[:crop_x] = crop_x
                      # h_update[:crop_y] = crop_y
                      # h_update[:crop_w] = crop_w
                      # h_update[:crop_h] = crop_h
# 
                      # if user_bkgrnd_image.update_attributes(h_update)
                          # #                      
                      # else
                          # #  
                      # end                      
                  # end
              # else
                # # error save
              # end
          # else
            # # 
          # end
      # else
        # #
      # end
#       
  # end


  def upload_image_5_change

      @errors = false

      begin
        
          @image_5_id = nil
          @image_5 = nil
          @publisher_product = nil
          @crop_x = 0
          @crop_y = 0
          @crop_w = 200
          @crop_h = 200
          
          publisher_product_id = params[:publisher_product_pos5_image][:publisher_product_id]
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos5_image = publisher_product.publisher_product_pos5_image rescue nil
                  if !publisher_product_pos5_image.nil?
                      if publisher_product_pos5_image.destroy
                          #                        
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_pos5_image destroy failed')
                          raise
                      end
                  else
                      #
                  end
                    
                  h_image = Hash.new
                  h_image[:image] = params[:publisher_product_pos5_image][:image]
                  h_image[:publisher_product_id] = publisher_product.id
                  h_image[:publisher_id] = current_user.publisher.id
                  h_image[:user_id] = current_user.id
                  h_image[:crop_x] = @crop_x
                  h_image[:crop_y] = @crop_y
                  h_image[:crop_w] = @crop_w
                  h_image[:crop_h] = @crop_h
                  publisher_product_pos5_image = PublisherProductPos5Image.new(h_image)
                  if request.xhr? || remotipart_submitted?
                      if publisher_product_pos5_image.save
                        
                          img = publisher_product_pos5_image
                          image = MiniMagick::Image.open("public" + img.image_url(:image_800_500))
                          # w = image.width
                          # h = image.height
                          # w_max = false
                          # h_max = false
                          # w_h_equal = false
                          # x = 0
                          # y = 0
                          # l = 0                    
                          # d = 0
                          # if ( w == h)
                              # w_h_equal = true
                          # else
                              # if ( w > h )
                                # w_max = true
                              # else
                                # h_max = true
                              # end
                          # end
                          # if w_max
                              # d = w - h
                              # d = (d/2).round
                              # x = d
                              # l = h  
                          # end
                          # if h_max
                              # d = h - w
                              # d = (d/2).round
                              # y = d
                              # l = w  
                          # end
                          # if w_h_equal
                              # l = w
                          # end
                          # h_update = Hash.new
                          # h_update[:crop_x] = x
                          # h_update[:crop_y] = y
                          # h_update[:crop_w] = l
                          # h_update[:crop_h] = l
                          
                          # Background aspect ratio (1200:300 or 4:1)
                          bkgrnd_asp_ratio = 4
    
                          crop_w = image.width
                          crop_h = image.width / bkgrnd_asp_ratio
                          crop_x = 0
                          crop_y = (image.height - crop_h) / 2
    
                          # @bkgrnd_crop_x = crop_x
                          # @bkgrnd_crop_y = crop_y
                          # @bkgrnd_crop_w = crop_w
                          # @bkgrnd_crop_h = crop_h
    
                          h_update = Hash.new
                          h_update[:crop_x] = crop_x
                          h_update[:crop_y] = crop_y
                          h_update[:crop_w] = crop_w
                          h_update[:crop_h] = crop_h
                          
                          if publisher_product_pos5_image.update_attributes(h_update)
                              image_5 = publisher_product_pos5_image
                              # @image_5 = image_5
                              if !image_5.nil?
                                gon.image_5_id = image_5.id
                                @image_5 = image_5
                                @image_5_id = image_5.id
                                @image_5_url = image_5.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                                @crop_x_image_5 = image_5.crop_x
                                @crop_y_image_5 = image_5.crop_y
                                @crop_w_image_5 = image_5.crop_w
                                @crop_h_image_5 = image_5.crop_h
                              else
                                # Rails.logger.info('image_5 was nil in index')
                                gon.image_5_id = nil
                                @image_5_id = nil
                                @image_5_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                              end

                              image_1 = publisher_product.publisher_product_pos1_image rescue nil
                              @image_1 = image_1
                              if !image_1.nil?
                                gon.image_1_id = image_1.id
                                @crop_x_image_1 = image_1.crop_x
                                @crop_y_image_1 = image_1.crop_y
                                @crop_w_image_1 = image_1.crop_w
                                @crop_h_image_1 = image_1.crop_h
                              else
                                gon.image_1_id = nil
                              end
                              
                              @publisher_product = publisher_product_pos5_image.publisher_product
                              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
                              if !publisher_product_manifest.nil?
                                  @publisher_product_manifest_product_headline = publisher_product_manifest.product_headline
                                  # @b_product_headline = false
                                  # gon.product_headline = "Product Headline"
                                  # gon.b_product_headline = false
                                  # gon.b_required_product_headline = true
                                  # if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
                                      # # @b_product_headline = true
                                      # gon.product_headline = publisher_product_manifest.product_headline
                                      # gon.b_product_headline = true
                                      # gon.b_required_product_headline = false
                                  # end
                                  
                                  @product_headline = "Product Headline"
                                  @b_product_headline = false
                                  @b_required_product_headline = true
                                  if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
                                      # @b_product_headline = true
                                      @product_headline = publisher_product_manifest.product_headline
                                      @b_product_headline = true
                                      @b_required_product_headline = false
                                  end
                              else
                                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_manifest was nil')
                                  raise
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_pos5_image updated_attributes failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_pos5_image save failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'request remotipart failed')
                      raise
                  end
                      
                  # end
                  # else
                      # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_pos5_image was nil')
                      # raise
                  # end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_id was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => e.message.to_s)
          @errors = true
          
      end
        
    
  end



  def crop_image_5
    
      @errors = false
      
      begin
        
          @image_5 = nil    
          @image_5_id = nil      
          @publisher_product = nil
          
          # x = params[:crop_x]
          # y = params[:crop_y]
          # w = params[:crop_w]
          # h = params[:crop_h]
          
          publisher_product_id = params[:publisher_product_id]
          publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
          if !publisher_product.nil?
              # Rails.logger.info "publisher_product was found"
              publisher_product_pos5_image = publisher_product.publisher_product_pos5_image rescue nil
              if !publisher_product_pos5_image.nil?
                  image = MiniMagick::Image.open("public" + publisher_product_pos5_image.image_url)
                  # image_800_500 = MiniMagick::Image.open("public" + publisher_product_pos5_image.image_url(:image_800_500))
                  image_500_500 = MiniMagick::Image.open("public" + publisher_product_pos5_image.image_url(:image_500_500))
                  if(image.width >= image.height)
                      crop_scale = image.width / image_500_500.width.to_f
                  else
                      crop_scale = image.height / image_500_500.height.to_f
                  end
                  
                  crop_x = (params[:crop_x].to_i * crop_scale).to_i
                  crop_y = (params[:crop_y].to_i * crop_scale).to_i
                  crop_w = (params[:crop_w].to_i * crop_scale).to_i
                  crop_h = (params[:crop_h].to_i * crop_scale).to_i
    
                  crop_params = "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
                  new_image = image.crop(crop_params)
    
                  img_name = File.basename(publisher_product_pos5_image.image.to_s)
                  img_dir = "public" + File.dirname(publisher_product_pos5_image.image.to_s)
    
                  image_1200_300_path = img_dir + "/" + "image_1200_300_fill_" + img_name
    
                  FileUtils.rm_rf(image_1200_300_path)
    
                  new_image.resize('1200x300')
                  new_image.write image_1200_300_path
    
                  # user_bkgrnd_image = publisher_product_pos5_images.where( :primary => true ).last rescue nil
                  publisher_product_pos5_image = publisher_product.publisher_product_pos5_image rescue nil
                  if !publisher_product_pos5_image.nil? 
                      h_update = Hash.new
                      h_update[:crop_x] = params[:crop_x]
                      h_update[:crop_y] = params[:crop_y]
                      h_update[:crop_w] = params[:crop_w]
                      h_update[:crop_h] = params[:crop_h]
                      if publisher_product_pos5_image.update_attributes(h_update)
                          # @image_5 = publisher_product_pos5_image
                          # @image_5_id = publisher_product_pos5_image.id
                          
                          image_5 = publisher_product_pos5_image
                          if !image_5.nil?
                            gon.image_5_id = image_5.id
                            @image_5 = image_5
                            @image_5_id = image_5.id
                            @image_5_url = image_5.image_url(:image_1200_300_fill) + '?' + (rand(10..90) * rand(100..900)).to_s
                            @crop_x_image_5 = image_5.crop_x
                            @crop_y_image_5 = image_5.crop_y
                            @crop_w_image_5 = image_5.crop_w
                            @crop_h_image_5 = image_5.crop_h
                          else
                            @image_5 = nil
                            gon.image_5_id = nil
                            @image_5_id = nil
                            @image_5_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                          end
                          
                          image_1 = publisher_product.publisher_product_pos1_image rescue nil
                          @image_1 = image_1
                          if !image_1.nil?
                            gon.image_1_id = image_1.id
                            @crop_x_image_1 = image_1.crop_x
                            @crop_y_image_1 = image_1.crop_y
                            @crop_w_image_1 = image_1.crop_w
                            @crop_h_image_1 = image_1.crop_h
                          else
                            gon.image_1_id = nil
                          end
                          
                          # @publisher_product = publisher_product_pos5_image.publisher_product
                          publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
                          if !publisher_product_manifest.nil?
                              @publisher_product_manifest_product_headline = publisher_product_manifest.product_headline
                              # Rails.logger.info(publisher_product_manifest.product_headline);
                              # @b_product_headline = false
                              # gon.product_headline = "Product Headline"
                              # gon.b_product_headline = false
                              # gon.b_required_product_headline = true

                              @product_headline = "Product Headline"
                              @b_product_headline = false
                              @b_required_product_headline = true
                              if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
                                  # @b_product_headline = true
                                  @product_headline = publisher_product_manifest.product_headline
                                  @b_product_headline = true
                                  @b_required_product_headline = false
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_manifest was nil')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_5', :description => 'publisher_product_pos5_image update_attributes failed')
                          raise
                      end
                  end
                
                  # image = MiniMagick::Image.open("public" + publisher_product_pos5_image.image_url(:image_600_600))
                  # crop_params = "#{params[:crop_w]}x#{params[:crop_h]}+#{params[:crop_x]}+#{params[:crop_y]}"
                  # new_image = image.crop(crop_params)
                  # img_name = File.basename(publisher_product_pos5_image.image.to_s)
                  # img_dir = "public" + File.dirname(publisher_product_pos5_image.image.to_s)
                  # image_375_300_path = img_dir + "/" + "image_375_300_" + img_name 
                  # image_200_200_path = img_dir + "/" + "image_200_200_" + img_name 
                  # image_100_100_path = img_dir + "/" + "image_100_100_" + img_name
                  # FileUtils.rm_rf(image_375_300_path) 
                  # FileUtils.rm_rf(image_200_200_path) 
                  # FileUtils.rm_rf(image_100_100_path) 
                  # new_image.resize('375x300')
                  # new_image.write image_375_300_path
                  # new_image.resize('200x200')
                  # new_image.write image_200_200_path
                  # new_image.resize('100x100')
                  # new_image.write image_100_100_path      
                  # x = params[:crop_x]
                  # y = params[:crop_y]
                  # w = params[:crop_w]
                  # h = params[:crop_h]
                  # x = x.to_i
                  # y = y.to_i
                  # w = w.to_i
                  # h = h.to_i
                  # h_crop = Hash.new
                  # h_crop[:crop_x] = x
                  # h_crop[:crop_y] = y
                  # h_crop[:crop_w] = w
                  # h_crop[:crop_h] = h
                  # if publisher_product_pos5_image.update_attributes(h_crop)
                      # @image_5_id = publisher_product_pos5_image.id      
                      # @image_5 = publisher_product_pos5_image
                      # @publisher_product = publisher_product
                  # else
                      # LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_5', :description => 'publisher_product_pos5_image update_attributes failed')
                      # raise
                  # end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_5', :description => 'publisher_product_pos5_image was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_5', :description => 'publisher_product_id was nil')
              raise
          end      

      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'crop_image_5', :description => e.message.to_s)
          @errors = true
          
      end
  
    
  end



  def destroy_image_5

      begin
        
          ar = params[:publisher_product_manifest]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
          @image_5 = nil
          @publisher_product = nil
          
          if !publisher_product_id.nil?
              publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              if !publisher_product.nil?
                  publisher_product_pos5_image = publisher_product.publisher_product_pos5_image rescue nil
                  if !publisher_product_pos5_image.nil?
                      if publisher_product_pos5_image.destroy
                          @publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
                          gon.image_5_id = nil
                          @image_5_id = nil
                          @image_5_url = ActionController::Base.helpers.asset_path('avatars/background-1-w1200-h300.jpg') 
                          
                          image_1 = publisher_product.publisher_product_pos1_image rescue nil
                          @image_1 = image_1
                          if !image_1.nil?
                            gon.image_1_id = image_1.id
                            @crop_x_image_1 = image_1.crop_x
                            @crop_y_image_1 = image_1.crop_y
                            @crop_w_image_1 = image_1.crop_w
                            @crop_h_image_1 = image_1.crop_h
                          else
                            gon.image_1_id = nil
                          end
                          
                          # @publisher_product = publisher_product_pos5_image.publisher_product
                          publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
                          if !publisher_product_manifest.nil?
                              @publisher_product_manifest_product_headline = publisher_product_manifest.product_headline
                              Rails.logger.info(publisher_product_manifest.product_headline);
                              # @b_product_headline = false
                              # gon.product_headline = "Product Headline"
                              # gon.b_product_headline = false
                              # gon.b_required_product_headline = true

                              @product_headline = "Product Headline"
                              @b_product_headline = false
                              @b_required_product_headline = true
                              if !((publisher_product_manifest.product_headline.blank?) or (publisher_product_manifest.product_headline.empty?) or (publisher_product_manifest.product_headline.nil?)) 
                                  # @b_product_headline = true
                                  @product_headline = publisher_product_manifest.product_headline
                                  @b_product_headline = true
                                  @b_required_product_headline = false
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'upload_image_5_change', :description => 'publisher_product_manifest was nil')
                              raise
                          end
                      else      
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_5', :description => 'publisher_product_pos5_image destroy failed')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_5', :description => 'publisher_product_pos5_image was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_5', :description => 'publisher_product was nil')
                  raise
              end
          else
              Rails.logger.info("publisher_product_id was nil")
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_5', :description => 'publisher_product_id was nil')
              raise
          end
          
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product_manifest', :action => 'destroy_image_5', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

    
  end

  
  
  def dbdelete
    # PublisherProductDescription.dbdelete
    # PublisherProductdescription.dbclear
    # respond_to do |format|
      # format.html
      # # format.js { redirect_to(:action => 'index', :form => :js ) }
      # format.js { redirect_to('/Publishers') }
    # end
  end



  
  private

    def publisher_product_description_params
      params.require(:publisher_product_description).permit(      
                                                              :publisher_product_id,
                                                              :publisher_id,
                                                              :word_description,   
                                                              :name_product,        
                                                              :description,          
                                                              :source_url,           
                                                              :versions,           
                                                              :slugged,              
                                                              :product_tagline,      
                                                              :product_headline,
                                                              :topic,               
                                                              :lesson_plan_subject,  
                                                              :updating_refresh_rate, 
                                                              :updating_type,       
                                                              :reselling,           
                                                              :evaluation,         
                                                              :allow_teacher_rating, 
                                                              :user_rating_1,        
                                                              :user_rating_2,        
                                                              :user_rating_3,         
                                                              :allow_student_likes,   
                                                              :allow_comments,     
                                                              :research_1,         
                                                              :research_2,        
                                                              :pr_updates_1,        
                                                              :pr_updates_2,        
                                                              :pr_updates_3,        
                                                              :pr_updates_4,         
                                                              :metrics_1,           
                                                              :metrics_2,        
                                                              :metrics_3,         
                                                              :metrics_4,         
                                                              :metrics_5,        
                                                              :poster_print_purchase,
                                                              :poster_pin_web,
                                                              :poster_pin_purchase,
                                                              :corporate_logo_url                                                              
                                                           )

    end
    

    # def publisher_product_pdf_params
      # params.require(:publisher_product_pdf).permit(      
                                                    # :name_file,
                                                    # :publisher_id,
                                                    # :publisher_product_id,
                                                    # :product_product_description_id       
                                                   # )
    # end


    def sort_column
    end
    
    def sort_column_core_literacy
      CoreLiteracyStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_core_math
      CoreMathStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    # english
    # math
    # career_dev
    # career_tech_ed
    # economics
    # fine_arts
    # health_ed
    # languages_non_eng
    # physical_ed
    # science
    # second_language_eng_span
    # social_studies
    # technology

    def sort_column_teks_english
      TeksEnglishStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_math
      TeksMathStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_career_dev
      TeksCareerDevStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_career_tech_ed
      TeksCareerTechEdStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_economics
      TeksEconomicsStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_fine_arts
      TeksFineArtsStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_health_ed
      TeksHealthEdStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_languages_non_eng
      TeksLanguagesNonEngStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_physical_ed
      TeksPhysicalEdStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_science
      TeksScienceStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_second_language_eng_span
      TeksSecondLanguageEngSpanStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_social_studies
      TeksSocialStudiesStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_teks_technology
      TeksTechnologyStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # def sortable_core_math(column, title = nil)
      # title ||= column.titleize
      # css_class = column == sort_column_core_math ? "current #{sort_direction}" : nil
      # direction = column == sort_column_core_math && sort_direction == "asc" ? "desc" : "asc"
      # link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
    # end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # def yesno(x)
      # # x == 1 ? "Yes" : "No"
      # x ? "Yes" : "No"
    # end
    
    def return_all_dtab1lets      
      # return Dtab1let.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])
      return Dtab1let.order(sort_column_dtab1let + " " + sort_direction)
    end
    def sort_column_dtab1let
      Dtab1let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def return_all_dtab2lets      
      return Dtab2let.order(sort_column_dtab2let + " " + sort_direction)
    end
    def sort_column_dtab2let
      Dtab2let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def return_all_dtab3lets      
      return Dtab3let.order(sort_column_dtab3let + " " + sort_direction)
    end
    def sort_column_dtab3let
      Dtab3let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab4lets      
      return Dtab4let.order(sort_column_dtab4let + " " + sort_direction)
    end
    def sort_column_dtab4let
      Dtab4let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab5lets      
      return Dtab5let.order(sort_column_dtab5let + " " + sort_direction)
    end
    def sort_column_dtab5let
      Dtab5let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab6lets      
      return Dtab6let.order(sort_column_dtab6let + " " + sort_direction)
    end
    def sort_column_dtab6let
      Dtab6let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab7lets      
      return Dtab7let.order(sort_column_dtab7let + " " + sort_direction)
    end
    def sort_column_dtab7let
      Dtab7let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab8lets      
      return Dtab8let.where(:id => 1..18).order(sort_column_dtab8let + " " + sort_direction) rescue nil
    end
    def sort_column_dtab8let
      Dtab8let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab9lets      
      return Dtab9let.order(sort_column_dtab9let + " " + sort_direction)
    end
    def return_all_dtab9lets_ordered      
      return Dtab9let.order("col_order ASC")
    end
    def sort_column_dtab9let
      Dtab9let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab10lets      
      return Dtab10let.order(sort_column_dtab10let + " " + sort_direction)
    end
    def sort_column_dtab10let
      Dtab10let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab11lets      
      return Dtab11let.order(sort_column_dtab11let + " " + sort_direction)
    end
    def sort_column_dtab11let
      Dtab11let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

      
end

