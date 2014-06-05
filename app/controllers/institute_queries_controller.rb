class InstituteQueriesController < ApplicationController

  layout 'institute'

  require 'csv'
  
  helper_method :sort_column, :sort_direction

  before_filter :force_http


  
  def index
    
    @institute_queries = InstituteQuery.where("institute_id = ?", session[:institute_id]).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
    
  end
  
  
  def execute
    
    institute_query = InstituteQuery.find(params[:id])
    
    # type_content
    # subject_category
    # word_description
    
    type_content = institute_query.type_content
    
    result_type_contents = PublisherProductDescription.where("type_content LIKE ?", type_content)  
     
    # render text: result_type_contents.count.to_s
    render text: result_type_contents[0].id.to_s



    
    # publisher_product_descriptions id=15


    
    
  end
  
  
  def show
    
    # render text: params[:id]
    
    @institute_query = InstituteQuery.find(params[:id])
    
  end
  
  
  def new
    
    if !(session[:username].nil? or session[:institute_id].nil?)
      # @username = session[:username]
      @institute_query = InstituteQuery.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create
    
    institute_query = InstituteQuery.new(institute_query_params)
    institute_query.institute_id = session[:institute_id]

    type_content_index = institute_query.type_content_index
    case type_content_index.to_s  
      when "1"
        institute_query.type_content = "App"
      when "2"
        institute_query.type_content = "Lesson Plan Document"
      when "3"
        institute_query.type_content = "Digital Curriculum"
      when "4"
        institute_query.type_content = "eBook"
      when "5"
        institute_query.type_content = "Game"
      when "6"
        institute_query.type_content = "Software - School Management"
      when "7"
        institute_query.type_content = "Software - Other"
      when "8"
        institute_query.type_content = "Online Course"
      when "9"
        institute_query.type_content = "Tools"
      when "10"
        institute_query.type_content = "Video"
      else
        institute_query.type_content = ""
    end

    subject_category_index = institute_query.subject_category_index
    case subject_category_index.to_s  
      when "1"
        institute_query.subject_category = "Language Arts"
      when "2"
        institute_query.subject_category = "Science"
      when "3"
        institute_query.subject_category = "Music & Drama"
      when "4"
        institute_query.subject_category = "Physical Educations"
      when "5"
        institute_query.subject_category = "Arts"
      when "6"
        institute_query.subject_category = "Professional Development"
      when "7"
        institute_query.subject_category = "Extra-Curricular"
      else
        institute_query.subject_category = ""
    end

    #if user.update_columns( :has_account => true, :account_type => "institute")      
      if institute_query.save
        
        # session[:has_account] = true
        
        redirect_to(:action => 'index')
      else
        render text: 'save institute failed'
        #render("new")
      end
    #else
    #  render text: 'update user_id failed'
    #end
    
  end




  def edit
    
    @institute_query = InstituteQuery.find(params[:id])
    
  end


  def update
    
    # institute_query = InstituteQuery.new(institute_query_params)
    # institute_query.institute_id = session[:institute_id]

    institute_query = InstituteQuery.find(params[:id])
    institute_query_temp = InstituteQuery.new(institute_query_params)
    type_content_index = institute_query_temp.type_content_index
    subject_category_index = institute_query_temp.subject_category_index
    institute_query_temp = nil
    
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
    h_update = params[:institute_query]
    h_update['type_content'] = s_type_content
    h_update['subject_category'] = s_subject_category

    if institute_query.update_attributes(h_update)
        redirect_to '/InstituteQuery/' + params[:id].to_s
    else
      render text: 'update failed'
    end    
    
  end





  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy

    institute_query = InstituteQuery.find(params[:id])
    
    # render text: institute_query.institute_id.to_s
    
    institute_query_descriptions = InstituteQueryResult.where("institute_query_id = ?", institute_query.id)
    
    # store = Store.find(params[:id])
    if institute_query.delete

      if institute_query_descriptions[0].delete
        # @@delete = true
        redirect_to '/InstituteQueries'
      else 
        render text: 'Institute Query Result Delete failed'
      end
      
    else
      render text: 'Institute Query Delete failed'
    end
     
  end


  # def dbdelete
      # Store.dbdelete
      # redirect_to action: "index"
      # # render text: 'dbdelete'
  # end
  
  # def dbclear
      # Store.dbclear
      # redirect_to action: "index"
      # # render text: 'dbclear'
  # end
  
  # def export
     
    # @stores = @@stores
   
    # respond_to do |format|
      # format.html
      # format.csv
       # #format.js
    # end
     
  # end


  private

    def institute_query_params
      params.require(:institute_query).permit(      
                                              :institute_id, 
                                              :name_query,
                                              :type_content_index,
                                              :subject_category_index,                                    
                                              :type_content,
                                              :subject_category,
                                              :word_description
                                              )
                                        
    end

    def sort_column
      InstituteQuery.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  



end
