class PublisherProductDescriptionsController < ApplicationController

  before_filter :force_http

  layout 'publisher'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno



  @@publisher_product_id = nil
  
  def show_description
    @@publisher_product_id = params[:publisher_product_id]
    redirect_to :action => :index
  end
  
  
  def index
    # render text: 'id = ' + @@id.to_s
    # @publisher_product_id = params[:publisher_product_id]
    # @publisher_id = params[:publisher_id]
    # s =  "publisher_product_image_id = " + @publisher_product_image_id.to_s + " publisher_product_description_id = " + @publisher_product_description_id.to_s + " publisher_product_id = " + @publisher_product_id.to_s + " publisher_id = " + @publisher_id.to_s 
    # render text: s 

    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_id = publisher_product.id
    @publisher_id = publisher_product.publisher_id    

    @publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product.id).first

    @publisher_product_description_id = @publisher_product_description.id

    @publisher_product_image = publisher_product.publisher_product_image
    @publisher_product_logo = publisher_product.publisher_product_logo
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
    @publisher_product_lesson_time = publisher_product.publisher_product_lesson_time
    

    # determing last update to form
    date_0 = Time.zone.parse('2000-01-01 00:00:00')
    if @publisher_product_description
      date_updated_description = @publisher_product_description.updated_at
    else 
      date_updated_description = date_0
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
    if @publisher_product_lesson_time
      date_updated_lesson_time = @publisher_product_lesson_time.updated_at
    else
      date_updated_lesson_time = date_0   
    end
    ar_updated = Array.new
    ar_updated.push(date_updated_description)
    ar_updated.push(date_updated_image)
    ar_updated.push(date_updated_logo)    
    ar_updated.push(date_updated_content_type)
    ar_updated.push(date_updated_appropriate_age)
    ar_updated.push(date_updated_appropriate_grade)    
    ar_updated.push(date_updated_market_target)
    ar_updated.push(date_updated_platform)
    ar_updated.push(date_updated_file_type)
    ar_updated.push(date_updated_character)
    ar_updated.push(date_updated_enhancement)
    ar_updated.push(date_updated_pricing_model)
    ar_updated.push(date_updated_price)
    ar_updated.push(date_updated_lesson_time)    
    greatest_updated = date_0
    ar_updated.each do |updated|
      if updated > greatest_updated
        greatest_updated = updated
      end      
    end    
    # @last_updated =greatest_updated.to_s(:long) 
    @last_updated =greatest_updated 
    
    
    @category_subjects = return_all_dtab4lets
    @content_types = return_all_dtab2lets
    @file_types = return_all_dtab1lets
    @platforms = return_all_dtab3lets
    @lesson_times = return_all_dtab5lets

    # @publisher_product_core_literacy_standard = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", @publisher_product_id).first
    # @publisher_product_core_math_standard = PublisherProductCoreMathStandard.where("publisher_product_id = ?", @publisher_product_id).first

    # @core_literacy_standards = CoreLiteracyStandard.all
    @core_literacy_standards = CoreLiteracyStandard.order(sort_column + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
    # @core_math_standards = CoreMathStandard.all
    
    @b_name_product = true                # 1
    @b_product_tagline = true                # 1
    @b_versions = true                    # 12
    @b_content_type = false          # 3
    @b_category_subject = false      # 6
    @b_topic = true                       # 13
    @b_lesson_plan_subject = true         # 14
    @b_description = true                 # 2
    @b_age_appropriate_index = false      # 7
    @b_grade_appropriate = false     # 8
    @b_source_url = true                  # 5
    @b_market_target_index = false      # 7
    @b_platform = false              # 9
    @b_file_type_index = false              # 9
    @b_updating_refresh_rate = false      # 0
    @b_updating_type = false      # 0
    @b_character = false      # 0
    @b_enhancement = false      # 0
    @b_pricing_model = false      # 0
    @b_price = false      # 0
    @b_lesson_time = false              # 9
    @b_allow_teacher_rating = false      # 0
    
    
    
    # @b_core_supplemental_index = true     # 4
    @b_word_description = true            # 15
    @b_core_literacy_standard = true      # 16
    @b_core_math_standard = true          # 17
    
    # 1 name_product
    if (@publisher_product_description.name_product.blank?) or (@publisher_product_description.name_product.empty?) or (@publisher_product_description.name_product.nil?)
      @b_name_product = false
    end
    # 1 product_tagline
    if (@publisher_product_description.product_tagline.blank?) or (@publisher_product_description.product_tagline.empty?) or (@publisher_product_description.product_tagline.nil?)
      @b_product_tagline = false
    end
    # 12 versions
    if (@publisher_product_description.versions.blank?) or (@publisher_product_description.versions.empty?) or (@publisher_product_description.versions.nil?)
      @b_versions = false
    end



    # # 3 type_content_index
    # if (@publisher_product_description.type_content_index.blank?) or (@publisher_product_description.type_content_index.nil?) or (@publisher_product_description.type_content_index == 0)
      # @b_type_content_index = false
    # end

    # 3 content_type
    gon.content_type = []    
    if (@publisher_product_content_type.content_type_1 or
        @publisher_product_content_type.content_type_2 or
        @publisher_product_content_type.content_type_3)
        
        @b_content_type = true

        gon.content_type[1] = @publisher_product_content_type.content_type_1
        gon.content_type[2] = @publisher_product_content_type.content_type_2
        gon.content_type[3] = @publisher_product_content_type.content_type_3

    end

    # 3 category_subject
    gon.category_subject = []    
    if (@publisher_product_category_subject.category_subject_1 or
        @publisher_product_category_subject.category_subject_2 or
        @publisher_product_category_subject.category_subject_3)
        
        @b_category_subject = true

        gon.category_subject[1] = @publisher_product_category_subject.category_subject_1
        gon.category_subject[2] = @publisher_product_category_subject.category_subject_2
        gon.category_subject[3] = @publisher_product_category_subject.category_subject_3

    end







    # # 6 subject_category_index
    # if (@publisher_product_description.subject_category_index.blank?) or (@publisher_product_description.subject_category_index.nil?) or (@publisher_product_description.subject_category_index == 0)
      # @b_subject_category_index = false
    # end
    # 13 topic
    if (@publisher_product_description.topic.blank?) or (@publisher_product_description.topic.empty?) or (@publisher_product_description.topic.nil?)
      @b_topic = false
    end
    # 14 lesson_plan_subject
    if (@publisher_product_description.lesson_plan_subject.blank?) or (@publisher_product_description.lesson_plan_subject.empty?) or (@publisher_product_description.lesson_plan_subject.nil?)
      @b_lesson_plan_subject = false
    end
    # 2 description
    if (@publisher_product_description.description.blank?) or (@publisher_product_description.description.empty?) or (@publisher_product_description.description.nil?)
      @b_description = false
    end
    
    # 7 age_appropriate_index
    gon.age_appropriate = []    
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
        
        @b_age_appropriate_index = true
        
        gon.age_appropriate[1] = @publisher_product_appropriate_age.age_appropriate_1
        gon.age_appropriate[2] = @publisher_product_appropriate_age.age_appropriate_2
        gon.age_appropriate[3] = @publisher_product_appropriate_age.age_appropriate_3
        gon.age_appropriate[4] = @publisher_product_appropriate_age.age_appropriate_4
        gon.age_appropriate[5] = @publisher_product_appropriate_age.age_appropriate_5
        gon.age_appropriate[6] = @publisher_product_appropriate_age.age_appropriate_6
        gon.age_appropriate[7] = @publisher_product_appropriate_age.age_appropriate_7
        gon.age_appropriate[8] = @publisher_product_appropriate_age.age_appropriate_8 
        gon.age_appropriate[9] = @publisher_product_appropriate_age.age_appropriate_9 
        gon.age_appropriate[10] = @publisher_product_appropriate_age.age_appropriate_10 
        gon.age_appropriate[11] = @publisher_product_appropriate_age.age_appropriate_11 
        gon.age_appropriate[12] = @publisher_product_appropriate_age.age_appropriate_12 
        gon.age_appropriate[13] = @publisher_product_appropriate_age.age_appropriate_13 
        gon.age_appropriate[14] = @publisher_product_appropriate_age.age_appropriate_14 
        gon.age_appropriate[15] = @publisher_product_appropriate_age.age_appropriate_15 
        gon.age_appropriate[16] = @publisher_product_appropriate_age.age_appropriate_16 
        gon.age_appropriate[17] = @publisher_product_appropriate_age.age_appropriate_17 
        gon.age_appropriate[18] = @publisher_product_appropriate_age.age_appropriate_adult
        
    end
    


    # 7 grade_appropriate_index
    gon.grade_appropriate = []    
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
        @publisher_product_appropriate_grade.grade_appropriate_14 or
        @publisher_product_appropriate_grade.grade_appropriate_15 or
        @publisher_product_appropriate_grade.grade_appropriate_16)
        
        @b_grade_appropriate = true
        
        gon.grade_appropriate[1] = @publisher_product_appropriate_grade.grade_appropriate_1
        gon.grade_appropriate[2] = @publisher_product_appropriate_grade.grade_appropriate_2
        gon.grade_appropriate[3] = @publisher_product_appropriate_grade.grade_appropriate_3
        gon.grade_appropriate[4] = @publisher_product_appropriate_grade.grade_appropriate_4
        gon.grade_appropriate[5] = @publisher_product_appropriate_grade.grade_appropriate_5
        gon.grade_appropriate[6] = @publisher_product_appropriate_grade.grade_appropriate_6
        gon.grade_appropriate[7] = @publisher_product_appropriate_grade.grade_appropriate_7
        gon.grade_appropriate[8] = @publisher_product_appropriate_grade.grade_appropriate_8 
        gon.grade_appropriate[9] = @publisher_product_appropriate_grade.grade_appropriate_9 
        gon.grade_appropriate[10] = @publisher_product_appropriate_grade.grade_appropriate_10 
        gon.grade_appropriate[11] = @publisher_product_appropriate_grade.grade_appropriate_11 
        gon.grade_appropriate[12] = @publisher_product_appropriate_grade.grade_appropriate_12 
        gon.grade_appropriate[13] = @publisher_product_appropriate_grade.grade_appropriate_13 
        gon.grade_appropriate[14] = @publisher_product_appropriate_grade.grade_appropriate_14 
        gon.grade_appropriate[15] = @publisher_product_appropriate_grade.grade_appropriate_15 
        gon.grade_appropriate[16] = @publisher_product_appropriate_grade.grade_appropriate_16 
        
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    # # 8 grade_appropriate_index
    # if (@publisher_product_description.grade_appropriate_index.blank?) or (@publisher_product_description.grade_appropriate_index.nil?) or (@publisher_product_description.grade_appropriate_index == 0)
      # @b_grade_appropriate_index = false
    # end
    # 5 source_url
    if (@publisher_product_description.source_url.blank?) or (@publisher_product_description.source_url.empty?) or (@publisher_product_description.source_url.nil?)
      @b_source_url = false
    end
    # 7 market_target_index
    gon.market_target = []    
    if (@publisher_product_market_target.market_target_1 or
        @publisher_product_market_target.market_target_2)
        
        @b_market_target_index = true
        gon.market_target[1] = @publisher_product_market_target.market_target_1
        gon.market_target[2] = @publisher_product_market_target.market_target_2
    end



    # 7 platform
    gon.platform = []    
    if (@publisher_product_platform.platform_1 or
        @publisher_product_platform.platform_2 or
        @publisher_product_platform.platform_3)
        
        @b_platform = true

        gon.platform[1] = @publisher_product_platform.platform_1
        gon.platform[2] = @publisher_product_platform.platform_2
        gon.platform[3] = @publisher_product_platform.platform_3

    end




    # 7 file_type_index
    gon.file_type = []    
    if (@publisher_product_file_type.file_type_1 or
        @publisher_product_file_type.file_type_2 or
        @publisher_product_file_type.file_type_3)
        
        @b_file_type_index = true

        gon.file_type[1] = @publisher_product_file_type.file_type_1
        gon.file_type[2] = @publisher_product_file_type.file_type_2
        gon.file_type[3] = @publisher_product_file_type.file_type_3

    end
    
    # 7 updating_refresh_rate_index
    gon.updating_refresh_rate = []    
    if (@publisher_product_description.updating_refresh_rate.blank?) or (@publisher_product_description.updating_refresh_rate.empty?) or (@publisher_product_description.updating_refresh_rate.nil?)
        @b_updating_refresh_rate = false
    else
        @b_updating_refresh_rate = true
        ar_updating_refresh_rate = Array.new
        ar_updating_refresh_rate = @publisher_product_description.updating_refresh_rate.split(',')
        gon.updating_refresh_rate = ar_updating_refresh_rate
    end

    # 7 updating_type_index
    gon.updating_type = []    
    if (@publisher_product_description.updating_type.blank?) or (@publisher_product_description.updating_type.empty?) or (@publisher_product_description.updating_type.nil?)
        @b_updating_type = false
    else
        @b_updating_type = true
        ar_updating_type = Array.new
        ar_updating_type = @publisher_product_description.updating_type.split(',')
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
    

    # 7 enhancement_index
    gon.enhancement = []    
    if (@publisher_product_enhancement.enhancement_1 or
        @publisher_product_enhancement.enhancement_2 or
        @publisher_product_enhancement.enhancement_3 or
        @publisher_product_enhancement.enhancement_4 or
        @publisher_product_enhancement.enhancement_5 or
        @publisher_product_enhancement.enhancement_6 or
        @publisher_product_enhancement.enhancement_7 or
        @publisher_product_enhancement.enhancement_8 or
        @publisher_product_enhancement.enhancement_9 or
        @publisher_product_enhancement.enhancement_10)
        
        @b_enhancement = true

        # gon.enhancement[0] = false        
        gon.enhancement[1] = @publisher_product_enhancement.enhancement_1
        gon.enhancement[2] = @publisher_product_enhancement.enhancement_2
        gon.enhancement[3] = @publisher_product_enhancement.enhancement_3
        gon.enhancement[4] = @publisher_product_enhancement.enhancement_4
        gon.enhancement[5] = @publisher_product_enhancement.enhancement_5
        gon.enhancement[6] = @publisher_product_enhancement.enhancement_6
        gon.enhancement[7] = @publisher_product_enhancement.enhancement_7
        gon.enhancement[8] = @publisher_product_enhancement.enhancement_8
        gon.enhancement[9] = @publisher_product_enhancement.enhancement_9
        gon.enhancement[10] = @publisher_product_enhancement.enhancement_10

    end
    

    # 7 pricing_model
    gon.pricing_model = []    
    if (@publisher_product_pricing_model.pricing_model_1 or
        @publisher_product_pricing_model.pricing_model_2 or
        @publisher_product_pricing_model.pricing_model_3 or
        @publisher_product_pricing_model.pricing_model_4 or
        @publisher_product_pricing_model.pricing_model_5)
        
        @b_price_model = true

        # gon.pricing_model[0] = false        
        gon.pricing_model[1] = @publisher_product_pricing_model.pricing_model_1
        gon.pricing_model[2] = @publisher_product_pricing_model.pricing_model_2
        gon.pricing_model[3] = @publisher_product_pricing_model.pricing_model_3
        gon.pricing_model[4] = @publisher_product_pricing_model.pricing_model_4
        gon.pricing_model[5] = @publisher_product_pricing_model.pricing_model_5

    end
    

    # 7 price
    # h_price = Hash.new
    # a_price = [[true, 234.56]]
    # a_price = Array.new
    # a_price.map!{Array.new}
    
    # ar = Array.new(a)
    # ar.map!{Array.new(b)}
    
    a_price = Array.new(12).map!{Array.new(2)}
    gon.price = nil    
    # if (@publisher_product_price.price_1 or
        # @publisher_product_price.price_2 or
        # @publisher_product_price.price_3 or
        # @publisher_product_price.price_4 or
        # @publisher_product_price.price_5 or
        # @publisher_product_price.price_6 or
        # @publisher_product_price.price_7 or
        # @publisher_product_price.price_8 or
        # @publisher_product_price.price_9 or
        # @publisher_product_price.price_10 or
        # @publisher_product_price.price_11 or
        # @publisher_product_price.price_12)
#         
        # @b_price = true

        # gon.price[0] = false        
        a_price[1][0] = @publisher_product_price.price_1
        a_price[1][1] = @publisher_product_price.price_1_dec
        a_price[2][0] = @publisher_product_price.price_2
        a_price[2][1] = @publisher_product_price.price_2_dec
        a_price[3][0] = @publisher_product_price.price_3
        a_price[3][1] = @publisher_product_price.price_3_dec
        a_price[4][0] = @publisher_product_price.price_4
        a_price[4][1] = @publisher_product_price.price_4_dec
        a_price[5][0] = @publisher_product_price.price_5
        a_price[5][1] = @publisher_product_price.price_5_dec
        a_price[6][0] = @publisher_product_price.price_6
        a_price[6][1] = @publisher_product_price.price_6_dec
        a_price[7][0] = @publisher_product_price.price_7
        a_price[7][1] = @publisher_product_price.price_7_dec
        a_price[8][0] = @publisher_product_price.price_8
        a_price[8][1] = @publisher_product_price.price_8_dec
        a_price[9][0] = @publisher_product_price.price_9
        a_price[9][1] = @publisher_product_price.price_9_dec
        a_price[10][0] = @publisher_product_price.price_10
        a_price[10][1] = @publisher_product_price.price_10_dec

        a_price[11][0] = @publisher_product_price.price_11

        gon.price = a_price

    # end

    
    gon.reselling = @publisher_product_description.reselling
    
    gon.evaluation = @publisher_product_description.evaluation

    
    # 7 lesson_time
    gon.lesson_time = []    
    if (@publisher_product_lesson_time.lesson_time_1 or
        @publisher_product_lesson_time.lesson_time_2 or
        @publisher_product_lesson_time.lesson_time_3 or
        @publisher_product_lesson_time.lesson_time_4 or
        @publisher_product_lesson_time.lesson_time_5 or
        @publisher_product_lesson_time.lesson_time_6 or
        @publisher_product_lesson_time.lesson_time_7 or
        @publisher_product_lesson_time.lesson_time_8 or
        @publisher_product_lesson_time.lesson_time_9 or
        @publisher_product_lesson_time.lesson_time_10 or
        @publisher_product_lesson_time.lesson_time_11 or
        @publisher_product_lesson_time.lesson_time_12)
        
        @b_lesson_time = true

        gon.lesson_time[1] = @publisher_product_lesson_time.lesson_time_1
        gon.lesson_time[2] = @publisher_product_lesson_time.lesson_time_2
        gon.lesson_time[3] = @publisher_product_lesson_time.lesson_time_3
        gon.lesson_time[4] = @publisher_product_lesson_time.lesson_time_4
        gon.lesson_time[5] = @publisher_product_lesson_time.lesson_time_5
        gon.lesson_time[6] = @publisher_product_lesson_time.lesson_time_6
        gon.lesson_time[7] = @publisher_product_lesson_time.lesson_time_7
        gon.lesson_time[8] = @publisher_product_lesson_time.lesson_time_8
        gon.lesson_time[9] = @publisher_product_lesson_time.lesson_time_9
        gon.lesson_time[10] = @publisher_product_lesson_time.lesson_time_10
        gon.lesson_time[11] = @publisher_product_lesson_time.lesson_time_11
        gon.lesson_time[12] = @publisher_product_lesson_time.lesson_time_12

    end
    
    gon.lesson_time_pertinent_index = @publisher_product_lesson_time.lesson_time_pertinent_index
    

    
    gon.allow_teacher_rating = @publisher_product_description.allow_teacher_rating
    
    # h_user_rating = Hash.new
    # h_user_rating[:user_rating_1] = @publisher_product_description.user_rating_1
    # h_user_rating[:user_rating_2] = @publisher_product_description.user_rating_2
    # h_user_rating[:user_rating_3] = @publisher_product_description.user_rating_3

    a_user_rating = Array.new
    a_user_rating.push(@publisher_product_description.user_rating_1)   
    a_user_rating.push(@publisher_product_description.user_rating_2)   
    a_user_rating.push(@publisher_product_description.user_rating_3)   

    gon.user_rating = a_user_rating
    
    # gon.user_rating = 1
    
    # # 4 core_supplemental_index
    # if (@publisher_product_description.core_supplemental_index.blank?) or (@publisher_product_description.core_supplemental_index.nil?) or (@publisher_product_description.core_supplemental_index == 0)
      # @b_core_supplemental_index = false
    # end
    # # 10 pricing_model_index
    # if (@publisher_product_description.pricing_model_index.blank?) or (@publisher_product_description.pricing_model_index.nil?) or (@publisher_product_description.pricing_model_index == 0)
      # @b_pricing_model_index = false
    # end
    # # 11 price
    # if (@publisher_product_description.price.blank?) or (@publisher_product_description.price.nil?)
      # @b_price = false
    # end
    # 15 word_description
    if (@publisher_product_description.word_description.blank?) or (@publisher_product_description.word_description.empty?) or (@publisher_product_description.word_description.nil?)
      @b_word_description = false
    end

    # # 16 core_literacy_standard
    # if (@publisher_product_description.core_literacy_standard.blank?) or (@publisher_product_description.core_literacy_standard.empty?) or (@publisher_product_description.core_literacy_standard.nil?)
      # @b_core_literacy_standard = false
    # end
    # # 16 core_math_standard
    # if (@publisher_product_description.core_math_standard.blank?) or (@publisher_product_description.core_math_standard.empty?) or (@publisher_product_description.core_math_standard.nil?)
      # @b_core_math_standard = false
    # end





    gon.core_literacy_standard = []
    if (@publisher_product_description.core_literacy_standard.blank?) or (@publisher_product_description.core_literacy_standard.empty?) or (@publisher_product_description.core_literacy_standard.nil?)
      #
    else
      core_literacy_standard = @publisher_product_description.core_literacy_standard
      ar_core_literacy_standard = Array.new
      ar_core_literacy_standard = core_literacy_standard.split(',')    
      i = 0
      ar_core_literacy_standard.each do |standard|    
        gon.core_literacy_standard[i] = standard
        i += 1
      end
    end


    gon.updated = @publisher_product_description.updated_at.to_s(:long)


    # render text: gon.core_literacy_standard
    
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
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :name_product => publisher_product_description_updated.name_product,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
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
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :product_tagline => publisher_product_description_updated.product_tagline,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
    end
    
  end  


  #12 versions  
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
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :versions => publisher_product_description_updated.versions,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  


  #3 content_type
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
    
    ar_content_type = Array.new
    ar_content_type = content_type.split(',')
    len = ar_content_type.length

    h_update = Hash.new
    h_update[:content_type_1] = false
    h_update[:content_type_2] = false
    h_update[:content_type_3] = false
    
    ar_content_type.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:content_type_1] = true
        when "2"
          h_update[:content_type_2] = true
        when "3"
          h_update[:content_type_3] = true
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
    
    gon.content_type[1] = publisher_product_content_type_updated.content_type_1
    gon.content_type[2] = publisher_product_content_type_updated.content_type_2
    gon.content_type[3] = publisher_product_content_type_updated.content_type_3

    b_has_content_type = false
    
    if (publisher_product_content_type_updated.content_type_1 or
        publisher_product_content_type_updated.content_type_2 or
        publisher_product_content_type_updated.content_type_3)

        b_has_content_type = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_content_type => b_has_content_type,
                                      :g_updated => gon.content_type,
                                      :updated => publisher_product_content_type_updated.updated_at.to_s(:long) } }
    end
    
  end  





  #3 category_subject
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
    
    ar_category_subject = Array.new
    ar_category_subject = category_subject.split(',')
    len = ar_category_subject.length

    h_update = Hash.new
    h_update[:category_subject_1] = false
    h_update[:category_subject_2] = false
    h_update[:category_subject_3] = false
    
    ar_category_subject.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:category_subject_1] = true
        when "2"
          h_update[:category_subject_2] = true
        when "3"
          h_update[:category_subject_3] = true
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
    
    gon.category_subject[1] = publisher_product_category_subject_updated.category_subject_1
    gon.category_subject[2] = publisher_product_category_subject_updated.category_subject_2
    gon.category_subject[3] = publisher_product_category_subject_updated.category_subject_3

    b_has_category_subject = false
    
    if (publisher_product_category_subject_updated.category_subject_1 or
        publisher_product_category_subject_updated.category_subject_2 or
        publisher_product_category_subject_updated.category_subject_3)

        b_has_category_subject = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_category_subject => b_has_category_subject,
                                      :g_updated => gon.category_subject,
                                      :updated => publisher_product_category_subject_updated.updated_at.to_s(:long) } }
    end
    
  end  


















  #13 topic
  def update_topic

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    topic = h_obj[:topic]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:topic] = topic

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :topic => publisher_product_description_updated.topic,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  


  #14 lesson_plan_subject
  def update_lesson_plan_subject

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    lesson_plan_subject = h_obj[:lesson_plan_subject]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:lesson_plan_subject] = lesson_plan_subject

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :lesson_plan_subject => publisher_product_description_updated.lesson_plan_subject,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }      
    end
    
  end  



  #2 description
  def update_description

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    description = h_obj[:description]

    # render text: name_product

    # publisher = Publisher.find(publisher_id)    
    # publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product_id).first
    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:description] = description

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :description => publisher_product_description_updated.description,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  
  

  #7 age_appropriate_index
  def update_age_appropriate_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    age_appropriate_index = h_obj[:age_appropriate_index]
    
    ar_age_appropriate = Array.new
    ar_age_appropriate = age_appropriate_index.split(',')
    len = ar_age_appropriate.length

    h_update = Hash.new
    h_update[:age_appropriate_1] = false
    h_update[:age_appropriate_2] = false
    h_update[:age_appropriate_3] = false
    h_update[:age_appropriate_4] = false
    h_update[:age_appropriate_5] = false
    h_update[:age_appropriate_6] = false
    h_update[:age_appropriate_7] = false
    h_update[:age_appropriate_8] = false
    h_update[:age_appropriate_9] = false
    h_update[:age_appropriate_10] = false
    h_update[:age_appropriate_11] = false
    h_update[:age_appropriate_12] = false
    h_update[:age_appropriate_13] = false
    h_update[:age_appropriate_14] = false
    h_update[:age_appropriate_15] = false
    h_update[:age_appropriate_16] = false
    h_update[:age_appropriate_17] = false
    h_update[:age_appropriate_18] = false
    
    ar_age_appropriate.each do |age|
      
      case age.to_s  
        when "1"
          h_update[:age_appropriate_1] = true
        when "2"
          h_update[:age_appropriate_2] = true
        when "3"
          h_update[:age_appropriate_3] = true
        when "4"
          h_update[:age_appropriate_4] = true
        when "5"
          h_update[:age_appropriate_5] = true
        when "6"
          h_update[:age_appropriate_6] = true
        when "7"
          h_update[:age_appropriate_7] = true
        when "8"
          h_update[:age_appropriate_8] = true
        when "9"
          h_update[:age_appropriate_9] = true
        when "10"
          h_update[:age_appropriate_10] = true
        when "11"
          h_update[:age_appropriate_11] = true
        when "12"
          h_update[:age_appropriate_12] = true
        when "13"
          h_update[:age_appropriate_13] = true
        when "14"
          h_update[:age_appropriate_14] = true
        when "15"
          h_update[:age_appropriate_15] = true
        when "16"
          h_update[:age_appropriate_16] = true
        when "17"
          h_update[:age_appropriate_17] = true
        when "18"
          h_update[:age_appropriate_18] = true
        else
          #        
      end
      
    end

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    # h_update = Hash.new

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
    
    gon.age_appropriate = []
    
    gon.age_appropriate[1] = publisher_product_appropriate_age_updated.age_appropriate_1
    gon.age_appropriate[2] = publisher_product_appropriate_age_updated.age_appropriate_2
    gon.age_appropriate[3] = publisher_product_appropriate_age_updated.age_appropriate_3
    gon.age_appropriate[4] = publisher_product_appropriate_age_updated.age_appropriate_4
    gon.age_appropriate[5] = publisher_product_appropriate_age_updated.age_appropriate_5
    gon.age_appropriate[6] = publisher_product_appropriate_age_updated.age_appropriate_6
    gon.age_appropriate[7] = publisher_product_appropriate_age_updated.age_appropriate_7
    gon.age_appropriate[8] = publisher_product_appropriate_age_updated.age_appropriate_8 
    gon.age_appropriate[9] = publisher_product_appropriate_age_updated.age_appropriate_9 
    gon.age_appropriate[10] = publisher_product_appropriate_age_updated.age_appropriate_10 
    gon.age_appropriate[11] = publisher_product_appropriate_age_updated.age_appropriate_11 
    gon.age_appropriate[12] = publisher_product_appropriate_age_updated.age_appropriate_12 
    gon.age_appropriate[13] = publisher_product_appropriate_age_updated.age_appropriate_13 
    gon.age_appropriate[14] = publisher_product_appropriate_age_updated.age_appropriate_14 
    gon.age_appropriate[15] = publisher_product_appropriate_age_updated.age_appropriate_15 
    gon.age_appropriate[16] = publisher_product_appropriate_age_updated.age_appropriate_16 
    gon.age_appropriate[17] = publisher_product_appropriate_age_updated.age_appropriate_17 
    gon.age_appropriate[18] = publisher_product_appropriate_age_updated.age_appropriate_adult

    b_has_age_appropriate = false
    
    if (publisher_product_appropriate_age_updated.age_appropriate_1 or
        publisher_product_appropriate_age_updated.age_appropriate_2 or
        publisher_product_appropriate_age_updated.age_appropriate_3 or
        publisher_product_appropriate_age_updated.age_appropriate_4 or
        publisher_product_appropriate_age_updated.age_appropriate_5 or
        publisher_product_appropriate_age_updated.age_appropriate_6 or
        publisher_product_appropriate_age_updated.age_appropriate_7 or
        publisher_product_appropriate_age_updated.age_appropriate_8 or
        publisher_product_appropriate_age_updated.age_appropriate_9 or
        publisher_product_appropriate_age_updated.age_appropriate_10 or
        publisher_product_appropriate_age_updated.age_appropriate_11 or
        publisher_product_appropriate_age_updated.age_appropriate_12 or
        publisher_product_appropriate_age_updated.age_appropriate_13 or
        publisher_product_appropriate_age_updated.age_appropriate_14 or
        publisher_product_appropriate_age_updated.age_appropriate_15 or
        publisher_product_appropriate_age_updated.age_appropriate_16 or
        publisher_product_appropriate_age_updated.age_appropriate_17 or
        publisher_product_appropriate_age_updated.age_appropriate_adult)
        
        b_has_age_appropriate = true
        
        
        # h_updated[1] = publisher_product_appropriate_age_updated.age_appropriate_1
        # h_updated[2] = publisher_product_appropriate_age_updated.age_appropriate_2
        # h_updated[3] = publisher_product_appropriate_age_updated.age_appropriate_3
        # h_updated[4] = publisher_product_appropriate_age_updated.age_appropriate_4
        # h_updated[5] = publisher_product_appropriate_age_updated.age_appropriate_5
        # h_updated[6] = publisher_product_appropriate_age_updated.age_appropriate_6
        # h_updated[7] = publisher_product_appropriate_age_updated.age_appropriate_7
        # h_updated[8] = publisher_product_appropriate_age_updated.age_appropriate_8 
        # h_updated[9] = publisher_product_appropriate_age_updated.age_appropriate_9 
        # h_updated[10] = publisher_product_appropriate_age_updated.age_appropriate_10 
        # h_updated[11] = publisher_product_appropriate_age_updated.age_appropriate_11 
        # h_updated[12] = publisher_product_appropriate_age_updated.age_appropriate_12 
        # h_updated[13] = publisher_product_appropriate_age_updated.age_appropriate_13 
        # h_updated[14] = publisher_product_appropriate_age_updated.age_appropriate_14 
        # h_updated[15] = publisher_product_appropriate_age_updated.age_appropriate_15 
        # h_updated[16] = publisher_product_appropriate_age_updated.age_appropriate_16 
        # h_updated[17] = publisher_product_appropriate_age_updated.age_appropriate_17 
        # h_updated[18] = publisher_product_appropriate_age_updated.age_appropriate_adult
        
        
    end
    
    respond_to do |format|
      format.html {}
      # format.json { render :json => { :age_appropriate_index => publisher_product_description_updated.age_appropriate_index,
                                      # :updated => publisher_product_description_updated.updated_at.to_s(:long) } }

      format.json { render :json => { :b_has_age_appropriate => b_has_age_appropriate,
                                      # :h_updated => h_updated,
                                      :g_updated => gon.age_appropriate,
                                      :updated => publisher_product_appropriate_age_updated.updated_at.to_s(:long) } }

            
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  




  #7 grade_appropriate
  def update_grade_appropriate

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    grade_appropriate = h_obj[:grade_appropriate]
    
    ar_grade_appropriate = Array.new
    ar_grade_appropriate = grade_appropriate.split(',')
    len = ar_grade_appropriate.length

    h_update = Hash.new
    h_update[:grade_appropriate_1] = false
    h_update[:grade_appropriate_2] = false
    h_update[:grade_appropriate_3] = false
    h_update[:grade_appropriate_4] = false
    h_update[:grade_appropriate_5] = false
    h_update[:grade_appropriate_6] = false
    h_update[:grade_appropriate_7] = false
    h_update[:grade_appropriate_8] = false
    h_update[:grade_appropriate_9] = false
    h_update[:grade_appropriate_10] = false
    h_update[:grade_appropriate_11] = false
    h_update[:grade_appropriate_12] = false
    h_update[:grade_appropriate_13] = false
    h_update[:grade_appropriate_14] = false
    h_update[:grade_appropriate_15] = false
    h_update[:grade_appropriate_16] = false
    
    ar_grade_appropriate.each do |grade|
      
      case grade.to_s  
        when "1"
          h_update[:grade_appropriate_1] = true
        when "2"
          h_update[:grade_appropriate_2] = true
        when "3"
          h_update[:grade_appropriate_3] = true
        when "4"
          h_update[:grade_appropriate_4] = true
        when "5"
          h_update[:grade_appropriate_5] = true
        when "6"
          h_update[:grade_appropriate_6] = true
        when "7"
          h_update[:grade_appropriate_7] = true
        when "8"
          h_update[:grade_appropriate_8] = true
        when "9"
          h_update[:grade_appropriate_9] = true
        when "10"
          h_update[:grade_appropriate_10] = true
        when "11"
          h_update[:grade_appropriate_11] = true
        when "12"
          h_update[:grade_appropriate_12] = true
        when "13"
          h_update[:grade_appropriate_13] = true
        when "14"
          h_update[:grade_appropriate_14] = true
        when "15"
          h_update[:grade_appropriate_15] = true
        when "16"
          h_update[:grade_appropriate_16] = true
        else
          #        
      end
      
    end

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    # h_update = Hash.new

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_appropriate_grade = PublisherProductAppropriateGrade.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_appropriate_grade.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_appropriate_grade_id = publisher_product_appropriate_grade.id
    publisher_product_appropriate_grade = nil
    publisher_product_appropriate_grade_updated = PublisherProductAppropriateGrade.find(publisher_product_appropriate_grade_id)
    
    gon.grade_appropriate = []
    
    gon.grade_appropriate[1] = publisher_product_appropriate_grade_updated.grade_appropriate_1
    gon.grade_appropriate[2] = publisher_product_appropriate_grade_updated.grade_appropriate_2
    gon.grade_appropriate[3] = publisher_product_appropriate_grade_updated.grade_appropriate_3
    gon.grade_appropriate[4] = publisher_product_appropriate_grade_updated.grade_appropriate_4
    gon.grade_appropriate[5] = publisher_product_appropriate_grade_updated.grade_appropriate_5
    gon.grade_appropriate[6] = publisher_product_appropriate_grade_updated.grade_appropriate_6
    gon.grade_appropriate[7] = publisher_product_appropriate_grade_updated.grade_appropriate_7
    gon.grade_appropriate[8] = publisher_product_appropriate_grade_updated.grade_appropriate_8 
    gon.grade_appropriate[9] = publisher_product_appropriate_grade_updated.grade_appropriate_9 
    gon.grade_appropriate[10] = publisher_product_appropriate_grade_updated.grade_appropriate_10 
    gon.grade_appropriate[11] = publisher_product_appropriate_grade_updated.grade_appropriate_11 
    gon.grade_appropriate[12] = publisher_product_appropriate_grade_updated.grade_appropriate_12 
    gon.grade_appropriate[13] = publisher_product_appropriate_grade_updated.grade_appropriate_13 
    gon.grade_appropriate[14] = publisher_product_appropriate_grade_updated.grade_appropriate_14 
    gon.grade_appropriate[15] = publisher_product_appropriate_grade_updated.grade_appropriate_15 
    gon.grade_appropriate[16] = publisher_product_appropriate_grade_updated.grade_appropriate_16 

    b_has_grade_appropriate = false
    
    if (publisher_product_appropriate_grade_updated.grade_appropriate_1 or
        publisher_product_appropriate_grade_updated.grade_appropriate_2 or
        publisher_product_appropriate_grade_updated.grade_appropriate_3 or
        publisher_product_appropriate_grade_updated.grade_appropriate_4 or
        publisher_product_appropriate_grade_updated.grade_appropriate_5 or
        publisher_product_appropriate_grade_updated.grade_appropriate_6 or
        publisher_product_appropriate_grade_updated.grade_appropriate_7 or
        publisher_product_appropriate_grade_updated.grade_appropriate_8 or
        publisher_product_appropriate_grade_updated.grade_appropriate_9 or
        publisher_product_appropriate_grade_updated.grade_appropriate_10 or
        publisher_product_appropriate_grade_updated.grade_appropriate_11 or
        publisher_product_appropriate_grade_updated.grade_appropriate_12 or
        publisher_product_appropriate_grade_updated.grade_appropriate_13 or
        publisher_product_appropriate_grade_updated.grade_appropriate_14 or
        publisher_product_appropriate_grade_updated.grade_appropriate_15 or
        publisher_product_appropriate_grade_updated.grade_appropriate_16)
        
        b_has_grade_appropriate = true
        
        
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_grade_appropriate => b_has_grade_appropriate,
                                      :g_updated => gon.grade_appropriate,
                                      :updated => publisher_product_appropriate_grade_updated.updated_at.to_s(:long) } }
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


  #7 market_target_index
  def update_market_target_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    market_target_index = h_obj[:market_target_index]
    
    ar_market_target = Array.new
    ar_market_target = market_target_index.split(',')
    len = ar_market_target.length

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
    
    gon.market_target = []
    
    gon.market_target[1] = publisher_product_market_target_updated.market_target_1
    gon.market_target[2] = publisher_product_market_target_updated.market_target_2

    b_has_market_target = false
    
    if (publisher_product_market_target_updated.market_target_1 or
        publisher_product_market_target_updated.market_target_2)
        b_has_market_target = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_market_target => b_has_market_target,
                                      :g_updated => gon.market_target,
                                      :updated => publisher_product_market_target_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

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
    
    ar_platform = Array.new
    ar_platform = platform.split(',')
    # len = ar_platform.length

    h_update = Hash.new
    h_update[:platform_1] = false
    h_update[:platform_2] = false
    h_update[:platform_3] = false
    
    ar_platform.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:platform_1] = true
        when "2"
          h_update[:platform_2] = true
        when "3"
          h_update[:platform_3] = true
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
    
    gon.platform[1] = publisher_product_platform_updated.platform_1
    gon.platform[2] = publisher_product_platform_updated.platform_2
    gon.platform[3] = publisher_product_platform_updated.platform_3

    b_has_platform = false
    
    if (publisher_product_platform_updated.platform_1 or
        publisher_product_platform_updated.platform_2 or
        publisher_product_platform_updated.platform_3)

        b_has_platform = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_platform => b_has_platform,
                                      :g_updated => gon.platform,
                                      :updated => publisher_product_platform_updated.updated_at.to_s(:long) } }
    end
    
  end  






  #7 file_type_index
  def update_file_type_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    file_type_index = h_obj[:file_type_index]
    
    ar_file_type = Array.new
    ar_file_type = file_type_index.split(',')
    len = ar_file_type.length

    h_update = Hash.new
    h_update[:file_type_1] = false
    h_update[:file_type_2] = false
    h_update[:file_type_3] = false
    # h_update[:file_type_4] = false
    # h_update[:file_type_5] = false
    # h_update[:file_type_6] = false
    # h_update[:file_type_7] = false
    # h_update[:file_type_8] = false
    # h_update[:file_type_9] = false
    # h_update[:file_type_10] = false
    # h_update[:file_type_11] = false
    # h_update[:file_type_12] = false
    # h_update[:file_type_13] = false
    # h_update[:file_type_14] = false
    # h_update[:file_type_15] = false
    # h_update[:file_type_16] = false
    # h_update[:file_type_17] = false
    # h_update[:file_type_18] = false
    # h_update[:file_type_19] = false
    # h_update[:file_type_20] = false
    # h_update[:file_type_21] = false
    # h_update[:file_type_22] = false
    # h_update[:file_type_23] = false
    # h_update[:file_type_24] = false
    # h_update[:file_type_25] = false
    # h_update[:file_type_26] = false
    # h_update[:file_type_27] = false
    # h_update[:file_type_28] = false
    # h_update[:file_type_29] = false
    # h_update[:file_type_30] = false
    
    ar_file_type.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:file_type_1] = true
        when "2"
          h_update[:file_type_2] = true
        when "3"
          h_update[:file_type_3] = true
        # when "4"
          # h_update[:file_type_4] = true
        # when "5"
          # h_update[:file_type_5] = true
        # when "6"
          # h_update[:file_type_6] = true
        # when "7"
          # h_update[:file_type_7] = true
        # when "8"
          # h_update[:file_type_8] = true
        # when "9"
          # h_update[:file_type_9] = true
        # when "10"
          # h_update[:file_type_10] = true
        # when "11"
          # h_update[:file_type_11] = true
        # when "12"
          # h_update[:file_type_12] = true
        # when "13"
          # h_update[:file_type_13] = true
        # when "14"
          # h_update[:file_type_14] = true
        # when "15"
          # h_update[:file_type_15] = true
        # when "16"
          # h_update[:file_type_16] = true
        # when "17"
          # h_update[:file_type_17] = true
        # when "18"
          # h_update[:file_type_18] = true
        # when "19"
          # h_update[:file_type_19] = true
        # when "20"
          # h_update[:file_type_20] = true
        # when "21"
          # h_update[:file_type_21] = true
        # when "22"
          # h_update[:file_type_22] = true
        # when "23"
          # h_update[:file_type_23] = true
        # when "24"
          # h_update[:file_type_24] = true
        # when "25"
          # h_update[:file_type_25] = true
        # when "26"
          # h_update[:file_type_26] = true
        # when "27"
          # h_update[:file_type_27] = true
        # when "28"
          # h_update[:file_type_28] = true
        # when "29"
          # h_update[:file_type_29] = true
        # when "30"
          # h_update[:file_type_30] = true
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
    
    gon.file_type[1] = publisher_product_file_type_updated.file_type_1
    gon.file_type[2] = publisher_product_file_type_updated.file_type_2
    gon.file_type[3] = publisher_product_file_type_updated.file_type_3
    # gon.file_type[4] = publisher_product_file_type_updated.file_type_4
    # gon.file_type[5] = publisher_product_file_type_updated.file_type_5
    # gon.file_type[6] = publisher_product_file_type_updated.file_type_6
    # gon.file_type[7] = publisher_product_file_type_updated.file_type_7
    # gon.file_type[8] = publisher_product_file_type_updated.file_type_8
    # gon.file_type[9] = publisher_product_file_type_updated.file_type_9
    # gon.file_type[10] = publisher_product_file_type_updated.file_type_10
    # gon.file_type[11] = publisher_product_file_type_updated.file_type_11
    # gon.file_type[12] = publisher_product_file_type_updated.file_type_12
    # gon.file_type[13] = publisher_product_file_type_updated.file_type_13
    # gon.file_type[14] = publisher_product_file_type_updated.file_type_14
    # gon.file_type[15] = publisher_product_file_type_updated.file_type_15
    # gon.file_type[16] = publisher_product_file_type_updated.file_type_16
    # gon.file_type[17] = publisher_product_file_type_updated.file_type_17
    # gon.file_type[18] = publisher_product_file_type_updated.file_type_18
    # gon.file_type[19] = publisher_product_file_type_updated.file_type_19
    # gon.file_type[20] = publisher_product_file_type_updated.file_type_20
    # gon.file_type[21] = publisher_product_file_type_updated.file_type_21
    # gon.file_type[22] = publisher_product_file_type_updated.file_type_22
    # gon.file_type[23] = publisher_product_file_type_updated.file_type_23
    # gon.file_type[24] = publisher_product_file_type_updated.file_type_24
    # gon.file_type[25] = publisher_product_file_type_updated.file_type_25
    # gon.file_type[26] = publisher_product_file_type_updated.file_type_26
    # gon.file_type[27] = publisher_product_file_type_updated.file_type_27
    # gon.file_type[28] = publisher_product_file_type_updated.file_type_28
    # gon.file_type[29] = publisher_product_file_type_updated.file_type_29
    # gon.file_type[30] = publisher_product_file_type_updated.file_type_30

    b_has_file_type = false
    
    if (publisher_product_file_type_updated.file_type_1 or
        publisher_product_file_type_updated.file_type_2 or
        publisher_product_file_type_updated.file_type_3)
        # publisher_product_file_type_updated.file_type_4 or
        # publisher_product_file_type_updated.file_type_5 or
        # publisher_product_file_type_updated.file_type_6 or
        # publisher_product_file_type_updated.file_type_7 or
        # publisher_product_file_type_updated.file_type_8 or
        # publisher_product_file_type_updated.file_type_9 or
        # publisher_product_file_type_updated.file_type_10 or
        # publisher_product_file_type_updated.file_type_11 or
        # publisher_product_file_type_updated.file_type_12 or
        # publisher_product_file_type_updated.file_type_13 or
        # publisher_product_file_type_updated.file_type_14 or
        # publisher_product_file_type_updated.file_type_15 or
        # publisher_product_file_type_updated.file_type_16 or
        # publisher_product_file_type_updated.file_type_17 or
        # publisher_product_file_type_updated.file_type_18 or
        # publisher_product_file_type_updated.file_type_19 or
        # publisher_product_file_type_updated.file_type_20 or
        # publisher_product_file_type_updated.file_type_21 or
        # publisher_product_file_type_updated.file_type_22 or
        # publisher_product_file_type_updated.file_type_23 or
        # publisher_product_file_type_updated.file_type_24 or
        # publisher_product_file_type_updated.file_type_25 or
        # publisher_product_file_type_updated.file_type_26 or
        # publisher_product_file_type_updated.file_type_27 or
        # publisher_product_file_type_updated.file_type_28 or
        # publisher_product_file_type_updated.file_type_29 or
        # publisher_product_file_type_updated.file_type_30)

        b_has_file_type = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_file_type => b_has_file_type,
                                      :g_updated => gon.file_type,
                                      :updated => publisher_product_file_type_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

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
    
    ar_enhancement = Array.new
    ar_enhancement = enhancement.split(',')
    len = ar_enhancement.length

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
    
    gon.enhancement = []
    
    gon.enhancement[1] = publisher_product_enhancement_updated.enhancement_1
    gon.enhancement[2] = publisher_product_enhancement_updated.enhancement_2
    gon.enhancement[3] = publisher_product_enhancement_updated.enhancement_3
    gon.enhancement[4] = publisher_product_enhancement_updated.enhancement_4
    gon.enhancement[5] = publisher_product_enhancement_updated.enhancement_5
    gon.enhancement[6] = publisher_product_enhancement_updated.enhancement_6
    gon.enhancement[7] = publisher_product_enhancement_updated.enhancement_7
    gon.enhancement[8] = publisher_product_enhancement_updated.enhancement_8
    gon.enhancement[9] = publisher_product_enhancement_updated.enhancement_9
    gon.enhancement[10] = publisher_product_enhancement_updated.enhancement_10

    b_has_enhancement = false
    
    if (publisher_product_enhancement_updated.enhancement_1 or
        publisher_product_enhancement_updated.enhancement_2 or
        publisher_product_enhancement_updated.enhancement_3 or
        publisher_product_enhancement_updated.enhancement_4 or
        publisher_product_enhancement_updated.enhancement_5 or
        publisher_product_enhancement_updated.enhancement_6 or
        publisher_product_enhancement_updated.enhancement_7 or
        publisher_product_enhancement_updated.enhancement_8 or
        publisher_product_enhancement_updated.enhancement_9 or
        publisher_product_enhancement_updated.enhancement_10)

        b_has_enhancement = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_enhancement => b_has_enhancement,
                                      :g_updated => gon.enhancement,
                                      :updated => publisher_product_enhancement_updated.updated_at.to_s(:long) } }

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
    h_update[:pricing_model_4] = false
    h_update[:pricing_model_5] = false
    
    ar_pricing_model.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:pricing_model_1] = true
        when "2"
          h_update[:pricing_model_2] = true
        when "3"
          h_update[:pricing_model_3] = true
        when "4"
          h_update[:pricing_model_4] = true
        when "5"
          h_update[:pricing_model_5] = true
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
    
    gon.pricing_model = []
    
    gon.pricing_model[1] = publisher_product_pricing_model_updated.pricing_model_1
    gon.pricing_model[2] = publisher_product_pricing_model_updated.pricing_model_2
    gon.pricing_model[3] = publisher_product_pricing_model_updated.pricing_model_3
    gon.pricing_model[4] = publisher_product_pricing_model_updated.pricing_model_4
    gon.pricing_model[5] = publisher_product_pricing_model_updated.pricing_model_5

    b_has_pricing_model = false
    
    if (publisher_product_pricing_model_updated.pricing_model_1 or
        publisher_product_pricing_model_updated.pricing_model_2 or
        publisher_product_pricing_model_updated.pricing_model_3 or
        publisher_product_pricing_model_updated.pricing_model_4 or
        publisher_product_pricing_model_updated.pricing_model_5)

        b_has_pricing_model = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_pricing_model => b_has_pricing_model,
                                      :g_updated => gon.pricing_model,
                                      :updated => publisher_product_pricing_model_updated.updated_at.to_s(:long) } }

      # format.json { render :json => {} }

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
    # if (publisher_product_price_updated.price_1 or
        # publisher_product_price_updated.price_2 or
        # publisher_product_price_updated.price_3 or
        # publisher_product_price_updated.price_4 or
        # publisher_product_price_updated.price_5 or
        # publisher_product_price_updated.price_6 or
        # publisher_product_price_updated.price_7 or
        # publisher_product_price_updated.price_8 or
        # publisher_product_price_updated.price_9 or
        # publisher_product_price_updated.price_10 or
        # publisher_product_price_updated.price_11 or
        # publisher_product_price_updated.price_12)
# 
        # b_has_price = true
        
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
      format.json { render :json => { :g_updated => gon.price,
                                      :updated => publisher_product_price_updated.updated_at.to_s(:long) } }

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



  #7 lesson_time
  def update_lesson_time

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    # publisher_product_description_id = h_obj[:publisher_product_description_id]
    lesson_time = h_obj[:lesson_time]
    lesson_time_pertinent_index = h_obj[:lesson_time_pertinent_index]
    
    ar_lesson_time = Array.new
    ar_lesson_time = lesson_time.split(',')
    # len = ar_lesson_time.length

    h_update = Hash.new
    h_update[:lesson_time_1] = false
    h_update[:lesson_time_2] = false
    h_update[:lesson_time_3] = false
    h_update[:lesson_time_4] = false
    h_update[:lesson_time_5] = false
    h_update[:lesson_time_6] = false
    h_update[:lesson_time_7] = false
    h_update[:lesson_time_8] = false
    h_update[:lesson_time_9] = false
    h_update[:lesson_time_10] = false
    h_update[:lesson_time_11] = false
    h_update[:lesson_time_12] = false
    h_update[:lesson_time_pertinent_index] = lesson_time_pertinent_index
    
    ar_lesson_time.each do |target|
      
      case target.to_s  
        when "1"
          h_update[:lesson_time_1] = true
        when "2"
          h_update[:lesson_time_2] = true
        when "3"
          h_update[:lesson_time_3] = true
        when "4"
          h_uppate[:lesson_time_4] = true
        when "5"
          h_update[:lesson_time_5] = true
        when "6"
          h_update[:lesson_time_6] = true
        when "7"
          h_update[:lesson_time_7] = true
        when "8"
          h_update[:lesson_time_8] = true
        when "9"
          h_update[:lesson_time_9] = true
        when "10"
          h_update[:lesson_time_10] = true
        when "11"
          h_update[:lesson_time_11] = true
        when "12"
          h_update[:lesson_time_12] = true
        else
          #        
      end
      
    end

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    publisher_product_lesson_time = PublisherProductLessonTime.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_lesson_time.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_lesson_time_id = publisher_product_lesson_time.id
    publisher_product_lesson_time = nil
    publisher_product_lesson_time_updated = PublisherProductLessonTime.find(publisher_product_lesson_time_id)
    
    gon.lesson_time = []
    
    gon.lesson_time[1] = publisher_product_lesson_time_updated.lesson_time_1
    gon.lesson_time[2] = publisher_product_lesson_time_updated.lesson_time_2
    gon.lesson_time[3] = publisher_product_lesson_time_updated.lesson_time_3
    gon.lesson_time[4] = publisher_product_lesson_time_updated.lesson_time_4
    gon.lesson_time[5] = publisher_product_lesson_time_updated.lesson_time_5
    gon.lesson_time[6] = publisher_product_lesson_time_updated.lesson_time_6
    gon.lesson_time[7] = publisher_product_lesson_time_updated.lesson_time_7
    gon.lesson_time[8] = publisher_product_lesson_time_updated.lesson_time_8
    gon.lesson_time[9] = publisher_product_lesson_time_updated.lesson_time_9
    gon.lesson_time[10] = publisher_product_lesson_time_updated.lesson_time_10
    gon.lesson_time[11] = publisher_product_lesson_time_updated.lesson_time_11
    gon.lesson_time[12] = publisher_product_lesson_time_updated.lesson_time_12

    gon.lesson_time_pertinent_index = publisher_product_lesson_time_updated.lesson_time_pertinent_index

    b_has_lesson_time = false
    
    if (publisher_product_lesson_time_updated.lesson_time_1 or
        publisher_product_lesson_time_updated.lesson_time_2 or
        publisher_product_lesson_time_updated.lesson_time_3 or
        publisher_product_lesson_time_updated.lesson_time_4 or
        publisher_product_lesson_time_updated.lesson_time_5 or
        publisher_product_lesson_time_updated.lesson_time_6 or
        publisher_product_lesson_time_updated.lesson_time_7 or
        publisher_product_lesson_time_updated.lesson_time_8 or
        publisher_product_lesson_time_updated.lesson_time_9 or
        publisher_product_lesson_time_updated.lesson_time_10 or
        publisher_product_lesson_time_updated.lesson_time_11 or
        publisher_product_lesson_time_updated.lesson_time_12)

        b_has_lesson_time = true
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_lesson_time => b_has_lesson_time,
                                      :g_lesson_time => gon.lesson_time,
                                      :g_lesson_time_pertinent_index => gon.lesson_time_pertinent_index,
                                      :updated => publisher_product_lesson_time_updated.updated_at.to_s(:long) } }
    end
    
  end  



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


  # #7 user_rating
  # def update_user_rating
# 
    # ar = params[:publisher_product_description]
    # h_obj = Hash.new
    # ar.each do |obj|
      # h_obj = obj
    # end
# 
    # # publisher_id = h_obj[:publisher_id]
    # publisher_product_id = h_obj[:publisher_product_id]
    # # publisher_product_description_id = h_obj[:publisher_product_description_id]
    # user_rating = h_obj[:user_rating]
#     
    # ar_user_rating = Array.new
    # ar_user_rating = user_rating.split(',')
# 
    # h_update = Hash.new
    # h_update[:user_rating_1] = false
    # h_update[:user_rating_2] = false
    # h_update[:luser_rating_3] = false
#     
    # ar_user_rating.each do |target|
#       
      # case target.to_s  
        # when "1"
          # h_update[:user_rating_1] = true
        # when "2"
          # h_update[:user_rating_2] = true
        # when "3"
          # h_update[:user_rating_3] = true
        # else
          # #        
      # end
#       
    # end
# 
    # # h_update[:publisher_id] = publisher_id
    # # h_update[:publisher_product_id] = publisher_product_id
    # # h_update[:publisher_product_description_id] = publisher_product_description_id
# 
    # publisher_product_description_user_rating = PublisherProductDecription.find(publisher_product_description_id)
# 
    # if publisher_product_description_user_rating.update_attributes(h_update)
      # #
    # else
      # # Rails.logger.info(@user.errors.messages.inspect)
    # end
# 
    # publisher_product_description_user_rating_updated = PublisherProductDecription.find(publisher_product_description_id)
#     
    # gon.user_rating = []
#     
    # gon.user_rating[1] = publisher_product_description_user_rating_updated.user_rating_1
    # gon.user_rating[2] = publisher_product_description_user_rating_updated.user_rating_2
    # gon.user_rating[3] = publisher_product_description_user_rating_updated.user_rating_3
# 
# 
    # b_has_user_rating = false
#     
    # if (publisher_product_description_user_rating_updated.lesson_time_1 or
        # publisher_product_description_user_rating_updated.lesson_time_2 or
        # publisher_product_description_user_rating_updated.lesson_time_3)
# 
        # b_has_user_rating = true
    # end
#     
    # respond_to do |format|
      # format.html {}
      # format.json { render :json => { :b_has_user_rating => b_has_user_rating,
                                      # :g_user_rating => gon.user_rating,
                                      # :updated => publisher_product_description_user_rating_updated.updated_at.to_s(:long) } }
    # end
#     
  # end  






































  
    

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
    
    # ar_core_literacy_standard = Array.new
    # ar_core_literacy_standard = core_literacy_standard.split(',')
    # len = ar_core_literacy_standard.length

    h_update = Hash.new
    h_update[:core_literacy_standard] = core_literacy_standard 

    
    # ar_core_literacy_standard.each do |standard|
      # case standard.to_s  
        # when "1"
          # h_update[:core_literacy_standard_1] = true
        # else
          # #        
      # end
    # end

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    # h_update = Hash.new

    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    # h_update[:publisher_product_description_id] = publisher_product_description_id

    # publisher_product_core_literacy_standard = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", publisher_product_id).first
    publisher_product_description = PublisherProductDescription.where("publisher_product_id = ?", publisher_product_id).first

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description_id = publisher_product_description.id
    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    gon.core_literacy_standard = []
    if (publisher_product_description_updated.core_literacy_standard.blank?) or (publisher_product_description_updated.core_literacy_standard.empty?) or (publisher_product_description_updated.core_literacy_standard.nil?)
      #
    else
      core_literacy_standard = publisher_product_description_updated.core_literacy_standard
      ar_core_literacy_standard = Array.new
      ar_core_literacy_standard = core_literacy_standard.split(',')    
      i = 0
      ar_core_literacy_standard.each do |standard|    
        gon.core_literacy_standard[i] = standard
        i += 1
      end
    end
    
    # gon.core_literacy_standard[1] = publisher_product_core_literacy_standard_updated.core_literacy_standard_1

    b_has_core_literacy_standard = false
    
    if (publisher_product_description_updated.core_literacy_standard.blank?) or (publisher_product_description_updated.core_literacy_standard.empty?) or (publisher_product_description_updated.core_literacy_standard.nil?)
      #
    else
      b_has_core_literacy_standard = true
    end
    
    # if (publisher_product_core_literacy_standard_updated.core_literacy_standard_1 or
        # publisher_product_core_literacy_standard_updated.core_literacy_standard_2 or
        # publisher_product_core_literacy_standard_updated.core_literacy_standard_3)
        # b_has_core_literacy_standard = true
    # end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :b_has_core_literacy_standard => b_has_core_literacy_standard,
                                      :g_updated => gon.core_literacy_standard,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
    end

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
                                                           )

    end
    
    
    def sort_column
      CoreLiteracyStandard.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def yesno(x)
      x == 1 ? "Yes" : "No"
    end
    
    def return_all_dtab1lets      
      # return Dtab1let.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])
      return Dtab1let.order(sort_column + " " + sort_direction)
    end
    def sort_column_dtab1let
      Dtab1let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def return_all_dtab2lets      
      return Dtab2let.order(sort_column + " " + sort_direction)
    end
    def sort_column_dtab2let
      Dtab2let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def return_all_dtab3lets      
      return Dtab3let.order(sort_column + " " + sort_direction)
    end
    def sort_column_dtab3let
      Dtab3let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab4lets      
      return Dtab4let.order(sort_column + " " + sort_direction)
    end
    def sort_column_dtab4let
      Dtab4let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def return_all_dtab5lets      
      return Dtab5let.order(sort_column + " " + sort_direction)
    end
    def sort_column_dtab5let
      Dtab5let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
      
end
