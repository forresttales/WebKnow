class InstituteQueryResultsController < ApplicationController

  layout 'institute'
  
  require 'csv'
  
  helper_method :sort_column, :sort_direction
  
  # before_filter :force_http
  
  
  @@institute_query_id = nil
  
  def index

    @@institute_query_id = params[:id]

    @institute_query_results = InstituteQueryResult.where("institute_query_id = ?", @@institute_query_id).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
     
    # if !@institute_query_results.any?
      # @result = @institute_query_results[0].result
      # # @result = 'not any'
    # else
      # @result = 'was nil'
    # end
     
    institute_query = InstituteQuery.find(@@institute_query_id)
    @institute_query_name = institute_query.name_query
    @institute_query_has_query = institute_query.has_result
    @institute_query_id = @@institute_query_id
    
    
    # type_content = institute_query.type_content
    # result_type_contents = PublisherProductDescription.where("type_content LIKE ?", type_content)  
    # # render text: result_type_contents.count.to_s
    # render text: result_type_contents[0].id.to_s
    
    
    
    
    
    
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
    
    @institute_query_result = InstituteQueryResult.find(params[:id])
    
    @publisher_product_description = PublisherProductDescription.find(@institute_query_result.publisher_product_description_id)

    @publisher_product = PublisherProduct.find(@publisher_product_description.publisher_product_id)

    gon.image_name = @publisher_product.product_logo 
    
    # @institute_query_desciptions = InstituteQueryResult.find(params[:id])
    # @institute_query_results = InstituteQueryResult.where("id = ?", params[:id])
    
  end
  
  
  def new
    
    if !(session[:username].nil? or session[:institute_id].nil?)
      # @username = session[:username]
      @institute_query_result = InstituteQueryResult.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create

    institute_query = InstituteQuery.find(@@institute_query_id)
    
    # type_content
    # subject_category
    # word_description
    
    type_content = institute_query.type_content
    
    result_type_contents = PublisherProductDescription.where("type_content LIKE ?", type_content)  
     
    # render text: result_type_contents.count.to_s
    # render text: result_type_contents[0].id.to_s

    # institute_query_result = InstituteQueryResult.new(institute_query_result_params)
    # institute_query = InstituteQuery.find( @@institute_query_id )
    # institute_query_result.institute_query_id = @@institute_query_id    
    # institute_query_result.institute_id = session[:institute_id]
# 

    save_success = true

    if institute_query.update_columns( :has_result => true)    
      for i in 0..(result_type_contents.count - 1)  

          institute_query_result = InstituteQueryResult.new
          institute_query_result.institute_query_id = @@institute_query_id
          institute_query_result.publisher_product_description_id = result_type_contents[i].id 
          institute_query_result.description = result_type_contents[i].description
          institute_query_result.price = result_type_contents[i].price
    
          if !institute_query_result.save
            save_success = false
          end

          institute_query_result = nil
          
          if !save_success
            break
          end
          
      end

      if save_success
        redirect_to '/InstituteQueryResults/' + @@institute_query_id.to_s
        # redirect_to(:action => 'index', :params => {:id => @@institute_query_id})
      else
        render text: 'Save Institute Query Result failed'
      end
      
    else
      render text: 'Update institute_query has_result failed'
    end
    
  end


  def edit
    @institute_query_result = InstituteQueryResult.find_by_id(params[:id])    
  end
  
  def update
    
    @institute_query_result = InstituteQueryResult.find(params[:id])
    
    if @institute_query_result.update_attributes(params[:institute_query_result])
      # redirect_to(:action => 'show', :saved_id => @archive.id)
      
        # redirect_to(:action => 'show', :saved_id => @admin_reg_event.id)
        redirect_to '/InstituteQueryResult?id=' + @@institute_query_id.to_s
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end
  
  
  
  
  private

    def institute_query_result_params
      params.require(:institute_query_result).permit(      
                                                      :institute_id,
                                                      :institute_query_id, 
                                                      :name_result,
                                                      :publisher_product_description_id,
                                                      :price
                                                    )

    end
    
    
    def sort_column
      InstituteQueryResult.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    


end
