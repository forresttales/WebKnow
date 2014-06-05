class PublisherProductDescriptionsController < ApplicationController

  layout 'publisher'
  
  @@publisher_product_id = nil
  
  before_filter :force_http

    
  
  def index

    @@publisher_product_id = params[:id]

    @publisher_product_descriptions = PublisherProductDescription.where("publisher_product_id = ?", @@publisher_product_id)
    
    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_name = publisher_product.name_product
    @publisher_product_has_description = publisher_product.has_description
    @publisher_product_id = @@publisher_product_id
    
    @has_product_logo = publisher_product.has_product_logo
    @has_product_metadata = publisher_product.has_product_metadata
    
    if @has_product_logo
      gon.image_name = publisher_product.product_logo
    else
      gon.image_name = ''
    end

    @product_metadata = ''
    if @has_product_metadata
      @product_metadata = publisher_product.product_metadata
    end
    
  end
  
  
  def show
    
    # @publisher_product_desciptions = PublisherProductDescription.find(params[:id])
    @publisher_product_descriptions = PublisherProductDescription.where("id = ?", params[:id])
    
  end
  
  
  def new
    
    if !(session[:username].nil? or session[:publisher_id].nil?)
      # @username = session[:username]
      @publisher_product_description = PublisherProductDescription.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create

    publisher_product_description = PublisherProductDescription.new(publisher_product_description_params)
    publisher_product = PublisherProduct.find( @@publisher_product_id )
    publisher_product_description.publisher_product_id = @@publisher_product_id    
    publisher_product_description.publisher_id = session[:publisher_id]

    type_content_index = publisher_product_description.type_content_index
    case type_content_index.to_s  
      when "1"
        publisher_product_description.type_content = "App"
      when "2"
        publisher_product_description.type_content = "Lesson Plan Document"
      when "3"
        publisher_product_description.type_content = "Digital Curriculum"
      when "4"
        publisher_product_description.type_content = "eBook"
      when "5"
        publisher_product_description.type_content = "Game"
      when "6"
        publisher_product_description.type_content = "Software - School Management"
      when "7"
        publisher_product_description.type_content = "Software - Other"
      when "8"
        publisher_product_description.type_content = "Online Course"
      when "9"
        publisher_product_description.type_content = "Tools"
      when "10"
        publisher_product_description.type_content = "Video"
      else
        publisher_product_description.type_content = ""
    end


    subject_category_index = publisher_product_description.subject_category_index
    case subject_category_index.to_s  
      when "1"
        publisher_product_description.subject_category = "Language Arts"
      when "2"
        publisher_product_description.subject_category = "Science"
      when "3"
        publisher_product_description.subject_category = "Music & Drama"
      when "4"
        publisher_product_description.subject_category = "Physical Educations"
      when "5"
        publisher_product_description.subject_category = "Arts"
      when "6"
        publisher_product_description.subject_category = "Professional Development"
      when "7"
        publisher_product_description.subject_category = "Extra-Curricular"
      else
        publisher_product_description.subject_category = ""
    end



    age_appropriate_index = publisher_product_description.age_appropriate_index
    case age_appropriate_index.to_s  
      when "1"
        publisher_product_description.age_appropriate = "2 to 5"
      when "2"
        publisher_product_description.age_appropriate = "5 to 10"
      when "3"
        publisher_product_description.age_appropriate = "10 to 15"
      when "4"
        publisher_product_description.age_appropriate = "15 to 18"
      else
        publisher_product_description.age_appropriate = ""
    end


    grade_index = publisher_product_description.grade_index
    case grade_index.to_s  
      when "1"
        publisher_product_description.grade = "1"
      when "2"
        publisher_product_description.grade = "2"
      when "3"
        publisher_product_description.grade = "3"
      when "4"
        publisher_product_description.grade = "4"
      else
        publisher_product_description.grade = ""
    end


    platform_index = publisher_product_description.platform_index
    case platform_index.to_s  
      when "1"
        publisher_product_description.platform = "Apple iOS"
      when "2"
        publisher_product_description.platform = "Kindle Android"
      when "3"
        publisher_product_description.platform = "Google Android"
      when "4"
        publisher_product_description.platform = "Linux"
      when "5"
        publisher_product_description.platform = "Microsoft"
      when "6"
        publisher_product_description.platform = "HTML"
      when "7"
        publisher_product_description.platform = "Nook"
      when "8"
        publisher_product_description.platform = "Other"
      else
        publisher_product_description.platform = ""
    end


    pricing_model_index = publisher_product_description.pricing_model_index
    case pricing_model_index.to_s  
      when "1"
        publisher_product_description.pricing_model = "Free"
      when "2"
        publisher_product_description.pricing_model = "Premium"
      else
        publisher_product_description.pricing_model = ""
    end


    if publisher_product.update_columns( :has_description => true)      
      if publisher_product_description.save
        redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s
      else
        render text: 'Save Publisher Product Description failed'
      end
    else
      render text: 'Update publisher_product_id failed'
    end
    
  end


  def edit
    @publisher_product_description = PublisherProductDescription.find_by_id(params[:id])    
    
    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_name = publisher_product.name_product
    # @publisher_product_has_description = publisher_product.has_description
    @publisher_product_id = @@publisher_product_id
    
    @type_content = ""
    
  end
  
  def update
    
    publisher_product_description = PublisherProductDescription.find(params[:id])
    publisher_product_description_temp = PublisherProductDescription.new(publisher_product_description_params)
    type_content_index = publisher_product_description_temp.type_content_index
    subject_category_index = publisher_product_description_temp.subject_category_index
    publisher_product_description_temp = nil
    
    s = ""
    case type_content_index.to_s  
      when "1"
        s = "App"
      when "2"
        s = "Lesson Plan Document"
      when "3"
        s = "Digital Curriculum"
      when "4"
        s = "eBook"
      when "5"
        s = "Game"
      when "6"
        s = "Software - School Management"
      when "7"
        s = "Software - Other"
      when "8"
        s = "Online Course"
      when "9"
        s = "Tools"
      when "10"
        s = "Video"
      else
        #        
    end

    s_type_content = s

    case subject_category_index.to_s  
      when "1"
        s = "Language Arts"
      when "2"
        s = "Science"
      when "3"
        s = "Music & Drama"
      when "4"
        s = "Physical Educations"
      when "5"
        s = "Arts"
      when "6"
        s = "Professional Development"
      when "7"
        s = "Extra-Curricular"
      else
        #        
    end
    
    s_subject_category = s
    h_update = Hash.new
    h_update = params[:publisher_product_description]
    h_update['type_content'] = s_type_content
    h_update['subject_category'] = s_subject_category

    if publisher_product_description.update_attributes(h_update)
        redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s
    else
      render text: 'update failed'
    end    
    
    
  end
  
  
  def upload
    
    render text: 'upload'
    
    # uploaded_io = params[:upload_file]
    # render text: params[:upload_file]

    # File.open(Rails.root.join('public', 'images_publisher_product_logo', uploaded_io.original_filename), 'wb') do |file|
      # file.write(uploaded_io.read)
    # end

    # publisher_product = PublisherProduct.find( @@publisher_product_id )
    # publisher_product.product_logo = uploaded_io.original_filename
    # publisher_product.has_product_logo = true
    
    # h_update = Hash.new
    # h_update = { :product_logo => '', :has_product_logo => false }
    # h_update['product_logo'] = uploaded_io.original_filename
    # h_update['has_product_logo'] = true
    
    # if publisher_product.update_columns( h_update )
      # redirect_to '/PublisherProductDescription?id=' + @@publisher_product_id.to_s
    # else
      # render text: 'Product Logo save failed'
    # end      
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
                                                            :pricing_model_index 
                                                           )

    end
    
    
    
    
      
end
