class PublicPublisherProductManifestsController < ApplicationController
  
  # before_filter :force_http

  # include CarrierWave::RMagick
  
  layout 'publisher'

  respond_to :html, :js, :json  

  # helper_method :sort_column, :sort_direction, :yesno
  helper_method :sort_column, :sort_direction, :yesno


  # before_action :signed_in_user, only: [:index, :index_demo]
  # before_action :fill_left_directory, only: [:index, :index_demo]
  # before_action :verify_params, only: [:index, :index_demo]


  # @@publisher_id = nil
  # @@publisher_product_id = nil
  # @@publisher_product_manifest_id = nil

  def verify_params
    
      id_passed = params[:id]
      b_signed_in = signed_in?
      b_issued_publisher_product_id_exists = IssuedPublisherProductId.exists?(:publisher_product_gen_id => id_passed)
      if b_issued_publisher_product_id_exists
        
          # allow to index
        
          # if b_signed_in
              # current_user_profile_type = current_user.profile_type
              # if (current_user_profile_type.to_s == "3")
                  # b_current_user_owns = current_user.publisher.publisher_products.exists?(:slug => id_passed)
                  # if b_current_user_owns
                      # current_user_publisher_user = current_user.publisher_user
                      # b_current_user_publisher_user_admin_2 = current_user_publisher_user.admin_2
                      # if b_current_user_publisher_user_admin_2
                          # redirect_to '/Publisher-Product-Manifest-id' + id_passed
                      # else
                          # # allow to index
                      # end
                  # else
                      # # allow to index
                  # end
              # else
                  # # allow to index
              # end
          # else
              # # allow to index
          # end    
      else
          if b_signed_in
              redirect_to '/Publisher-Product-Listings'
          else
              redirect_to '/Signin'
          end        
      end
    

  end


  def fill_left_directory

      slug = current_user.slug
      @url_user_story  = '/' + current_user.slug
      @url_profile_story = '/' + current_user.publisher.slug
      
      # @url_my_story_demo        = '/puid-demo' + slug
      # @url_corporate_story_demo = '/pcid-demo' + slug
        
  end

    
    
  def index
    
    
  end    
    
  # def show_description
    # @@publisher_product_id = params[:publisher_product_id]
    # redirect_to :action => :index
  # end
  

  # def index_manifest
      # publisher_product_id = params[:publisher_product_id]
      # publisher_product_current = current_user.publisher.publisher_product_current rescue nil
      # if !publisher_product_current.nil?
          # publisher_product_current.current_product_id = publisher_product_id
          # if publisher_product_current.save
              # #
          # else
              # Rails.logger.info("publisher_product_current save to 0 failed in controller")
          # end          
      # else
          # redirect_to '/Products' # -> with error message
      # end
      # redirect_to :action => :index
  # end

  
  def index_working
    
      publisher_product_id = params[:publisher_product_id]
      
      publisher_product_id = 3

      publisher_product = PublisherProduct.find(publisher_product_id) rescue nil

      if !publisher_product.nil?
          publisher_id = publisher_product.publisher_id
          # Rails.logger.info("publisher id = " + publisher_id.to_s)
          # publisher = Publisher.find(:id => publisher_id) rescue nil
          publisher = publisher_product.publisher
          if !publisher.nil?

              @publisher_id = publisher_id
              @@publisher_id = publisher_id
              
              # publisher_product_id = current_user.publisher.publisher_product_current.current_product_id    
        
              # Rails.logger.info("in index @@publisher_product_id = " + @@publisher_product_id.to_s)
              # publisher_product = publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
              @publisher_product = publisher_product
              @publisher_product_id = publisher_product_id
          
              publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
              @publisher_product_manifest = publisher_product_manifest
              
              @publisher_product_manifest_id = publisher_product_manifest.id
              @@publisher_product_manifest_id = @publisher_product_manifest_id
        
        
              
              @publisher_product_description_description_text = publisher_product.publisher_product_description.description_text      
              
              @publisher_product_manifest_topic = @publisher_product_manifest.topic
              @publisher_product_manifest_lesson_plan_subject = @publisher_product_manifest.lesson_plan_subject
              
              @publisher_product_pdfs = publisher_product.publisher_product_pdfs
          
        
              image_1 = publisher_product.publisher_product_pos1_image rescue nil
              @image_1 = image_1
              if !image_1.nil?
                gon.id_image_1 = image_1.id
                @crop_x_image_1 = image_1.crop_x
                @crop_y_image_1 = image_1.crop_y
                @crop_w_image_1 = image_1.crop_w
                @crop_h_image_1 = image_1.crop_h
              else
                gon.id_image_1 = nil
              end
        
              image_2 = publisher_product.publisher_product_pos2_image rescue nil
              @image_2 = image_2
              if !image_2.nil?
                gon.id_image_2 = image_2.id
                @crop_x_image_2 = image_2.crop_x
                @crop_y_image_2 = image_2.crop_y
                @crop_w_image_2 = image_2.crop_w
                @crop_h_image_2 = image_2.crop_h
              else
                gon.id_image_2 = nil
              end
              
              image_3 = publisher_product.publisher_product_pos3_image rescue nil
              @image_3 = image_3
              if !image_3.nil?
                gon.id_image_3 = image_3.id
                @crop_x_image_3 = image_3.crop_x
                @crop_y_image_3 = image_3.crop_y
                @crop_w_image_3 = image_3.crop_w
                @crop_h_image_3 = image_3.crop_h
              else
                gon.id_image_3 = nil
              end
        
              image_4 = publisher_product.publisher_product_pos4_image rescue nil
              @image_4 = image_4
              if !image_4.nil?
                gon.id_image_4 = image_4.id
                @crop_x_image_4 = image_4.crop_x
                @crop_y_image_4 = image_4.crop_y
                @crop_w_image_4 = image_4.crop_w
                @crop_h_image_4 = image_4.crop_h
              else
                gon.id_image_4 = nil
              end
              
              @publisher_product1_image = publisher_product.publisher_product1_image
              @publisher_product2_image = publisher_product.publisher_product2_image    
              @publisher_product_corporate_logo = publisher_product.publisher_product_corporate_logo
              @publisher_product_content_type = publisher_product.publisher_product_content_type
              @publisher_product_category_subject = publisher_product.publisher_product_category_subject
              @publisher_product_appropriate_age = publisher_product.publisher_product_appropriate_age
              @publisher_product_appropriate_grade = publisher_product.publisher_product_appropriate_grade
              @publisher_product_market_target = publisher_product.publisher_product_market_target
              @publisher_product_platform = publisher_product.publisher_product_platform
              @publisher_product_file_type = publisher_product.publisher_product_file_type
              @publisher_product_character = publisher_product.publisher_product_character
              @publisher_product_enhancement = publisher_product.publisher_product_enhancement
              @publisher_product_pricing_model = publisher_product.publisher_product_pricing_model
              @publisher_product_price = publisher_product.publisher_product_price
              # @publisher_product_lesson_time = publisher_product.publisher_product_lesson_time
              @publisher_product_by_review = publisher_product.publisher_product_by_review
              
              # @publisher_product_core_literacy_standard = publisher_product.publisher_product_core_literacy_standard
              @publisher_product_core_literacy_standards = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
              @core_literacy_standards = CoreLiteracyStandard.order(sort_column_core_literacy + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
              # @publisher_product_core_literacy_standard = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", @publisher_product_id).first
              # @publisher_product_core_math_standard = PublisherProductCoreMathStandard.where("publisher_product_id = ?", @publisher_product_id).first
              # @core_literacy_standards = CoreLiteracyStandard.all
              # @core_math_standards = CoreMathStandard.all
          
              @publisher_product_core_math_standards = PublisherProductCoreMathStandard.where("publisher_product_id = ?", publisher_product.id).except('order').order("id ASC")
              @core_math_standards = CoreMathStandard.order(sort_column_core_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
              
              
              # @b_versions = true                    # 12
              # @b_content_type = false          # 3
              # @b_category_subject = false      # 6
              # @b_topic = true                       # 13
              # @b_lesson_plan_subject = true         # 14
              # @b_manifest = true                 # 2
              # @b_age_appropriate_index = false      # 7
              # @b_grade_appropriate = false     # 8
              @b_source_url = true                  # 5
              @b_market_target_index = false      # 7
              # @b_platform = false              # 9
              # @b_file_type = false              # 9
              @b_updating_refresh_rate = false      # 0
              @b_updating_type = false      # 0
              @b_character = false      # 0
              # @b_enhancement = false      # 0
              # @b_pricing_model = false      # 0
              # @b_price = false      # 0
              @b_lesson_time = false              # 9
              # @b_allow_teacher_rating = false      # 0
              @b_research = true      # 0
              # @b_core_supplemental_index = true     # 4
              @b_word_manifest = true            # 15
              # @b_core_literacy_standard = true      # 16
              # @b_core_math_standard = true          # 17
          
          
              # 1 name_product
              # @b_name_product = false
              gon.name_product = "Product Name"
              gon.b_name_product = false
              gon.b_required_name_product = true
              # @publisher_product_manifest_name_product = "Product Name" # to delete      
              if !((publisher_product_manifest.name_product.blank?) or (publisher_product_manifest.name_product.empty?) or (publisher_product_manifest.name_product.nil?)) 
                  # @publisher_product_manifest_name_product = publisher_product_manifest.name_product
                  # @b_name_product = true
                  gon.name_product = publisher_product_manifest.name_product
                  gon.b_name_product = true
                  gon.b_required_name_product = false
              end
          
              # 2 product_tagline
              # @b_product_tagline = false
              gon.product_tagline = "Tagline"
              gon.b_product_tagline = false
              gon.b_required_product_tagline = true        
              # @publisher_product_manifest_product_tagline = "Product Tagline"      
              if !((@publisher_product_manifest.product_tagline.blank?) or (@publisher_product_manifest.product_tagline.empty?) or (@publisher_product_manifest.product_tagline.nil?)) 
                  # @publisher_product_manifest_product_tagline = @publisher_product_manifest.product_tagline
                  # @b_product_tagline = true
                  gon.product_tagline = publisher_product_manifest.product_tagline
                  gon.b_product_tagline = true
                  gon.b_required_product_tagline = false              
              end
          
              # 3 versions
              # @b_versions = false
              gon.versions = "Version"
              gon.b_versions = false
              gon.b_required_versions = true                
              # @publisher_product_manifest_versions = "Versions"      
              if !((@publisher_product_manifest.versions.blank?) or (@publisher_product_manifest.versions.empty?) or (@publisher_product_manifest.versions.nil?)) 
                  # @publisher_product_manifest_versions = @publisher_product_manifest.versions
                  # @b_versions = true      
                  gon.versions = publisher_product_manifest.versions
                  gon.b_versions = true
                  gon.b_required_versions = false        
              end
          
          
              # 5 content_type
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
              # if !((@publisher_product_content_type.content_type_other.blank?) or (@publisher_product_content_type.content_type_other.empty?) or (@publisher_product_content_type.content_type_other.nil?))
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
              
          
          
              # 6 category_subject
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
          
          
              # 7 topic
              # @b_topic = true
              @b_required_topic = false                        
              if (@publisher_product_manifest.topic.blank?) or (@publisher_product_manifest.topic.empty?) or (@publisher_product_manifest.topic.nil?)
                # @b_topic = false
                @b_required_topic = true
              end
          
          
          
              # 6 by_review
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
          
          
          
              # 14 lesson_plan_subject
              @b_required_lesson_plan_subject = false    
              if (@publisher_product_manifest.lesson_plan_subject.blank?) or (@publisher_product_manifest.lesson_plan_subject.empty?) or (@publisher_product_manifest.lesson_plan_subject.nil?)
                @b_required_lesson_plan_subject = true
              end
              
          
              # 14 lesson_time
              @b_required_lesson_time = false    
              gon.time_per_lesson = @publisher_product_manifest.time_per_lesson
              gon.time_per_course = @publisher_product_manifest.time_per_course
              gon.lesson_time_hours = @publisher_product_manifest.lesson_time_hours
              gon.lesson_time_minutes = @publisher_product_manifest.lesson_time_minutes
              gon.course_time_months = @publisher_product_manifest.course_time_months
              gon.course_time_days = @publisher_product_manifest.course_time_days
          
              # if (@publisher_product_manifest.lesson_plan_subject.blank?) or (@publisher_product_manifest.lesson_plan_subject.empty?) or (@publisher_product_manifest.lesson_plan_subject.nil?)
                # @b_required_lesson_plan_subject = true
              # end
          
          
              # 7 platform
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
          
          
          
              # 7 enhancement_index
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
          
          
          
              # # 8 age_appropriate
              # a_appropriate_ages = Array.new
              # @appropriate_ages = return_all_dtab8lets
              # @appropriate_ages.each do |age_appropriate|
                # a_appropriate_ages.push(age_appropriate)
              # end
              # gon.appropriate_age = []
              # gon.appropriate_age_text = []    
              # gon.b_required_appropriate_age = true                                
              # if (@publisher_product_appropriate_age.age_appropriate_1 or
                  # @publisher_product_appropriate_age.age_appropriate_2 or
                  # @publisher_product_appropriate_age.age_appropriate_3)
                  # # @b_age_appropriate = true
                  # gon.b_required_appropriate_age = false
                  # b = @publisher_product_appropriate_age.age_appropriate_1
                  # gon.appropriate_age[0] = b
                  # if b
                    # gon.appropriate_age_text.push(a_appropriate_ages[0].col_1)                            
                  # end        
                  # b = @publisher_product_appropriate_age.age_appropriate_2
                  # gon.appropriate_age[1] = b
                  # if b
                    # gon.appropriate_age_text.push(a_appropriate_ages[1].col_1)                            
                  # end        
                  # b = @publisher_product_appropriate_age.age_appropriate_3
                  # gon.appropriate_age[2] = b
                  # if b
                    # gon.appropriate_age_text.push(a_appropriate_ages[2].col_1)                            
                  # end        
              # end
              
              # 8 age_appropriate
              a_appropriate_ages = Array.new
              @appropriate_ages = return_all_dtab8lets
              @appropriate_ages.each do |age_appropriate|
                a_appropriate_ages.push(age_appropriate)
              end
              gon.appropriate_age = []
              gon.appropriate_age_text = []    
              gon.b_required_appropriate_age = true                                
              if (@publisher_product_appropriate_age.age_appropriate_1 or
                  @publisher_product_appropriate_age.age_appropriate_2 or
                  @publisher_product_appropriate_age.age_appropriate_3 or
                  @publisher_product_appropriate_age.age_appropriate_4 or
                  @publisher_product_appropriate_age.age_appropriate_5 or
                  @publisher_product_appropriate_age.age_appropriate_6 or
                  @publisher_product_appropriate_age.age_appropriate_7 or
                  @publisher_product_appropriate_age.age_appropriate_8 or
                  @publisher_product_appropriate_age.age_appropriate_9 or
                  @publisher_product_appropriate_age.age_appropriate_10 or
                  @publisher_product_appropriate_age.age_appropriate_11 or
                  @publisher_product_appropriate_age.age_appropriate_12 or
                  @publisher_product_appropriate_age.age_appropriate_13 or
                  @publisher_product_appropriate_age.age_appropriate_14 or
                  @publisher_product_appropriate_age.age_appropriate_15 or
                  @publisher_product_appropriate_age.age_appropriate_16 or
                  @publisher_product_appropriate_age.age_appropriate_17 or
                  @publisher_product_appropriate_age.age_appropriate_adult)
                  
                  # @b_age_appropriate = true
                  gon.b_required_appropriate_age = false
          
                  b = @publisher_product_appropriate_age.age_appropriate_1
                  gon.appropriate_age[0] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[0].col_1)                            
                  end        
          
                  b = @publisher_product_appropriate_age.age_appropriate_2
                  gon.appropriate_age[1] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[1].col_1)                            
                  end        
          
                  b = @publisher_product_appropriate_age.age_appropriate_3
                  gon.appropriate_age[2] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[2].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_4
                  gon.appropriate_age[3] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[3].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_5
                  gon.appropriate_age[4] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[4].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_6
                  gon.appropriate_age[5] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[5].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_7
                  gon.appropriate_age[6] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[6].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_8
                  gon.appropriate_age[7] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[7].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_9
                  gon.appropriate_age[8] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[8].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_10
                  gon.appropriate_age[9] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[9].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_11
                  gon.appropriate_age[10] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[10].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_12
                  gon.appropriate_age[11] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[11].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_13
                  gon.appropriate_age[12] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[12].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_14
                  gon.appropriate_age[13] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[13].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_15
                  gon.appropriate_age[14] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[14].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_16
                  gon.appropriate_age[15] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[15].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_17
                  gon.appropriate_age[16] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[16].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_age.age_appropriate_adult
                  gon.appropriate_age[17] = b
                  if b
                    gon.appropriate_age_text.push(a_appropriate_ages[17].col_1)                            
                  end        
          
          
              end
              
              
              
          
              # # 9 appropriate_grade
              # a_appropriate_grades = Array.new
              # @appropriate_grades = return_all_dtab9lets
              # @appropriate_grades.each do |grade_appropriate|
                # a_appropriate_grades.push(grade_appropriate)
              # end
              # gon.appropriate_grade = []
              # gon.appropriate_grade_text = []    
              # gon.b_required_appropriate_grade = true                                
              # if (@publisher_product_appropriate_grade.grade_appropriate_1 or
                  # @publisher_product_appropriate_grade.grade_appropriate_2 or
                  # @publisher_product_appropriate_grade.grade_appropriate_3)
                  # # @b_grade_appropriate = true
                  # gon.b_required_appropriate_grade = false
                  # b = @publisher_product_appropriate_grade.grade_appropriate_1
                  # gon.appropriate_grade[0] = b
                  # if b
                    # gon.appropriate_grade_text.push(a_appropriate_grades[0].col_1)                            
                  # end        
                  # b = @publisher_product_appropriate_grade.grade_appropriate_2
                  # gon.appropriate_grade[1] = b
                  # if b
                    # gon.appropriate_grade_text.push(a_appropriate_grades[1].col_1)                            
                  # end        
                  # b = @publisher_product_appropriate_grade.grade_appropriate_3
                  # gon.appropriate_grade[2] = b
                  # if b
                    # gon.appropriate_grade_text.push(a_appropriate_grades[2].col_1)                            
                  # end        
              # end


              # 9 appropriate_grade
              a_appropriate_grades = Array.new
              @appropriate_grades = return_all_dtab9lets
              @appropriate_grades.each do |grade_appropriate|
                a_appropriate_grades.push(grade_appropriate)
              end
              gon.appropriate_grade = []
              gon.appropriate_grade_text = []    
              gon.b_required_appropriate_grade = true                                
              if (@publisher_product_appropriate_grade.grade_appropriate_1 or
                  @publisher_product_appropriate_grade.grade_appropriate_2 or
                  @publisher_product_appropriate_grade.grade_appropriate_3 or
                  @publisher_product_appropriate_grade.grade_appropriate_4 or
                  @publisher_product_appropriate_grade.grade_appropriate_5 or
                  @publisher_product_appropriate_grade.grade_appropriate_6 or
                  @publisher_product_appropriate_grade.grade_appropriate_7 or
                  @publisher_product_appropriate_grade.grade_appropriate_8 or
                  @publisher_product_appropriate_grade.grade_appropriate_9 or
                  @publisher_product_appropriate_grade.grade_appropriate_10 or
                  @publisher_product_appropriate_grade.grade_appropriate_11 or
                  @publisher_product_appropriate_grade.grade_appropriate_12 or
                  @publisher_product_appropriate_grade.grade_appropriate_13 or
                  @publisher_product_appropriate_grade.grade_appropriate_14)
                  
                  # @b_grade_appropriate = true
                  gon.b_required_appropriate_grade = false
          
                  b = @publisher_product_appropriate_grade.grade_appropriate_1
                  gon.appropriate_grade[0] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[0].col_1)                            
                  end        
          
                  b = @publisher_product_appropriate_grade.grade_appropriate_2
                  gon.appropriate_grade[1] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[1].col_1)                            
                  end        
          
                  b = @publisher_product_appropriate_grade.grade_appropriate_3
                  gon.appropriate_grade[2] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[2].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_4
                  gon.appropriate_grade[3] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[3].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_5
                  gon.appropriate_grade[4] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[4].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_6
                  gon.appropriate_grade[5] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[5].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_7
                  gon.appropriate_grade[6] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[6].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_8
                  gon.appropriate_grade[7] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[7].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_9
                  gon.appropriate_grade[8] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[8].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_10
                  gon.appropriate_grade[9] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[9].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_11
                  gon.appropriate_grade[10] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[10].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_12
                  gon.appropriate_grade[11] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[11].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_13
                  gon.appropriate_grade[12] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[12].col_1)                            
                  end        
        
                  b = @publisher_product_appropriate_grade.grade_appropriate_14
                  gon.appropriate_grade[13] = b
                  if b
                    gon.appropriate_grade_text.push(a_appropriate_grades[13].col_1)                            
                  end        
          
          
              end
          
          
          
              
              # 7 market_target
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
              
              
              
              # 9 pricing_model
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
              
              
              
              
              # 5 source_url
              if (@publisher_product_manifest.source_url.blank?) or (@publisher_product_manifest.source_url.empty?) or (@publisher_product_manifest.source_url.nil?)
                @b_source_url = false
              end
          
              
              # 7 updating_refresh_rate_index
              gon.updating_refresh_rate = []    
              if (@publisher_product_manifest.updating_refresh_rate.blank?) or (@publisher_product_manifest.updating_refresh_rate.empty?) or (@publisher_product_manifest.updating_refresh_rate.nil?)
                  @b_updating_refresh_rate = false
              else
                  @b_updating_refresh_rate = true
                  ar_updating_refresh_rate = Array.new
                  ar_updating_refresh_rate = @publisher_product_manifest.updating_refresh_rate.split(',')
                  gon.updating_refresh_rate = ar_updating_refresh_rate
              end
          
              # 7 updating_type_index
              gon.updating_type = []    
              if (@publisher_product_manifest.updating_type.blank?) or (@publisher_product_manifest.updating_type.empty?) or (@publisher_product_manifest.updating_type.nil?)
                  @b_updating_type = false
              else
                  @b_updating_type = true
                  ar_updating_type = Array.new
                  ar_updating_type = @publisher_product_manifest.updating_type.split(',')
                  gon.updating_type = ar_updating_type
              end
              
              # 7 character_index
              gon.character = []    
              if (@publisher_product_character.character_1 or
                  @publisher_product_character.character_2 or
                  @publisher_product_character.character_3 or
                  @publisher_product_character.character_4 or
                  @publisher_product_character.character_5 or
                  @publisher_product_character.character_6 or
                  @publisher_product_character.character_7 or
                  @publisher_product_character.character_8 or
                  @publisher_product_character.character_9 or
                  @publisher_product_character.character_10)
                  
                  @b_character = true
          
                  # gon.character[0] = false        
                  gon.character[1] = @publisher_product_character.character_1
                  gon.character[2] = @publisher_product_character.character_2
                  gon.character[3] = @publisher_product_character.character_3
                  gon.character[4] = @publisher_product_character.character_4
                  gon.character[5] = @publisher_product_character.character_5
                  gon.character[6] = @publisher_product_character.character_6
                  gon.character[7] = @publisher_product_character.character_7
                  gon.character[8] = @publisher_product_character.character_8
                  gon.character[9] = @publisher_product_character.character_9
                  gon.character[10] = @publisher_product_character.character_10
          
              end
              
              
          
          
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
          
              
              
              
              a_core_literacy_standards = Array.new
              
              @b_core_literacy_standard = true
              gon.core_literacy_standard = []
              gon.core_literacy_standard_text = []
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
          
          
              a_core_math_standards = Array.new
              
              @b_core_math_standard = true
              gon.core_math_standard = []
              gon.core_math_standard_text = []
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
              
              
              gon.reselling = @publisher_product_manifest.reselling
              
              gon.evaluation = @publisher_product_manifest.evaluation
          
              
              gon.allow_teacher_rating = @publisher_product_manifest.allow_teacher_rating
              
          
              a_user_rating = Array.new
              a_user_rating.push(@publisher_product_manifest.user_rating_1)   
              a_user_rating.push(@publisher_product_manifest.user_rating_2)   
              a_user_rating.push(@publisher_product_manifest.user_rating_3)   
          
              gon.user_rating = a_user_rating
          
              gon.allow_student_likes = @publisher_product_manifest.allow_student_likes
          
              gon.allow_comments = @publisher_product_manifest.allow_comments
              
              gon.poster_print_purchase = @publisher_product_manifest.poster_print_purchase
          
              gon.poster_pin_web = @publisher_product_manifest.poster_pin_web
          
              gon.poster_pin_purchase = @publisher_product_manifest.poster_pin_purchase
          
          
          
              gon.corporate_logo_url = "www.GenericCorporation.com"
              gon.b_corporate_logo_url = false
              # gon.b_required_corporate_logo_url = true
              if !((publisher_product_manifest.corporate_logo_url.blank?) or (publisher_product_manifest.corporate_logo_url.empty?) or (publisher_product_manifest.corporate_logo_url.nil?)) 
                  gon.corporate_logo_url = publisher_product_manifest.corporate_logo_url
                  gon.b_corporate_logo_url = true
                  # gon.b_required_name_product = false
              end
          
          
          
          
          
          
          
          
              gon.research = []
              gon.research[0] = @publisher_product_manifest.research_1
              gon.research[1] = @publisher_product_manifest.research_2
          
          
              gon.public_relations = []
              gon.public_relations[0] = @publisher_product_manifest.pr_updates_1
              gon.public_relations[1] = @publisher_product_manifest.pr_updates_2
              gon.public_relations[2] = @publisher_product_manifest.pr_updates_3
          
          
          
              gon.metrics = []
              gon.metrics[0] = @publisher_product_manifest.metrics_1
              gon.metrics[1] = @publisher_product_manifest.metrics_2
              gon.metrics[2] = @publisher_product_manifest.metrics_3
              gon.metrics[3] = @publisher_product_manifest.metrics_4
              gon.metrics[4] = @publisher_product_manifest.metrics_5
          
          
          
          
              gon.updated = @publisher_product_manifest.updated_at.to_s(:long)
          

          else
              Rails.logger.info("publisher was nil")
              redirect_to '/Products'
          end
      else
          Rails.logger.info("publisher_product was nil")
          redirect_to '/Products'
      end


    
  end
  






















  
  def show
    render text: 'publisher_product_descriptions show'
  end



  #1 name_product  
  def update_name_product

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    name_product = h_obj[:name_product]

    # render text: name_product

    # publisher = Publisher.find(publisher_id)    
    # publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product_id).first
    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:name_product] = name_product

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    b_name_product = false
    b_required = true
    publisher_product_description_name_product = "Product Name"      
    if !((publisher_product_description_updated.name_product.blank?) or (publisher_product_description_updated.name_product.empty?) or (publisher_product_description_updated.name_product.nil?)) 
        publisher_product_description_name_product = publisher_product_description_updated.name_product
        b_name_product = true
        b_required = false      
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_name_product => b_name_product, 
                                      :name_product => publisher_product_description_name_product,
                                      :b_required => b_required,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} } 

                  
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
    
  end  



  #2 product_tagline  
  def update_product_tagline

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    product_tagline = h_obj[:product_tagline]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:product_tagline] = product_tagline

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    b_product_tagline = false
    b_required = true
    publisher_product_description_product_tagline = "Tagline"      
    if !((publisher_product_description_updated.product_tagline.blank?) or (publisher_product_description_updated.product_tagline.empty?) or (publisher_product_description_updated.product_tagline.nil?)) 
        publisher_product_description_product_tagline = publisher_product_description_updated.product_tagline
        b_product_tagline = true
        b_required = false      
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_product_tagline => b_product_tagline, 
                                      :product_tagline => publisher_product_description_product_tagline,
                                      :b_required => b_required,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
    end
    
    
  end  


  #3 versions  
  def update_versions

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    versions = h_obj[:versions]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:versions] = versions

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    b_versions = false
    b_required = true
    publisher_product_description_versions = "Versions"      
    if !((publisher_product_description_updated.versions.blank?) or (publisher_product_description_updated.versions.empty?) or (publisher_product_description_updated.versions.nil?)) 
        publisher_product_description_versions = publisher_product_description_updated.versions
        b_versions = true
        b_required = false      
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_versions => b_versions, 
                                      :versions => publisher_product_description_versions,
                                      :b_required => b_required,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
    end

    
  end  



  def update_story_1
    
      ar = params[:publisher_product_manifest]
      h_obj = Hash.new
      ar.each do |obj|
        h_obj = obj
      end

      name_product = h_obj[:name_product]
      product_tagline = h_obj[:product_tagline]
      versions = h_obj[:versions]
      description = h_obj[:description]
  
      b_name_product = false
      b_product_tagline = false
      b_versions = false
      b_description = false
  
      # Rails.logger.info("in update @@publisher_product_id = " + @@publisher_product_id.to_s)
  
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end

      Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)

      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
      if !publisher_product.nil?
          publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update_1 = Hash.new
              h_update_1[:name_product] = name_product
              h_update_1[:product_tagline] = product_tagline
              h_update_1[:versions] = versions
              if publisher_product_manifest.update_attributes(h_update_1)
                #
              else
                  Rails.logger.info("publisher_product_manifest update failed")
              end
          else
              Rails.logger.info("publisher_product_manifest was nil")
          end 
          publisher_product_description = publisher_product.publisher_product_description rescue nil
          if !publisher_product_description.nil?
              h_update_2 = Hash.new
              h_update_2[:description_text] = description
              if publisher_product_description.update_attributes(h_update_2)
                #
              else
                  Rails.logger.info("publisher_product_description update failed")
              end
          else
              Rails.logger.info("publisher_product_description was nil")
          end
          
      else
         Rails.logger.info("publisher_product was nil")
      end
      
      publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
      if !publisher_product_manifest.nil?
          if !((publisher_product_manifest.name_product.blank?) or (publisher_product_manifest.name_product.empty?) or (publisher_product_manifest.name_product.nil?))
              b_name_product = true
          end
          if !((publisher_product_manifest.product_tagline.blank?) or (publisher_product_manifest.product_tagline.empty?) or (publisher_product_manifest.product_tagline.nil?))
              b_product_tagline = true
          end  
          if !((publisher_product_manifest.versions.blank?) or (publisher_product_manifest.versions.empty?) or (publisher_product_manifest.versions.nil?))
              b_versions = true
          end              
      else
          Rails.logger.info("publisher_product_manifest was nil")
      end

      publisher_product_description = publisher_product.publisher_product_description rescue nil
      if !publisher_product_description.nil?
          if !((publisher_product_description.description_text.blank?) or (publisher_product_description.description_text.empty?) or (publisher_product_description.description_text.nil?))
              b_description = true
          end
      else
          Rails.logger.info("publisher_product_manifest was nil")
      end
      
      respond_to do |format|
          format.html {}
          format.json { render :json => { :name_product => name_product,
                                          :b_name_product => b_name_product, 
                                          :product_tagline => product_tagline,
                                          :b_product_tagline => b_product_tagline,
                                          :versions => versions,
                                          :b_versions => b_versions,
                                          :description => description,
                                          :b_description => b_description,                                          
                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
      end
      
      # product_tagline = h_obj[:product_tagline]
      # publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
      # h_update = Hash.new
      # h_update[:product_tagline] = product_tagline
      # if publisher_product_description.update_attributes(h_update)
        # #
      # else
        # # Rails.logger.info(@user.errors.messages.inspect)
      # end
      # publisher_product_description = nil
      # publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
      # b_product_tagline = false
      # b_required = true
      # publisher_product_description_product_tagline = "Tagline"      
      # if !((publisher_product_description_updated.product_tagline.blank?) or (publisher_product_description_updated.product_tagline.empty?) or (publisher_product_description_updated.product_tagline.nil?)) 
          # publisher_product_description_product_tagline = publisher_product_description_updated.product_tagline
          # b_product_tagline = true
          # b_required = false      
      # end
      # respond_to do |format|
        # format.html {}
        # format.json { render :json => { :b_product_tagline => b_product_tagline, 
                                        # :product_tagline => publisher_product_description_product_tagline,
                                        # :b_required => b_required,
                                        # :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      # end
    
    
  end


  def update_story_4
    
      ar = params[:publisher_product_manifest]
      h_obj = Hash.new
      ar.each do |obj|
        h_obj = obj
      end

      corporate_logo_url = h_obj[:corporate_logo_url]
  
      b_corporate_logo_url = false
  
      # Rails.logger.info("in update @@publisher_product_id = " + @@publisher_product_id.to_s)
  
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end

      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
      if !publisher_product.nil?
          publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
          if !publisher_product_manifest.nil?
              h_update_1 = Hash.new
              h_update_1[:corporate_logo_url] = corporate_logo_url
              if publisher_product_manifest.update_attributes(h_update_1)
                #
              else
                  Rails.logger.info("publisher_product_manifest update failed")
              end
          else
              Rails.logger.info("publisher_product_manifest was nil")
          end 
      else
         Rails.logger.info("publisher_product was nil")
      end
      
      publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
      if !publisher_product_manifest.nil?
          if !((publisher_product_manifest.corporate_logo_url.blank?) or (publisher_product_manifest.corporate_logo_url.empty?) or (publisher_product_manifest.corporate_logo_url.nil?))
              b_corporate_logo_url = true
          end
      else
          Rails.logger.info("publisher_product_manifest was nil")
      end

      
      respond_to do |format|
          format.html {}
          format.json { render :json => { :corporate_logo_url => corporate_logo_url,
                                          :b_corporate_logo_url => b_corporate_logo_url, 
                                          :updated => publisher_product_manifest.updated_at.to_s(:long) } }
      end
      
    
  end












  # #4 description - story 2
  # def update_story_2
      # @publisher_product_description_description_text = ""
      # description_text = params[:publisher_product_description][:description_text]
      # Rails.logger.info('description_text = ' + description_text)
      # h_publisher_product_description = Hash.new
      # h_publisher_product_description[:description_text] = description_text
      # publisher_product = current_user.publisher.publisher_products.where("id = ?", @@publisher_product_id).first rescue nil
      # if !publisher_product.nil?
          # publisher_product_description = publisher_product.publisher_product_description rescue nil
          # if !publisher_product_description.nil?
              # if publisher_product_description.update_attributes(h_publisher_product_description)
                  # @publisher_product_description_description_text = publisher_product_description.description_text 
              # else
                  # Rails.logger.info('publisher_product_description update failed')
              # end
          # else
              # Rails.logger.info('publisher_product_description = nil')      
          # end
      # else
          # Rails.logger.info('publisher_product was nil')
      # end
  # end  



  #5 content_type
  def update_content_type

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    content_type = h_obj[:content_type]
    content_type_other = h_obj[:content_type_other]
    content_type_other_b = h_obj[:content_type_other_b]
    
    ar_content_type = Array.new
    ar_content_type = content_type.split(',')
    len = ar_content_type.length

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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_content_type = PublisherProductContentType.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_content_type.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_content_type_id = publisher_product_content_type.id
    publisher_product_content_type = nil
    publisher_product_content_type_updated = PublisherProductContentType.find(publisher_product_content_type_id)
    
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
                                      :updated => publisher_product_content_type_updated.updated_at.to_s(:long) } }
    end

    
  end  




  #7 platform
  def update_platform

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    platform = h_obj[:platform]
    platform_other = h_obj[:platform_other]
    platform_other_b = h_obj[:platform_other_b]
    
    ar_platform = Array.new
    ar_platform = platform.split(',')
    # len = ar_platform.length

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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_platform = PublisherProductPlatform.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_platform.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_platform_id = publisher_product_platform.id
    publisher_product_platform = nil
    publisher_product_platform_updated = PublisherProductPlatform.find(publisher_product_platform_id)
    
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
                                      :updated => publisher_product_platform_updated.updated_at.to_s(:long) } }
      
      # format.json { render :json => { :b_has_platform => b_has_platform,
                                      # :g_platform => gon.platform,
                                      # :g_platform_text => gon.platform_text,
                                      # :b_required => b_required,                                      
                                      # :updated => publisher_product_platform_updated.updated_at.to_s(:long) } }
    end
    
  end  




  #7 file_type
  def update_file_type

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    file_type = h_obj[:file_type]
    file_type_other = h_obj[:file_type_other]
    file_type_other_b = h_obj[:file_type_other_b]
    
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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_file_type = PublisherProductFileType.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_file_type.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_file_type_id = publisher_product_file_type.id
    publisher_product_file_type = nil
    publisher_product_file_type_updated = PublisherProductFileType.find(publisher_product_file_type_id)
    
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
                                      :updated => publisher_product_file_type_updated.updated_at.to_s(:long) } }
      
      # format.json { render :json => { :g_file_type => gon.file_type,
                                      # :g_file_type_text => gon.file_type_text,
                                      # :b_required => b_required,
                                      # :updated => publisher_product_file_type_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  



  #6 by_review
  def update_by_review

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    by_review = h_obj[:by_review]
    by_review_other = h_obj[:by_review_other]
    by_review_other_b = h_obj[:by_review_other_b]
    
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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_by_review = PublisherProductByReview.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_by_review.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_by_review_id = publisher_product_by_review.id
    publisher_product_by_review = nil
    publisher_product_by_review_updated = PublisherProductByReview.find(publisher_product_by_review_id)
    
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
                                      :updated => publisher_product_by_review_updated.updated_at.to_s(:long) } }
      
      # format.json { render :json => { :b_has_by_review => b_has_by_review,
                                      # :g_by_review => gon.by_review,
                                      # :g_by_review_text => gon.by_review_text,
                                      # :b_required => b_required,                                      
                                      # :updated => publisher_product_by_review_updated.updated_at.to_s(:long) } }
    end

    
  end  

  
  
  
  #7 enhancement
  def update_enhancement

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    enhancement = h_obj[:enhancement]
    enhancement_other = h_obj[:enhancement_other]
    enhancement_other_b = h_obj[:enhancement_other_b]    
    
    ar_enhancement = Array.new
    ar_enhancement = enhancement.split(',')
    # len = ar_enhancement.length

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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_enhancement = PublisherProductEnhancement.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_enhancement.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_enhancement_id = publisher_product_enhancement.id
    publisher_product_enhancement = nil
    publisher_product_enhancement_updated = PublisherProductEnhancement.find(publisher_product_enhancement_id)
    
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
                                      :updated => publisher_product_enhancement_updated.updated_at.to_s(:long) } }
      
      # format.json { render :json => { :g_enhancement => gon.enhancement,
                                      # :g_enhancement_text => gon.enhancement_text,
                                      # :b_required => b_required,
                                      # :updated => publisher_product_enhancement_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  














  #6 category_subject
  def update_category_subject

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    category_subject = h_obj[:category_subject]
    category_subject_other = h_obj[:category_subject_other]
    category_subject_other_b = h_obj[:category_subject_other_b]
    
    
    ar_category_subject = Array.new
    ar_category_subject = category_subject.split(',')
    len = ar_category_subject.length

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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_category_subject = PublisherProductCategorySubject.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_category_subject.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_category_subject_id = publisher_product_category_subject.id
    publisher_product_category_subject = nil
    publisher_product_category_subject_updated = PublisherProductCategorySubject.find(publisher_product_category_subject_id)
    
    gon.category_subject = []
    
    # gon.category_subject[0] = publisher_product_category_subject_updated.category_subject_1
    # gon.category_subject[1] = publisher_product_category_subject_updated.category_subject_2
    # gon.category_subject[2] = publisher_product_category_subject_updated.category_subject_3
    # gon.category_subject[3] = publisher_product_category_subject_updated.category_subject_4

    b_has_category_subject = false
    a_category_subjects = Array.new
    # @a_publisher_product_category_subjects = Array.new    
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
                                      :updated => publisher_product_category_subject_updated.updated_at.to_s(:long) } }
      
      # format.json { render :json => { :b_has_category_subject => b_has_category_subject,
                                      # :g_category_subject => gon.category_subject,
                                      # :g_category_subject_text => gon.category_subject_text,
                                      # :b_required => b_required,                                      
                                      # :updated => publisher_product_category_subject_updated.updated_at.to_s(:long) } }
    end
    
  end  




  #7 topic
  def update_topic

    # ar = params[:publisher_product_description]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    # topic = h_obj[:topic]

    publisher_product_description_id = params[:publisher_product_description_id]
    topic = params[:topic]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:topic] = topic

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    @publisher_product_description_topic = publisher_product_description_updated.topic
    
    # @b_description = false
    @b_required_topic = false                    
    if (publisher_product_description_updated.topic.blank?) or (publisher_product_description_updated.topic.empty?) or (publisher_product_description_updated.topic.nil?)
        # @b_description = true
        @b_required_topic = true              
    end

    
    respond_to do |format|
      format.html {}
      format.js
      # format.json { render :json => { :topic => publisher_product_description_updated.topic,
                                      # :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  


  #14 lesson_plan_subject
  def update_lesson_plan_subject

    # ar = params[:publisher_product_description]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    # lesson_plan_subject = h_obj[:lesson_plan_subject]

    publisher_product_description_id = params[:publisher_product_description_id]
    lesson_plan_subject = params[:topic]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:lesson_plan_subject] = lesson_plan_subject

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    @publisher_product_description_lesson_plan_subject = publisher_product_description_updated.lesson_plan_subject

    @b_required_lesson_plan_subject = false    
    if (publisher_product_description_updated.lesson_plan_subject.blank?) or (publisher_product_description_updated.lesson_plan_subject.empty?) or (publisher_product_description_updated.lesson_plan_subject.nil?)
      @b_required_lesson_plan_subject = true
    end
    
    respond_to do |format|
      format.html {}
      format.js
      # format.json { render :json => { :lesson_plan_subject => publisher_product_description_updated.lesson_plan_subject,
                                      # :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  




  #14 lesson_time
  def update_lesson_time

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    time_per_lesson = h_obj[:time_per_lesson]
    lesson_time_hours = h_obj[:lesson_time_hours]
    lesson_time_minutes = h_obj[:lesson_time_minutes]
    time_per_course = h_obj[:time_per_course]
    course_time_months = h_obj[:course_time_months]
    course_time_days = h_obj[:course_time_days]
    
    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:time_per_lesson] = time_per_lesson
    h_update[:lesson_time_hours] = lesson_time_hours
    h_update[:lesson_time_minutes] = lesson_time_minutes
    h_update[:time_per_course] = time_per_course
    h_update[:course_time_months] = course_time_months
    h_update[:course_time_days] = course_time_days

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    

    # @b_required_lesson_plan_subject = false    
    # if (publisher_product_description_updated.lesson_plan_subject.blank?) or (publisher_product_description_updated.lesson_plan_subject.empty?) or (publisher_product_description_updated.lesson_plan_subject.nil?)
      # @b_required_lesson_plan_subject = true
    # end
    
    respond_to do |format|
      format.html {}
      # format.js
      format.json { render :json => { :time_per_lesson => publisher_product_description_updated.time_per_lesson,
                                      :lesson_time_hours => publisher_product_description_updated.lesson_time_hours,
                                      :lesson_time_minutes => publisher_product_description_updated.lesson_time_minutes,
                                      :time_per_course => publisher_product_description_updated.time_per_course,
                                      :course_time_months => publisher_product_description_updated.course_time_months,
                                      :course_time_days => publisher_product_description_updated.course_time_days,                                      
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
    
  end  


    
  

  #7 appropriate_age
  def update_appropriate_age

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    appropriate_age = h_obj[:appropriate_age]
    
    ar_appropriate_ages = Array.new
    ar_appropriate_ages = appropriate_age.split(',')
    # len = ar_age_appropriate.length

    h_update = Hash.new
    h_update[:age_appropriate_1] = false
    h_update[:age_appropriate_2] = false
    h_update[:age_appropriate_3] = false
    
    ar_appropriate_ages.each do |age|
      
      case age.to_s  
        when "1"
          h_update[:age_appropriate_1] = true
        when "2"
          h_update[:age_appropriate_2] = true
        when "3"
          h_update[:age_appropriate_3] = true
        else
          #        
      end
      
    end


    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_appropriate_age = PublisherProductAppropriateAge.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_appropriate_age.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_appropriate_age_id = publisher_product_appropriate_age.id
    publisher_product_appropriate_age = nil
    publisher_product_appropriate_age_updated = PublisherProductAppropriateAge.find(publisher_product_appropriate_age_id)
    
    # gon.age_appropriate = []
    # gon.age_appropriate[1] = publisher_product_appropriate_age_updated.age_appropriate_1
    # gon.age_appropriate[2] = publisher_product_appropriate_age_updated.age_appropriate_2
    # gon.age_appropriate[3] = publisher_product_appropriate_age_updated.age_appropriate_3

    a_appropriate_ages = Array.new
    appropriate_ages = return_all_dtab8lets
    appropriate_ages.each do |appro_age|
      a_appropriate_ages.push(appro_age)
    end
    gon.appropriate_age = []
    gon.appropriate_age_text = []    
    b_required = true
    if (publisher_product_appropriate_age_updated.age_appropriate_1 or
        publisher_product_appropriate_age_updated.age_appropriate_2 or
        publisher_product_appropriate_age_updated.age_appropriate_3)

        # b_has_enhancement = true
        b_required = false
            
        b = publisher_product_appropriate_age_updated.age_appropriate_1
        gon.appropriate_age[0] = b
        if b
          gon.appropriate_age_text.push(a_appropriate_ages[0].col_1)                            
        end        

        b = publisher_product_appropriate_age_updated.age_appropriate_2
        gon.appropriate_age[1] = b
        if b
          gon.appropriate_age_text.push(a_appropriate_ages[1].col_1)                            
        end        

        b = publisher_product_appropriate_age_updated.age_appropriate_3
        gon.appropriate_age[2] = b
        if b
          gon.appropriate_age_text.push(a_appropriate_ages[2].col_1)                            
        end        

        
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :g_appropriate_age => gon.appropriate_age,
                                      :g_appropriate_age_text => gon.appropriate_age_text,
                                      :b_required => b_required,
                                      :updated => publisher_product_appropriate_age_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end


    
  end  





  #8 appropriate_grade
  def update_appropriate_grade

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    appropriate_grade = h_obj[:appropriate_grade]
    
    ar_appropriate_grades = Array.new
    ar_appropriate_grades = appropriate_grade.split(',')
    # len = ar_grade_appropriate.length

    h_update = Hash.new
    h_update[:grade_appropriate_1] = false
    h_update[:grade_appropriate_2] = false
    h_update[:grade_appropriate_3] = false
    
    ar_appropriate_grades.each do |grade|
      
      case grade.to_s  
        when "1"
          h_update[:grade_appropriate_1] = true
        when "2"
          h_update[:grade_appropriate_2] = true
        when "3"
          h_update[:grade_appropriate_3] = true
        else
          #        
      end
      
    end


    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_appropriate_grade = PublisherProductAppropriateGrade.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_appropriate_grade.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messgrades.inspect)
    end

    publisher_product_appropriate_grade_id = publisher_product_appropriate_grade.id
    publisher_product_appropriate_grade = nil
    publisher_product_appropriate_grade_updated = PublisherProductAppropriateGrade.find(publisher_product_appropriate_grade_id)
    
    # gon.grade_appropriate = []
    # gon.grade_appropriate[1] = publisher_product_appropriate_grade_updated.grade_appropriate_1
    # gon.grade_appropriate[2] = publisher_product_appropriate_grade_updated.grade_appropriate_2
    # gon.grade_appropriate[3] = publisher_product_appropriate_grade_updated.grade_appropriate_3

    a_appropriate_grades = Array.new
    appropriate_grades = return_all_dtab9lets
    appropriate_grades.each do |appro_grade|
      a_appropriate_grades.push(appro_grade)
    end
    gon.appropriate_grade = []
    gon.appropriate_grade_text = []    
    b_required = true
    if (publisher_product_appropriate_grade_updated.grade_appropriate_1 or
        publisher_product_appropriate_grade_updated.grade_appropriate_2 or
        publisher_product_appropriate_grade_updated.grade_appropriate_3)

        # b_has_enhancement = true
        b_required = false
            
        b = publisher_product_appropriate_grade_updated.grade_appropriate_1
        gon.appropriate_grade[0] = b
        if b
          gon.appropriate_grade_text.push(a_appropriate_grades[0].col_1)                            
        end        

        b = publisher_product_appropriate_grade_updated.grade_appropriate_2
        gon.appropriate_grade[1] = b
        if b
          gon.appropriate_grade_text.push(a_appropriate_grades[1].col_1)                            
        end        

        b = publisher_product_appropriate_grade_updated.grade_appropriate_3
        gon.appropriate_grade[2] = b
        if b
          gon.appropriate_grade_text.push(a_appropriate_grades[2].col_1)                            
        end        

        
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :g_appropriate_grade => gon.appropriate_grade,
                                      :g_appropriate_grade_text => gon.appropriate_grade_text,
                                      :b_required => b_required,
                                      :updated => publisher_product_appropriate_grade_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end


    
  end  



  # #7 grade_appropriate
  # def update_grade_appropriate
# 
    # ar = params[:publisher_product_description]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    # grade_appropriate = h_obj[:grade_appropriate]
#     
    # ar_grade_appropriate = Array.new
    # ar_grade_appropriate = grade_appropriate.split(',')
    # len = ar_grade_appropriate.length
# 
    # h_update = Hash.new
    # h_update[:grade_appropriate_1] = false
    # h_update[:grade_appropriate_2] = false
    # h_update[:grade_appropriate_3] = false
    # h_update[:grade_appropriate_4] = false
    # h_update[:grade_appropriate_5] = false
    # h_update[:grade_appropriate_6] = false
    # h_update[:grade_appropriate_7] = false
    # h_update[:grade_appropriate_8] = false
    # h_update[:grade_appropriate_9] = false
    # h_update[:grade_appropriate_10] = false
    # h_update[:grade_appropriate_11] = false
    # h_update[:grade_appropriate_12] = false
    # h_update[:grade_appropriate_13] = false
    # h_update[:grade_appropriate_14] = false
    # h_update[:grade_appropriate_15] = false
    # h_update[:grade_appropriate_16] = false
#     
    # ar_grade_appropriate.each do |grade|
#       
      # case grade.to_s  
        # when "1"
          # h_update[:grade_appropriate_1] = true
        # when "2"
          # h_update[:grade_appropriate_2] = true
        # when "3"
          # h_update[:grade_appropriate_3] = true
        # when "4"
          # h_update[:grade_appropriate_4] = true
        # when "5"
          # h_update[:grade_appropriate_5] = true
        # when "6"
          # h_update[:grade_appropriate_6] = true
        # when "7"
          # h_update[:grade_appropriate_7] = true
        # when "8"
          # h_update[:grade_appropriate_8] = true
        # when "9"
          # h_update[:grade_appropriate_9] = true
        # when "10"
          # h_update[:grade_appropriate_10] = true
        # when "11"
          # h_update[:grade_appropriate_11] = true
        # when "12"
          # h_update[:grade_appropriate_12] = true
        # when "13"
          # h_update[:grade_appropriate_13] = true
        # when "14"
          # h_update[:grade_appropriate_14] = true
        # when "15"
          # h_update[:grade_appropriate_15] = true
        # when "16"
          # h_update[:grade_appropriate_16] = true
        # else
          # #        
      # end
#       
    # end
# 
    # # @info1 = Rails.logger.info "clyde in update_name_first"
    # # @info2 = Rails.logger.info h_obj
# 
    # # h_update = Hash.new
# 
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id
# 
    # publisher_product_appropriate_grade = PublisherProductAppropriateGrade.where("publisher_product_id = ?", publisher_product_id).first
# 
    # if publisher_product_appropriate_grade.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_appropriate_grade_id = publisher_product_appropriate_grade.id
    # publisher_product_appropriate_grade = nil
    # publisher_product_appropriate_grade_updated = PublisherProductAppropriateGrade.find(publisher_product_appropriate_grade_id)
#     
    # gon.grade_appropriate = []
#     
    # gon.grade_appropriate[1] = publisher_product_appropriate_grade_updated.grade_appropriate_1
    # gon.grade_appropriate[2] = publisher_product_appropriate_grade_updated.grade_appropriate_2
    # gon.grade_appropriate[3] = publisher_product_appropriate_grade_updated.grade_appropriate_3
    # gon.grade_appropriate[4] = publisher_product_appropriate_grade_updated.grade_appropriate_4
    # gon.grade_appropriate[5] = publisher_product_appropriate_grade_updated.grade_appropriate_5
    # gon.grade_appropriate[6] = publisher_product_appropriate_grade_updated.grade_appropriate_6
    # gon.grade_appropriate[7] = publisher_product_appropriate_grade_updated.grade_appropriate_7
    # gon.grade_appropriate[8] = publisher_product_appropriate_grade_updated.grade_appropriate_8 
    # gon.grade_appropriate[9] = publisher_product_appropriate_grade_updated.grade_appropriate_9 
    # gon.grade_appropriate[10] = publisher_product_appropriate_grade_updated.grade_appropriate_10 
    # gon.grade_appropriate[11] = publisher_product_appropriate_grade_updated.grade_appropriate_11 
    # gon.grade_appropriate[12] = publisher_product_appropriate_grade_updated.grade_appropriate_12 
    # gon.grade_appropriate[13] = publisher_product_appropriate_grade_updated.grade_appropriate_13 
    # gon.grade_appropriate[14] = publisher_product_appropriate_grade_updated.grade_appropriate_14 
    # gon.grade_appropriate[15] = publisher_product_appropriate_grade_updated.grade_appropriate_15 
    # gon.grade_appropriate[16] = publisher_product_appropriate_grade_updated.grade_appropriate_16 
# 
    # b_has_grade_appropriate = false
#     
    # if (publisher_product_appropriate_grade_updated.grade_appropriate_1 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_2 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_3 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_4 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_5 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_6 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_7 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_8 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_9 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_10 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_11 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_12 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_13 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_14 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_15 or
        # publisher_product_appropriate_grade_updated.grade_appropriate_16)
#         
        # b_has_grade_appropriate = true
#         
#         
    # end
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :b_has_grade_appropriate => b_has_grade_appropriate,
                                      # :g_updated => gon.grade_appropriate,
                                      # :updated => publisher_product_appropriate_grade_updated.updated_at.to_s(:long) } }
    # end
# 
#     
  # end  

























  #7 market_target
  def update_market_target

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    market_target = h_obj[:market_target]
    
    ar_market_target = Array.new
    ar_market_target = market_target.split(',')
    # len = ar_market_target.length

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
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_market_target = PublisherProductMarketTarget.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_market_target.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_market_target_id = publisher_product_market_target.id
    publisher_product_market_target = nil
    publisher_product_market_target_updated = PublisherProductMarketTarget.find(publisher_product_market_target_id)
    
    
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
        
        # @b_market_target_index = true        
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
    
    # gon.market_target[1] = publisher_product_market_target_updated.market_target_1
    # gon.market_target[2] = publisher_product_market_target_updated.market_target_2

    # b_has_market_target = false
    
    # if (publisher_product_market_target_updated.market_target_1 or
        # publisher_product_market_target_updated.market_target_2)
        # # b_has_market_target = true
    # end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :g_market_target => gon.market_target,
                                      :g_market_target_text => gon.market_target_text,
                                      :b_required => b_required,
                                      :updated => publisher_product_market_target_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  




  #7 pricing_model
  def update_pricing_model

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    pricing_model = h_obj[:pricing_model]
    
    ar_pricing_model = Array.new
    ar_pricing_model = pricing_model.split(',')
    len = ar_pricing_model.length

    h_update = Hash.new
    h_update[:pricing_model_1] = false
    h_update[:pricing_model_2] = false
    h_update[:pricing_model_3] = false
    
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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_pricing_model = PublisherProductPricingModel.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_pricing_model.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_pricing_model_id = publisher_product_pricing_model.id
    publisher_product_pricing_model = nil
    publisher_product_pricing_model_updated = PublisherProductPricingModel.find(publisher_product_pricing_model_id)
    
    
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
      format.json { render :json => { :g_pricing_model => gon.pricing_model,
                                      :g_pricing_model_text => gon.pricing_model_text,
                                      :b_required => b_required,
                                      :updated => publisher_product_pricing_model_updated.updated_at.to_s(:long) } }
    end
    
    
  end  






  #7 price
  def update_price

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
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

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id
    publisher_product_price = PublisherProductPrice.where("publisher_product_id = ?", publisher_product_id).first
    if publisher_product_price.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_price_id = publisher_product_price.id
    publisher_product_price = nil
    publisher_product_price_updated = PublisherProductPrice.find(publisher_product_price_id)
    
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
        
    # end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :g_price => gon.price,
                                      :b_required => b_required,
                                      :updated => publisher_product_price_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  





  #7 core_literacy_standard
  def update_core_literacy_standard

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    core_literacy_standard = h_obj[:core_literacy_standard]
    
    PublisherProductCoreLiteracyStandard.delete_record(publisher_product_id.to_s)

    ar_core_literacy_standards = Array.new
    ar_core_literacy_standards = core_literacy_standard.split(',')
    # len = ar_core_literacy_standard.length
    
    ar_core_literacy_standards.each do |i|

      h_new = Hash.new
      h_new[:publisher_id] = publisher_id
      h_new[:publisher_product_id] = publisher_product_id
      h_new[:id_standard] = i.to_i
      
      publisher_product_core_literacy_standard = PublisherProductCoreLiteracyStandard.new(h_new)
      
      if publisher_product_core_literacy_standard.save
        #
      else
        #
      end
      
      publisher_product_core_literacy_standard = nil
      
    end
    
    
    publisher_product_core_literacy_standards_updated = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC")
    core_literacy_standards = CoreLiteracyStandard.order(sort_column_core_literacy + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
    
    # date_0 = Time.zone.parse('2000-01-01 00:00:00')
    # publisher_product_core_literacy_standard_updated.updated_at = date_0
    
    updated = nil
    b_updated = false
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
      b_updated = true
      updated = publisher_product_core_literacy_standards_updated[0].updated_at.to_s(:long)
    else
      #
    end
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :g_core_literacy_standard => gon.core_literacy_standard,
                                      :g_core_literacy_standard_text => gon.core_literacy_standard_text,
                                      :b_updated => b_updated,
                                      :updated => updated } }

      # format.json { render :json => {} }

    end

  end







  #7 core_math_standard
  def update_core_math_standard

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    core_math_standard = h_obj[:core_math_standard]
    
    PublisherProductCoreMathStandard.delete_record(publisher_product_id.to_s)

    ar_core_math_standards = Array.new
    ar_core_math_standards = core_math_standard.split(',')
    # len = ar_core_math_standard.length
    
    ar_core_math_standards.each do |i|

      h_new = Hash.new
      h_new[:publisher_id] = publisher_id
      h_new[:publisher_product_id] = publisher_product_id
      h_new[:id_standard] = i.to_i
      
      publisher_product_core_math_standard = PublisherProductCoreMathStandard.new(h_new)
      
      if publisher_product_core_math_standard.save
        #
      else
        #
      end
      
      publisher_product_core_math_standard = nil
      
    end
    
    
    publisher_product_core_math_standards_updated = PublisherProductCoreMathStandard.where("publisher_product_id = ?", publisher_product_id).except('order').order("id ASC")
    core_math_standards = CoreMathStandard.order(sort_column_core_math + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
    
    # date_0 = Time.zone.parse('2000-01-01 00:00:00')
    # publisher_product_core_math_standard_updated.updated_at = date_0
    
    updated = nil
    b_updated = false
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
      b_updated = true
      updated = publisher_product_core_math_standards_updated[0].updated_at.to_s(:long)
    else
      #
    end
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :g_core_math_standard => gon.core_math_standard,
                                      :g_core_math_standard_text => gon.core_math_standard_text,
                                      :b_updated => b_updated,
                                      :updated => updated } }

      # format.json { render :json => {} }

    end

  end



















  #5 source_url
  def update_source_url

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    source_url = h_obj[:source_url]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:source_url] = source_url

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :source_url => publisher_product_description_updated.source_url,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  



  #7 updating_refresh_rate
  def update_updating_refresh_rate

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    updating_refresh_rate = h_obj[:updating_refresh_rate]
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:updating_refresh_rate] = updating_refresh_rate

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)

    gon.updating_refresh_rate = []
    ar_updating_refresh_rate = Array.new

    ar_updating_refresh_rate = publisher_product_description_updated.updating_refresh_rate.split(',')
    gon.updating_refresh_rate = ar_updating_refresh_rate
    
    b_has_updating_refresh_rate = false
    len = ar_updating_refresh_rate.length
    if (len > 0)
      b_has_updating_refresh_rate = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_updating_refresh_rate => b_has_updating_refresh_rate,
                                      :g_updated => gon.updating_refresh_rate,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  



  #7 updating_type
  def update_updating_type

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    updating_type = h_obj[:updating_type]
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:updating_type] = updating_type

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)

    gon.updating_type = []
    ar_updating_type = Array.new

    ar_updating_type = publisher_product_description_updated.updating_type.split(',')
    gon.updating_type = ar_updating_type
    
    b_has_updating_type = false
    len = ar_updating_type.length
    if (len > 0)
      b_has_updating_type = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_updating_type => b_has_updating_type,
                                      :g_updated => gon.updating_type,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  



  #7 character
  def update_character

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    character = h_obj[:character]
    
    ar_character = Array.new
    ar_character = character.split(',')
    len = ar_character.length

    h_update = Hash.new
    h_update[:character_1] = false
    h_update[:character_2] = false
    h_update[:character_3] = false
    h_update[:character_4] = false
    h_update[:character_5] = false
    h_update[:character_6] = false
    h_update[:character_7] = false
    h_update[:character_8] = false
    h_update[:character_9] = false
    h_update[:character_10] = false
    
    ar_character.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:character_1] = true
        when "2"
          h_update[:character_2] = true
        when "3"
          h_update[:character_3] = true
        when "4"
          h_update[:character_4] = true
        when "5"
          h_update[:character_5] = true
        when "6"
          h_update[:character_6] = true
        when "7"
          h_update[:character_7] = true
        when "8"
          h_update[:character_8] = true
        when "9"
          h_update[:character_9] = true
        when "10"
          h_update[:character_10] = true
        else
          #        
      end
      
    end

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_character = PublisherProductCharacter.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_character.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_character_id = publisher_product_character.id
    publisher_product_character = nil
    publisher_product_character_updated = PublisherProductCharacter.find(publisher_product_character_id)
    
    gon.character = []
    
    gon.character[1] = publisher_product_character_updated.character_1
    gon.character[2] = publisher_product_character_updated.character_2
    gon.character[3] = publisher_product_character_updated.character_3
    gon.character[4] = publisher_product_character_updated.character_4
    gon.character[5] = publisher_product_character_updated.character_5
    gon.character[6] = publisher_product_character_updated.character_6
    gon.character[7] = publisher_product_character_updated.character_7
    gon.character[8] = publisher_product_character_updated.character_8
    gon.character[9] = publisher_product_character_updated.character_9
    gon.character[10] = publisher_product_character_updated.character_10

    b_has_character = false
    
    if (publisher_product_character_updated.character_1 or
        publisher_product_character_updated.character_2 or
        publisher_product_character_updated.character_3 or
        publisher_product_character_updated.character_4 or
        publisher_product_character_updated.character_5 or
        publisher_product_character_updated.character_6 or
        publisher_product_character_updated.character_7 or
        publisher_product_character_updated.character_8 or
        publisher_product_character_updated.character_9 or
        publisher_product_character_updated.character_10)

        b_has_character = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_character => b_has_character,
                                      :g_updated => gon.character,
                                      :updated => publisher_product_character_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

    end
    
  end  




















  # 15 reselling
  def update_reselling

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    reselling = h_obj[:reselling]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:reselling] = reselling

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    # publisher_product_description_id = publisher_product_description.id
    # publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :reselling => publisher_product_description_updated.reselling,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  




  # 15 evaluation
  def update_evaluation

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    evaluation = h_obj[:evaluation]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:evaluation] = evaluation

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    # publisher_product_description_id = publisher_product_description.id
    # publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :evaluation => publisher_product_description_updated.evaluation,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  



  # #7 lesson_time
  # def update_lesson_time
# 
    # ar = params[:publisher_product_description]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # # publisher_product_description_id = h_obj[:publisher_product_description_id]
    # lesson_time = h_obj[:lesson_time]
    # lesson_time_pertinent_index = h_obj[:lesson_time_pertinent_index]
#     
    # ar_lesson_time = Array.new
    # ar_lesson_time = lesson_time.split(',')
    # # len = ar_lesson_time.length
# 
    # h_update = Hash.new
    # h_update[:lesson_time_1] = false
    # h_update[:lesson_time_2] = false
    # h_update[:lesson_time_3] = false
    # h_update[:lesson_time_4] = false
    # h_update[:lesson_time_5] = false
    # h_update[:lesson_time_6] = false
    # h_update[:lesson_time_7] = false
    # h_update[:lesson_time_8] = false
    # h_update[:lesson_time_9] = false
    # h_update[:lesson_time_10] = false
    # h_update[:lesson_time_11] = false
    # h_update[:lesson_time_12] = false
    # h_update[:lesson_time_pertinent_index] = lesson_time_pertinent_index
#     
    # ar_lesson_time.each do |target|
#       
      # case target.to_s  
        # when "1"
          # h_update[:lesson_time_1] = true
        # when "2"
          # h_update[:lesson_time_2] = true
        # when "3"
          # h_update[:lesson_time_3] = true
        # when "4"
          # h_uppate[:lesson_time_4] = true
        # when "5"
          # h_update[:lesson_time_5] = true
        # when "6"
          # h_update[:lesson_time_6] = true
        # when "7"
          # h_update[:lesson_time_7] = true
        # when "8"
          # h_update[:lesson_time_8] = true
        # when "9"
          # h_update[:lesson_time_9] = true
        # when "10"
          # h_update[:lesson_time_10] = true
        # when "11"
          # h_update[:lesson_time_11] = true
        # when "12"
          # h_update[:lesson_time_12] = true
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
    # publisher_product_lesson_time = PublisherProductLessonTime.where("publisher_product_id = ?", publisher_product_id).first
# 
    # if publisher_product_lesson_time.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_lesson_time_id = publisher_product_lesson_time.id
    # publisher_product_lesson_time = nil
    # publisher_product_lesson_time_updated = PublisherProductLessonTime.find(publisher_product_lesson_time_id)
#     
    # gon.lesson_time = []
#     
    # gon.lesson_time[1] = publisher_product_lesson_time_updated.lesson_time_1
    # gon.lesson_time[2] = publisher_product_lesson_time_updated.lesson_time_2
    # gon.lesson_time[3] = publisher_product_lesson_time_updated.lesson_time_3
    # gon.lesson_time[4] = publisher_product_lesson_time_updated.lesson_time_4
    # gon.lesson_time[5] = publisher_product_lesson_time_updated.lesson_time_5
    # gon.lesson_time[6] = publisher_product_lesson_time_updated.lesson_time_6
    # gon.lesson_time[7] = publisher_product_lesson_time_updated.lesson_time_7
    # gon.lesson_time[8] = publisher_product_lesson_time_updated.lesson_time_8
    # gon.lesson_time[9] = publisher_product_lesson_time_updated.lesson_time_9
    # gon.lesson_time[10] = publisher_product_lesson_time_updated.lesson_time_10
    # gon.lesson_time[11] = publisher_product_lesson_time_updated.lesson_time_11
    # gon.lesson_time[12] = publisher_product_lesson_time_updated.lesson_time_12
# 
    # gon.lesson_time_pertinent_index = publisher_product_lesson_time_updated.lesson_time_pertinent_index
# 
    # b_has_lesson_time = false
#     
    # if (publisher_product_lesson_time_updated.lesson_time_1 or
        # publisher_product_lesson_time_updated.lesson_time_2 or
        # publisher_product_lesson_time_updated.lesson_time_3 or
        # publisher_product_lesson_time_updated.lesson_time_4 or
        # publisher_product_lesson_time_updated.lesson_time_5 or
        # publisher_product_lesson_time_updated.lesson_time_6 or
        # publisher_product_lesson_time_updated.lesson_time_7 or
        # publisher_product_lesson_time_updated.lesson_time_8 or
        # publisher_product_lesson_time_updated.lesson_time_9 or
        # publisher_product_lesson_time_updated.lesson_time_10 or
        # publisher_product_lesson_time_updated.lesson_time_11 or
        # publisher_product_lesson_time_updated.lesson_time_12)
# 
        # b_has_lesson_time = true
    # end
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :b_has_lesson_time => b_has_lesson_time,
                                      # :g_lesson_time => gon.lesson_time,
                                      # :g_lesson_time_pertinent_index => gon.lesson_time_pertinent_index,
                                      # :updated => publisher_product_lesson_time_updated.updated_at.to_s(:long) } }
    # end
#     
  # end  



  # 15 allow_teacher_rating
  def update_allow_teacher_rating

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_product_description_id = h_obj[:publisher_product_description_id]
    # allow_teacher_rating = h_obj[:allow_teacher_rating]

    h_update = Hash.new
    allow_teacher_rating = h_obj[:allow_teacher_rating]
    h_update[:allow_teacher_rating] = allow_teacher_rating
    h_update[:user_rating_1] = false
    h_update[:user_rating_2] = false
    h_update[:user_rating_3] = false

    if allow_teacher_rating
      user_rating = h_obj[:user_rating]
      ar_user_rating = Array.new    
      ar_user_rating = user_rating.split(',')
      ar_user_rating.each do |rating|
        case rating.to_s  
          when "1"
            h_update[:user_rating_1] = true
          when "2"
            h_update[:user_rating_2] = true
          when "3"
            h_update[:user_rating_3] = true
          else
            #        
        end
      end
    end

    
    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = nil
    ar_user_rating = nil

    gon.user_rating = []
    
    # h_user_rating[:allow_teacher_rating] = publisher_product_description_updated.allow_teacher_rating
    gon.user_rating[0] = publisher_product_description_updated.user_rating_1
    gon.user_rating[1] = publisher_product_description_updated.user_rating_2
    gon.user_rating[2] = publisher_product_description_updated.user_rating_3
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :allow_teacher_rating => publisher_product_description_updated.allow_teacher_rating,
                                      :user_rating => gon.user_rating,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  



  # 15 allow_student_likes
  def update_allow_student_likes

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    allow_student_likes = h_obj[:allow_student_likes]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:allow_student_likes] = allow_student_likes

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    # publisher_product_description_id = publisher_product_description.id
    # publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :allow_student_likes => publisher_product_description_updated.allow_student_likes,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  



  # 15 allow_comments
  def update_allow_comments

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    allow_comments = h_obj[:allow_comments]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:allow_comments] = allow_comments

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    # publisher_product_description_id = publisher_product_description.id
    # publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :allow_comments => publisher_product_description_updated.allow_comments,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end

    
  end  


  # 15 research
  def update_research

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_product_description_id = h_obj[:publisher_product_description_id]
    # allow_teacher_rating = h_obj[:allow_teacher_rating]

    h_update = Hash.new
    h_update[:research_1] = false
    h_update[:research_2] = false   
    research = h_obj[:research]
    ar_research = Array.new    
    ar_research = research.split(',')
    ar_research.each do |rsrch|
      case rsrch.to_s  
        when "1"
          h_update[:research_1] = true
        when "2"
          h_update[:research_2] = true
        else
          #        
      end
    end

    
    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = nil
    ar_research = nil

    gon.research = []
    gon.research[0] = publisher_product_description_updated.research_1
    gon.research[1] = publisher_product_description_updated.research_2
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :research => gon.research,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  



  # 15 public_relations
  def update_public_relations

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:pr_updates_1] = h_obj[:pr_updates_1]
    h_update[:pr_updates_2] = h_obj[:pr_updates_2]
    h_update[:pr_updates_3] = h_obj[:pr_updates_3]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    # publisher_product_description_id = publisher_product_description.id
    # publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    gon.public_relations = []
    gon.public_relations[0] = publisher_product_description_updated.pr_updates_1
    gon.public_relations[1] = publisher_product_description_updated.pr_updates_2
    gon.public_relations[2] = publisher_product_description_updated.pr_updates_3
    
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :public_relations => gon.public_relations,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  



  # 15 metrics
  def update_metrics

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:metrics_1] = h_obj[:metrics_1]
    h_update[:metrics_2] = h_obj[:metrics_2]
    h_update[:metrics_3] = h_obj[:metrics_3]
    h_update[:metrics_4] = h_obj[:metrics_4]
    h_update[:metrics_5] = h_obj[:metrics_5]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    # publisher_product_description_id = publisher_product_description.id
    # publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    gon.metrics = []
    gon.metrics[0] = publisher_product_description_updated.metrics_1
    gon.metrics[1] = publisher_product_description_updated.metrics_2
    gon.metrics[2] = publisher_product_description_updated.metrics_3
    gon.metrics[3] = publisher_product_description_updated.metrics_4
    gon.metrics[4] = publisher_product_description_updated.metrics_5
    
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :metrics => gon.metrics,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  































  
    

  # 15 word_description
  def update_word_description

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    word_description = h_obj[:word_description]

    # render text: name_product

    # publisher = Publisher.find(publisher_id)    
    # publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product_id).first
    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:word_description] = word_description

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :word_description => publisher_product_description_updated.word_description,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  
    
  
  def upload_pdf
   
      # pdf_path = "/path/to/interesting/file.pdf"
      # page_index_path = pdf_path + "[0]" # first page in PDF
      # pdf_page = Magick::Image.read( page_index_path ).first # first item in Magick::ImageList
      # pdf_page.write( "/tmp/indexed-page.png" ) # implicit conversion based on file extension
  
      # File.basename(@page.form.path)
  
      # Parameters: {"utf8"=>"✓", "authenticity_token"=>"q3Sq/HhxRuVFK3JcE5A1IOnSetUatcuxh5S12h/NOAc=", 
        # "publisher_product_pdf"=>{"name_pdf"=>"", 
          # "name_file"=>#<ActionDispatch::Http::UploadedFile:0x007f7b702f3710 @tempfile=#<Tempfile:/tmp/RackMultipart20141015-14884-p6qvru>, 
          # @original_filename="request.pdf", 
          # @content_type="application/pdf", 
          # @headers="Content-Disposition: form-data; 
          # name=\"publisher_product_pdf[name_file]\"; 
          # filename=\"request.pdf\"\r\nContent-Type: application/pdf\r\n">}, 
          # "commit"=>"Upload PDF", "remotipart_submitted"=>"true", 
          # "X-Requested-With"=>"IFrame", "X-Http-Accept"=>"text/javascript, application/javascript, 
          # application/ecmascript, application/x-ecmascript, */*; q=0.01"}
  
      # n_name = params[:publisher_product_pdf][:n_name]
  
  
      # image = params[:image]
      # publisher_product_pdf_id = params[:publisher_product_pdf_id]  
      # publisher_product_pdf_image = PublisherProductPdfImage.new

      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      # if !publisher_product_id.nil?
          # #
      # else
          # Rails.logger.info("publisher_product_id was nil")
      # end
      # # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      # publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil



      # uploaded_file = params[:publisher_product_pdf][:name_file]
      uploaded_file = params[:name_file]    
      name_pdf = File.basename(uploaded_file.original_filename, '.*').titleize if uploaded_file
  
      # publisher_id = params[:publisher_id]
      # publisher_product_id = params[:publisher_product_id]
      # publisher_product_manifest_id = params[:publisher_product_manifest_id]
  
      publisher_product_pdf = PublisherProductPdf.new
  
      publisher_product_pdf.name_file = uploaded_file
      publisher_product_pdf.name_pdf = name_pdf  
      
      
      publisher_product_pdf.publisher_id = current_user.publisher.id
      publisher_product_pdf.publisher_product_id = publisher_product_id
      # publisher_product_pdf.publisher_product_manifest_id = publisher_product_manifest_id
  
      # publisher_product_pdf.name_pdf = name_pdf 
      # publisher_product_pdf.name_pdf = params[:publisher_product_pdf][@original_filename]
      # publisher_product_pdf.publisher_id = @@publisher_id
      # publisher_product_pdf.publisher_product_id = @@publisher_product_id
      # publisher_product_pdf.publisher_product_manifest_id = @@publisher_product_manifest_id
  
      # @publisher_product_pdf = PublisherProductPdf.create(params[:publisher_product_pdf])
      @publisher_product_pdfs = nil
      if request.xhr? || remotipart_submitted?
          if publisher_product_pdf.save
    
            publisher_product_pdfs = PublisherProductPdf.where("publisher_product_id = ?", publisher_product_id)  
            gon.name_pdf = []    
            i = 0
            publisher_product_pdfs.each do |publisher_product_pdf|
                gon.name_pdf[i] = publisher_product_pdf.name_pdf
                i += 1        
            end
            
            @publisher_product_pdfs = publisher_product_pdfs
            
            pdf_image = Magick::Image.read("public" + publisher_product_pdf.name_file.url)[0]
            pdf_thumb = pdf_image.resize_to_fit(200, 300) #.scale(200, 270)
            
            h_pdf_img = Hash.new
            h_pdf_img['publisher_id'] = current_user.publisher.id 
            h_pdf_img['publisher_product_id'] = publisher_product_id 
            # h_pdf_img['publisher_product_manifest_id'] = publisher_product_manifest_id 
            h_pdf_img['publisher_product_pdf_id'] = publisher_product_pdf.id 
    
            publisher_product_pdf_image = PublisherProductPdfImage.new(h_pdf_img)
    
            publisher_product_pdf_image.image = File.open("public/images_publisher_product_pdf_image/add_generic_publisher_product_pdf_image_w200_h270.png")
            
            if publisher_product_pdf_image.save
              # image_200_270 = Magick::Image.read("public" + publisher_product_pdf_image.image_url(:image_200_270))[0]
              # image_200_270_filename = image_200_270.filename
              # FileUtils.rm_rf(Dir.glob(image_200_270.filename))
              # pdf_thumb.write image_200_270_filename
    
              image = Magick::Image.read("public" + publisher_product_pdf_image.image_url)[0]
              image_filename = image.filename
              FileUtils.rm_rf(Dir.glob(image.filename))
              pdf_thumb.write image_filename
            else
              #
            end
    
            # b_name_pdf = false
            # # b_required = true
            # publisher_product_pdf_name_pdf = "PDF Name"      
            # if !((publisher_product_pdf.name_pdf.blank?) or (publisher_product_pdf.name_pdf.empty?) or (publisher_product_pdf.name_pdf.nil?)) 
                # publisher_product_pdf_name_pdf = publisher_product_pdf.name_pdf
                # b_name_pdf = true
                # # b_required = false      
            # end
    
            # respond_to do |format|
              # format.html {}
              # format.json { render :json => { :b_name_pdf => b_name_pdf, 
                                              # # :name_pdf => publisher_product_pdf_name_pdf,
                                              # :name_pdf => gon.name_pdf 
                                              # # :n_name => n_name,
                                              # # :b_required => b_required,
                                              # :publisher_product_pdf_id => publisher_product_pdf.id,                                      
                                              # :updated => publisher_product_pdf.updated_at.to_s(:long) } }
            # end
    
          else
              #
          end
    
          # sleep 1 if params[:pause]
          # render :layout => false, :template => (params[:template] == 'escape' ? 'comments/escape_test' : 'comments/create'), :status => (@comment.errors.any? ? :unprocessable_entity : :ok)
      else
        #redirect_to comments_path    
        render text: 'Remote call failed'
      end
    
    
  end



  def update_name_pdf
    
    ar = params[:publisher_product_manifest]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_manifest_id = h_obj[:publisher_product_manifest_id]
    
    publisher_product_pdf_id = h_obj[:publisher_product_pdf_id]
    name_pdf = h_obj[:name_pdf]
    n_name = h_obj[:n_name]

    # publisher_product_pdf = PublisherProductPdf.where("publisher_id = ?" AND publisher_product_id = ? AND publisher_product_pdf = ?", @@publisher_id, @@publisher_product_id, publisher_product_pdf_id).first

    publisher_product_pdf = PublisherProductPdf.find(publisher_product_pdf_id)
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj
    h_update = Hash.new
    # h_update[:publisher_id] = publisher_id
    # h_update[:publisher_product_id] = publisher_product_id
    h_update[:name_pdf] = name_pdf

    if publisher_product_pdf.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_pdf = nil
    publisher_product_pdf_updated = PublisherProductPdf.find(publisher_product_pdf_id)

    # @publisher_id = @@publisher_id     
    # @publisher_product_id = @@publisher_product_id 
    # @publisher_product_manifest_id = @@publisher_product_manifest_id 
    
    # @publisher_product_pdfs = publisher_product.publisher_product_pdfs
    # gon.name_pdf = []    
    # i = 0
    # @publisher_product_pdfs.each do |publisher_product_pdf|
        # gon.name_pdf[i] = publisher_product_pdf.name_pdf
        # i += 1        
    # end
    
    
    b_name_pdf = false
    b_required = true
    publisher_product_pdf_name_pdf = "PDF Name"      
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
                                      :updated => publisher_product_pdf_updated.updated_at.to_s(:long) } }

      # format.json { render :json => { :n_name => n_name } }

      # format.json { render :json => {} } 

                  
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end

    
  end




  def upload_pdf_image
   
    # image = params[:publisher_product_pdf_image][:image]
    # publisher_product_pdf_id = params[:publisher_product_pdf_image][:publisher_product_pdf_id]

    image = params[:image]
    publisher_product_pdf_id = params[:publisher_product_pdf_id]
  
    publisher_product_pdf_image = PublisherProductPdfImage.new
    
    publisher_product_pdf_image.image = image
    publisher_product_pdf_image.publisher_id = params[:publisher_id]
    publisher_product_pdf_image.publisher_product_id = params[:publisher_product_id]
    # publisher_product_pdf_image.publisher_product_manifest_id = params[:publisher_product_manifest_id]
    # publisher_product_pdf_image.publisher_id = @@publisher_id
    # publisher_product_pdf_image.publisher_product_id = @@publisher_product_id
    # publisher_product_pdf_image.publisher_product_manifest_id = @@publisher_product_manifest_id
    publisher_product_pdf_image.publisher_product_pdf_id = publisher_product_pdf_id
    
    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_product_pdf_image.save
            @publisher_product_pdfs = PublisherProductPdf.where("publisher_product_id = ?", @@publisher_product_id)
            # @publisher_product_pdf_image = publisher_product_pdf_image
            # @publisher_user_images = publisher_user.publisher_user_images     
            # # @publisher_user_images = PublisherUserImage.where("publisher_user_id = ?", @publisher_user_id)
            # @publisher_user_image_primary = @publisher_user_images.where( :primary => true ).first
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end
   
   
   
   
    # @publisher_product_pdf_image = PublisherProductPdfImage.create(params[:publisher_product_pdf_image])
    # if request.xhr? || remotipart_submitted?
      # @publisher_product_pdfs = PublisherProductPdf.where("publisher_product_id = ?", params[:publisher_product_pdf_image][:publisher_product_id])  
      # # sleep 1 if params[:pause]
      # # render :layout => false, :template => (params[:template] == 'escape' ? 'comments/escape_test' : 'comments/create'), :status => (@comment.errors.any? ? :unprocessable_entity : :ok)
    # else
      # #redirect_to comments_path    
      # render text: 'Remote call failed'
    # end

    
  end



  def destroy_pdf
        
      publisher_product_pdf = PublisherProductPdf.find(params[:publisher_product_pdf_id])
      publisher_product_pdf_image = publisher_product_pdf.publisher_product_pdf_image
      
      if publisher_product_pdf.destroy
        if !publisher_product_pdf_image.nil?
          if publisher_product_pdf_image.destroy
          end
        end
      end
  
      @publisher_product_pdfs = PublisherProductPdf.where("publisher_product_id = ?", @@publisher_product_id)
      
      # respond_to do |format|
        # format.html {}
        # format.js
      # end
    
  end



  def destroy_pdf_image
        
      publisher_product_pdf = PublisherProductPdf.find(params[:publisher_product_pdf_id])
      publisher_product_pdf_image = publisher_product_pdf.publisher_product_pdf_image
      
      if publisher_product_pdf_image.destroy
        @publisher_product_pdfs = PublisherProductPdf.where("publisher_product_id = ?", @@publisher_product_id)
      else
        #      
      end
      
      # respond_to do |format|
        # format.html {}
        # format.js
      # end
    
  end



  def upload_image_1
   
      @id_image_1 = nil
      @image_1 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_1 = publisher_product_pos1_image.id      
                      @image_1 = publisher_product_pos1_image
                  else
                      Rails.logger.info "publisher_product_pos1_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos1_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
    
    
  end


  def upload_image_1_change

      destroy_image_1
      
      @id_image_1 = nil
      @image_1 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_1 = publisher_product_pos1_image.id      
                      @image_1 = publisher_product_pos1_image
                  else
                      Rails.logger.info "publisher_product_pos1_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos1_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
        
    
  end



  def destroy_image_1

    @image_1 = nil
    # Rails.logger.info "publisher_product_id = " + @@publisher_product_id.to_s
    
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
    
      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
      if !publisher_product.nil?
          publisher_product_pos1_image = publisher_product.publisher_product_pos1_image rescue nil
          if !publisher_product_pos1_image.nil?
              if publisher_product_pos1_image.destroy
                  #
              else      
                  Rails.logger.info "publisher_product_pos1_image destroy failed"
              end
          else
              Rails.logger.info "publisher_product_pos1_image was nil"
          end
      else
          Rails.logger.info "publisher_product was nil"
      end

    
  end



  def upload_image_2
   
      @id_image_2 = nil
      @image_2 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_2 = publisher_product_pos2_image.id      
                      @image_2 = publisher_product_pos2_image
                  else
                      Rails.logger.info "publisher_product_pos2_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos2_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
    
    
  end


  def upload_image_2_change

      destroy_image_2
      
      @id_image_2 = nil
      @image_2 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_2 = publisher_product_pos2_image.id      
                      @image_2 = publisher_product_pos2_image
                  else
                      Rails.logger.info "publisher_product_pos2_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos2_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
        
    
  end



  def destroy_image_2

      @image_2 = nil
    
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
    
      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
      if !publisher_product.nil?
          publisher_product_pos2_image = publisher_product.publisher_product_pos2_image rescue nil
          if !publisher_product_pos2_image.nil?
              if publisher_product_pos2_image.destroy
                  #
              else      
                  Rails.logger.info "publisher_product_pos2_image destroy failed"
              end
          else
              Rails.logger.info "publisher_product_pos2_image was nil"
          end
      else
          Rails.logger.info "publisher_product was nil"
      end

    
  end



  def upload_image_3
   
      @id_image_3 = nil
      @image_3 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_3 = publisher_product_pos3_image.id      
                      @image_3 = publisher_product_pos3_image
                  else
                      Rails.logger.info "publisher_product_pos3_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos3_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
    
    
  end


  def upload_image_3_change

      destroy_image_3
      
      @id_image_3 = nil
      @image_3 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_3 = publisher_product_pos3_image.id      
                      @image_3 = publisher_product_pos3_image
                  else
                      Rails.logger.info "publisher_product_pos3_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos3_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
        
    
  end



  def destroy_image_3

      @image_3 = nil
    
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
    
      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
      if !publisher_product.nil?
          publisher_product_pos3_image = publisher_product.publisher_product_pos3_image rescue nil
          if !publisher_product_pos3_image.nil?
              if publisher_product_pos3_image.destroy
                  #
              else      
                  Rails.logger.info "publisher_product_pos3_image destroy failed"
              end
          else
              Rails.logger.info "publisher_product_pos3_image was nil"
          end
      else
          Rails.logger.info "publisher_product was nil"
      end

    
  end



  def upload_image_4
   
      @id_image_4 = nil
      @image_4 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_4 = publisher_product_pos4_image.id      
                      @image_4 = publisher_product_pos4_image
                  else
                      Rails.logger.info "publisher_product_pos4_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos4_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
    
    
  end


  def upload_image_4_change

      destroy_image_4
      
      @id_image_4 = nil
      @image_4 = nil
      @crop_x = 0
      @crop_y = 0
      @crop_w = 200
      @crop_h = 200
      
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
      
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
                  image = Magick::Image.read("public" + img.image_url(:user_600_600))[0]
                  w = image.columns
                  h = image.rows
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
                      @id_image_4 = publisher_product_pos4_image.id      
                      @image_4 = publisher_product_pos4_image
                  else
                      Rails.logger.info "publisher_product_pos4_image updated failed"
                  end
              else
                  Rails.logger.info "publisher_product_pos4_image save failed"
              end
          else
            # 
          end
      else
          Rails.logger.info "publisher_product was nil"
      end
        
    
  end


  def destroy_image_4

    @image_4 = nil
    # Rails.logger.info "publisher_product_id = " + @@publisher_product_id.to_s
    
      publisher_product_id = current_user.publisher.publisher_product_current.current_product_id rescue nil    
      if !publisher_product_id.nil?
          #
      else
          Rails.logger.info("publisher_product_id was nil")
      end
      # Rails.logger.info("in update publisher_product_id = " + publisher_product_id.to_s)
    
      publisher_product = current_user.publisher.publisher_products.where("id = ?", publisher_product_id).first rescue nil
      if !publisher_product.nil?
          publisher_product_pos4_image = publisher_product.publisher_product_pos4_image rescue nil
          if !publisher_product_pos4_image.nil?
              if publisher_product_pos4_image.destroy
                  #
              else      
                  Rails.logger.info "publisher_product_pos4_image destroy failed"
              end
          else
              Rails.logger.info "publisher_product_pos4_image was nil"
          end
      else
          Rails.logger.info "publisher_product was nil"
      end

    
  end




  # def destroy_product_logo
    # publisher_product_logo = PublisherProductLogo.find(params[:publisher_product_logo_id])
    # if publisher_product_logo.destroy
    # else      
      # #
    # end
  # end


  def upload_product1_image

    image = params[:image]
  
    publisher_product1_image = PublisherProduct1Image.new
    
    publisher_product1_image.image = image
    publisher_product1_image.publisher_id = params[:publisher_id]
    publisher_product1_image.publisher_product_id = params[:publisher_product_id]

    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_product1_image.save
            @publisher_product1_image = publisher_product1_image
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end
   
    # @publisher_product1_image = PublisherProduct1Image.create(params[:publisher_product1_image])
    # if request.xhr? || remotipart_submitted?
      # # @publisher_product_logo = publisher_product.publisher_product_logo
      # # @publisher_product_logo = PublisherProductLogo.where("publisher_product_id = ?", params[:publisher_product_logo][:publisher_product_id])  
    # else
      # render text: 'Remote call failed'
    # end
    
    
  end



  def destroy_product1_image
    
    publisher_product1_image = PublisherProduct1Image.find(params[:publisher_product1_image_id])
    if publisher_product1_image.destroy
      #
    else      
      #
    end
    
    
  end



  def upload_product2_image
   
    image = params[:image]
  
    publisher_product2_image = PublisherProduct2Image.new
    
    publisher_product2_image.image = image
    publisher_product2_image.publisher_id = params[:publisher_id]
    publisher_product2_image.publisher_product_id = params[:publisher_product_id]

    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_product2_image.save
            @publisher_product2_image = publisher_product2_image
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end
   
    # @publisher_product2_image = PublisherProduct2Image.create(params[:publisher_product2_image])
    # if request.xhr? || remotipart_submitted?
      # # @publisher_product_logo = publisher_product.publisher_product_logo
      # # @publisher_product_logo = PublisherProductLogo.where("publisher_product_id = ?", params[:publisher_product_logo][:publisher_product_id])  
    # else
      # render text: 'Remote call failed'
    # end
    
    
  end



  def destroy_product2_image
    
    publisher_product2_image = PublisherProduct2Image.find(params[:publisher_product2_image_id])
    if publisher_product2_image.destroy
      #
    else      
      #
    end
    
    
  end



  def update_poster_print_purchase
    
    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_product_description_id = h_obj[:publisher_product_description_id]
    poster_print_purchase = h_obj[:poster_print_purchase]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:poster_print_purchase] = poster_print_purchase

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :poster_print_purchase => publisher_product_description_updated.poster_print_purchase,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end

    
  end
  
  
  
  def update_poster_pin_web

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_product_description_id = h_obj[:publisher_product_description_id]
    poster_pin_web = h_obj[:poster_pin_web]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:poster_pin_web] = poster_pin_web

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :poster_pin_web => publisher_product_description_updated.poster_pin_web,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end

    
  end
  
  
  
  def update_poster_pin_purchase
    
    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_product_description_id = h_obj[:publisher_product_description_id]
    poster_pin_purchase = h_obj[:poster_pin_purchase]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:poster_pin_purchase] = poster_pin_purchase

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :poster_pin_purchase => publisher_product_description_updated.poster_pin_purchase,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
    
  end



  # def upload_corporate_logo   
    # @publisher_product_corporate_logo = PublisherProductCorporateLogo.create(params[:publisher_product_corporate_logo])
    # if request.xhr? || remotipart_submitted?
      # # @publisher_product_logo = publisher_product.publisher_product_logo
      # # @publisher_product_logo = PublisherProductLogo.where("publisher_product_id = ?", params[:publisher_product_logo][:publisher_product_id])  
    # else
      # render text: 'Remote call failed'
    # end
  # end



  def upload_product_corporate_logo
   
    image = params[:image]
  
    publisher_product_corporate_logo = PublisherProductCorporateLogo.new
    
    publisher_product_corporate_logo.image = image
    publisher_product_corporate_logo.publisher_id = params[:publisher_id]
    publisher_product_corporate_logo.publisher_product_id = params[:publisher_product_id]

    # @publisher_user_image_primary = PublisherUserImage.create(params[:publisher_profile_image])    
    if request.xhr? || remotipart_submitted?
        if publisher_product_corporate_logo.save
            @publisher_product_corporate_logo = publisher_product_corporate_logo
        else
          # error save
        end
    else
      # render text: 'Remote call failed'
    end
   
    
  end



  def destroy_product_corporate_logo
    
    publisher_product_corporate_logo = PublisherProductCorporateLogo.find(params[:publisher_product_corporate_logo_id])
    if publisher_product_corporate_logo.destroy
      #
    else      
      #
    end

    
  end




  def update_corporate_logo_url
    
    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_product_description_id = h_obj[:publisher_product_description_id]
    corporate_logo_url = h_obj[:corporate_logo_url]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:corporate_logo_url] = corporate_logo_url

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    b_corporate_logo_url = false
    b_required = true
    publisher_product_description_corporate_logo_url = "www.GenericCorporation.com"      
    if !((publisher_product_description_updated.corporate_logo_url.blank?) or (publisher_product_description_updated.corporate_logo_url.empty?) or (publisher_product_description_updated.corporate_logo_url.nil?)) 
        publisher_product_description_corporate_logo_url = publisher_product_description_updated.corporate_logo_url
        b_corporate_logo_url = true
        b_required = false      
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_corporate_logo_url => b_corporate_logo_url, 
                                      :corporate_logo_url => publisher_product_description_corporate_logo_url,
                                      :b_required => b_required,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
    end
    
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :corporate_logo_url => publisher_product_description_updated.corporate_logo_url,
                                      # :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    # end
    
    
  end







  def new
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

    # def sortable_core_math(column, title = nil)
      # title ||= column.titleize
      # css_class = column == sort_column_core_math ? "current #{sort_direction}" : nil
      # direction = column == sort_column_core_math && sort_direction == "asc" ? "desc" : "asc"
      # link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
    # end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def yesno(x)
      x == 1 ? "Yes" : "No"
    end
    
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
      return Dtab8let.order(sort_column_dtab8let + " " + sort_direction)
    end
    def sort_column_dtab8let
      Dtab8let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab9lets      
      return Dtab9let.order(sort_column_dtab9let + " " + sort_direction)
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
