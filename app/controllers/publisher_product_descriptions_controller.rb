class PublisherProductDescriptionsController < ApplicationController

  before_filter :force_http

  layout 'publisher'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction, :yesno

  @@publisher_product_id = nil
  # @@publisher_id = nil
    
  
  def show_description
    
    # render text: 'show_description'
    
    @@publisher_product_id = params[:publisher_product_id]
    redirect_to :action => :index
    # render text: params[:publisher_product_id]

  end
  
  
  
  # def index
    # # render text: params[:publisher_product_id]
    # render text: 'publisher_product_descriptions index'
#     
  # end
  
  
  
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
    # @publisher_product_description = current_user.publisher.publisher_products.publisher_product_description
    @publisher_product_description_id = @publisher_product_description.id
    # @publisher_product_image = PublisherProductImage.where(:publisher_id => @publisher_id, :publisher_product_id => @publisher_product_id).first
    # @publisher_product_logo = PublisherProductLogo.where(:publisher_id => @publisher_id, :publisher_product_id => @publisher_product_id).first
    # @publisher_product_appropriate_age = PublisherProductAppropriateAge.where("publisher_product_id = ?", @publisher_product_id).first
    @publisher_product_image = publisher_product.publisher_product_image
    @publisher_product_logo = publisher_product.publisher_product_logo
    @publisher_product_appropriate_age = publisher_product.publisher_product_appropriate_age

    # @publisher_product_core_literacy_standard = PublisherProductCoreLiteracyStandard.where("publisher_product_id = ?", @publisher_product_id).first
    # @publisher_product_core_math_standard = PublisherProductCoreMathStandard.where("publisher_product_id = ?", @publisher_product_id).first

    # @core_literacy_standards = CoreLiteracyStandard.all
    @core_literacy_standards = CoreLiteracyStandard.order(sort_column + " " + sort_direction).paginate(:per_page => 10000, :page => params[:page])
    # @core_math_standards = CoreMathStandard.all
    
    @b_name_product = true                # 1
    @b_description = true                 # 2
    @b_type_content_index = true          # 3
    @b_core_supplemental_index = true     # 4
    @b_source_url = true                  # 5
    @b_subject_category_index = true      # 6
    @b_age_appropriate_index = false      # 7
    @b_grade_index = true                 # 8
    @b_platform_index = true              # 9
    @b_pricing_model_index = true         # 10
    @b_price = true                       # 11
    @b_versions = true                    # 12
    @b_topic = true                       # 13
    @b_lesson_plan_subject = true         # 14
    @b_word_description = true            # 15

    @b_core_literacy_standard = true      # 16
    @b_core_math_standard = true          # 17
    
    # 1 name_product
    if (@publisher_product_description.name_product.blank?) or (@publisher_product_description.name_product.empty?) or (@publisher_product_description.name_product.nil?)
      @b_name_product = false
    end
    # 2 description
    if (@publisher_product_description.description.blank?) or (@publisher_product_description.description.empty?) or (@publisher_product_description.description.nil?)
      @b_description = false
    end
    # 3 type_content_index
    if (@publisher_product_description.type_content_index.blank?) or (@publisher_product_description.type_content_index.nil?) or (@publisher_product_description.type_content_index == 0)
      @b_type_content_index = false
    end
    # 4 core_supplemental_index
    if (@publisher_product_description.core_supplemental_index.blank?) or (@publisher_product_description.core_supplemental_index.nil?) or (@publisher_product_description.core_supplemental_index == 0)
      @b_core_supplemental_index = false
    end
    # 5 source_url
    if (@publisher_product_description.source_url.blank?) or (@publisher_product_description.source_url.empty?) or (@publisher_product_description.source_url.nil?)
      @b_source_url = false
    end
    # 6 subject_category_index
    if (@publisher_product_description.subject_category_index.blank?) or (@publisher_product_description.subject_category_index.nil?) or (@publisher_product_description.subject_category_index == 0)
      @b_subject_category_index = false
    end
    # 7 age_appropriate_index
    # if (@publisher_product_description.age_appropriate_index.blank?) or (@publisher_product_description.age_appropriate_index.nil?) or (@publisher_product_description.age_appropriate_index == 0)
      # @b_age_appropriate_index = false
    # end
    # 8 grade_index
    if (@publisher_product_description.grade_index.blank?) or (@publisher_product_description.grade_index.nil?) or (@publisher_product_description.grade_index == 0)
      @b_grade_index = false
    end
    # 9 platform_index
    if (@publisher_product_description.platform_index.blank?) or (@publisher_product_description.platform_index.nil?) or (@publisher_product_description.platform_index == 0)
      @b_platform_index = false
    end
    # 10 pricing_model_index
    if (@publisher_product_description.pricing_model_index.blank?) or (@publisher_product_description.pricing_model_index.nil?) or (@publisher_product_description.pricing_model_index == 0)
      @b_pricing_model_index = false
    end
    # 11 price
    if (@publisher_product_description.price.blank?) or (@publisher_product_description.price.nil?)
      @b_price = false
    end
    # 12 versions
    if (@publisher_product_description.versions.blank?) or (@publisher_product_description.versions.empty?) or (@publisher_product_description.versions.nil?)
      @b_versions = false
    end
    # 13 topic
    if (@publisher_product_description.topic.blank?) or (@publisher_product_description.topic.empty?) or (@publisher_product_description.topic.nil?)
      @b_topic = false
    end
    # 14 lesson_plan_subject
    if (@publisher_product_description.lesson_plan_subject.blank?) or (@publisher_product_description.lesson_plan_subject.empty?) or (@publisher_product_description.lesson_plan_subject.nil?)
      @b_lesson_plan_subject = false
    end
    # 15 word_description
    if (@publisher_product_description.word_description.blank?) or (@publisher_product_description.word_description.empty?) or (@publisher_product_description.word_description.nil?)
      @b_word_description = false
    end

    # 16 core_literacy_standard
    if (@publisher_product_description.core_literacy_standard.blank?) or (@publisher_product_description.core_literacy_standard.empty?) or (@publisher_product_description.core_literacy_standard.nil?)
      @b_core_literacy_standard = false
    end
    # 16 core_math_standard
    if (@publisher_product_description.core_math_standard.blank?) or (@publisher_product_description.core_math_standard.empty?) or (@publisher_product_description.core_math_standard.nil?)
      @b_core_math_standard = false
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

    gon.updated = @publisher_product_description.updated_at.to_s(:long)

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
  
  #3 type_content_index
  def update_type_content_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    type_content_index = h_obj[:type_content_index]

    type_content = ""
    case type_content_index.to_s  
      when "1"
        type_content = "App"
      when "2"
        type_content = "Lesson Plan Document"
      when "3"
        type_content = "Digital Curriculum"
      when "4"
        type_content = "eBook"
      when "5"
        type_content = "Game"
      when "6"
        type_content = "Software - School Management"
      when "7"
        type_content = "Software - Other"
      when "8"
        type_content = "Online Course"
      when "9"
        type_content = "Tools"
      when "10"
        type_content = "Video"
      else
        #        
    end

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:type_content_index] = type_content_index
    h_update[:type_content] = type_content

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :type_content_index => publisher_product_description_updated.type_content_index,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  
  
  
  #4 core_supplemental_index
  def update_core_supplemental_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    core_supplemental_index = h_obj[:core_supplemental_index]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:core_supplemental_index] = core_supplemental_index
    core_supplemental = ""
    case core_supplemental_index.to_s  
      when "1"
        core_supplemental = "Core"
      when "2"
        core_supplemental = "Supplemental"
      else
        #        
    end
    h_update[:core_supplemental] = core_supplemental

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :core_supplemental_index => publisher_product_description_updated.core_supplemental_index,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
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


  #6 subject_category_index
  def update_subject_category_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    subject_category_index = h_obj[:subject_category_index]

    # ['Language Arts', '1'],
    # ['Science','2'],
    # ['Music & Drama','3'],
    # ['Physical Educations','4'],
    # ['Arts','5'],
    # ['Professional Development','6'],
    # ['Extra-Curricular','7']],

    subject_category = ""
    case subject_category_index.to_s  
      when "1"
        subject_category = "Language Arts"
      when "2"
        subject_category = "Science"
      when "3"
        subject_category = "Music & Drama"
      when "4"
        subject_category = "Physical Education"
      when "5"
        subject_category = "Arts"
      when "6"
        subject_category = "Professional Development"
      when "7"
        subject_category = "Extra-Curricular"
      else
        #        
    end

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:subject_category_index] = subject_category_index
    h_update[:subject_category] = subject_category

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :subject_category_index => publisher_product_description_updated.subject_category_index,
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
  
  
  
  #8 grade_index
  def update_grade_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    grade_index = h_obj[:grade_index]

    # ['grade 1', '1'],
    # ['grade 2','2'],
    # ['grade 3','3'],
    # ['grade 4','4']],

    grade = ""
    case grade_index.to_s  
      when "1"
        grade = "Grade 1"
      when "2"
        grade = "Grade 2"
      when "3"
        grade = "Grade 3"
      when "4"
        grade = "Grade 4"
      else
        #        
    end

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:grade_index] = grade_index
    h_update[:grade] = grade

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :grade_index => publisher_product_description_updated.grade_index,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  


  #9 platform_index
  def update_platform_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    platform_index = h_obj[:platform_index]

    # ['Apple iOS', '1'],
    # ['Kindle Android','2'],
    # ['Google Android','3'],
    # ['Linux','4'],
    # ['Microsoft','5'],
    # ['HTML','6'],
    # ['Nook','7'],                         
    # ['Other','8']],

    platform = ""
    case platform_index.to_s  
      when "1"
        platform = "Apple iOS"
      when "2"
        platform = "Kindle Android"
      when "3"
        platform = "Google Android"
      when "4"
        platform = "Linux"
      when "5"
        platform = "Microsoft"
      when "6"
        platform = "HTML"
      when "7"
        platform = "Nook"
      when "8"
        platform = "Other"
      else
        #        
    end

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:platform_index] = platform_index
    h_update[:platform] = platform

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :platform_index => publisher_product_description_updated.platform_index,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  
  
  
  
  #10 pricing_model_index
  def update_pricing_model_index

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    pricing_model_index = h_obj[:pricing_model_index]

    # ['Free', '1'],
    # ['Premium','2']],

    pricing_model = ""
    case pricing_model_index.to_s  
      when "1"
        pricing_model = "Free"
      when "2"
        pricing_model = "Premium"
      else
        #        
    end

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)

    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:pricing_model_index] = pricing_model_index
    h_update[:pricing_model] = pricing_model

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :pricing_model_index => publisher_product_description_updated.pricing_model_index,
                                      :updated => publisher_product_description_updated.updated_at.to_s(:long) } }
      
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  


  #11 price  
  def update_price

    ar = params[:publisher_product_description]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher_product_id = h_obj[:publisher_product_id]
    publisher_product_description_id = h_obj[:publisher_product_description_id]
    price = h_obj[:price]

    publisher_product_description = PublisherProductDescription.find(publisher_product_description_id)
    
    h_update = Hash.new
    h_update[:publisher_id] = publisher_id
    h_update[:publisher_product_id] = publisher_product_id
    h_update[:price] = price

    if publisher_product_description.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher_product_description = nil
    publisher_product_description_updated = PublisherProductDescription.find(publisher_product_description_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :price => publisher_product_description_updated.price.to_s,
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

    #render text: 'dbdelete'
    PublisherProductDescription.dbdelete
    PublisherProductdescription.dbclear
      
    # respond_to do |format|
          # format.html {}
          # format.json { render :json => { :url => '/JournalPosterPositions-1' } }
          # # format.json { render :json => @journal1poster_position }
    # end
      
    respond_to do |format|
      # format.html
      # format.js { redirect_to(:action => 'index', :form => :js ) }
      format.js { redirect_to('/Publishers') }
    end

  end


  
  private

    def publisher_product_description_params
      params.require(:publisher_product_description).permit(      
                                                            :publisher_id,
                                                            :publisher_product_id, 
                                                            :description,
                                                            :price,
                                                            :type_content_index,
                                                            :subject_category_index,                                    
                                                            :type_content,
                                                            :subject_category,
                                                            :word_description,
                                                            :name_product,
                                                            :core_supplemental, 
                                                            :source_url, 
                                                            :topic,
                                                            :lesson_plan_subject, 
                                                            :word_description, 
                                                            :age_appropriate, 
                                                            :age_appropriate_index, 
                                                            :grade, 
                                                            :grade_index, 
                                                            :metadata,  
                                                            :platform, 
                                                            :platform_index,
                                                            :versions, 
                                                            :pricing_model, 
                                                            :pricing_model_index,
                                                            :core_literacy_standard,
                                                            :core_math_standard
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
    
    
      
end
