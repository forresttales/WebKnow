class PublisherProductsController < ApplicationController
  
  layout 'publisher_product'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction

  before_filter :force_http

  skip_before_filter :verify_authenticity_token
    
  
  def index

    # ar = Array.new
    # c = ActiveRecord::Base.connection
    # c.tables.collect do |t|  
      # columns = c.columns(t).collect(&:name).select {|x| x.ends_with?("_id" || x.ends_with("_type"))}
      # indexed_columns = c.indexes(t).collect(&:columns).flatten.uniq
      # unindexed = columns - indexed_columns
      # unless unindexed.empty?
        # ar.push("#{t}: #{unindexed.join(", ")}")
      # end
    # end
    # render text: ar

    @publisher_id = current_user.publisher.id
    # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).order(sort_column + " " + sort_direction) # .paginate(:per_page => 200, :page => params[:page])
    
    # @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
    @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
  
  
  # def list
    # @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    # respond_to do |format|
      # format.html
      # format.js
    # end
  # end
  # def show
    # @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    # respond_to do |format|
      # format.html
      # format.js
    # end
  # end
  
  
  
  def new
      # @publisher_product = PublisherProduct.new
  end

  
  def create

    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    publisher = current_user.publisher
    h_new = Hash.new
    h_new[:publisher_id] = publisher.id
    
    publisher_product = PublisherProduct.new(h_new)
    
    #if user.update_columns( :has_account => true, :account_type => "publisher")
          
    if publisher_product.save
        h_new[:publisher_product_id] = publisher_product.id
        publisher_product_description = PublisherProductDescription.new(h_new)
        if publisher_product_description.save
            h_new[:publisher_product_description_id] = publisher_product_description.id
            
            publisher_product_content_type = PublisherProductContentType.new(h_new)
            if publisher_product_content_type.save

              publisher_product_category_subject = PublisherProductCategorySubject.new(h_new)
              if publisher_product_category_subject.save
  
                publisher_product_appropriate_age = PublisherProductAppropriateAge.new(h_new)
                if publisher_product_appropriate_age.save
  
                  publisher_product_appropriate_grade = PublisherProductAppropriateGrade.new(h_new)
                  if publisher_product_appropriate_grade.save
  
                    publisher_product_market_target = PublisherProductMarketTarget.new(h_new)
                    if publisher_product_market_target.save
  
                      publisher_product_platform = PublisherProductPlatform.new(h_new)
                      if publisher_product_platform.save
  
                        publisher_product_file_type = PublisherProductFileType.new(h_new)
                        if publisher_product_file_type.save
  
                          publisher_product_character = PublisherProductCharacter.new(h_new)
                          if publisher_product_character.save
  
                            publisher_product_enhancement = PublisherProductEnhancement.new(h_new)
                            if publisher_product_enhancement.save
  
                              publisher_product_pricing_model = PublisherProductPricingModel.new(h_new)
                              if publisher_product_pricing_model.save
  
                                publisher_product_price = PublisherProductPrice.new(h_new)
                                if publisher_product_price.save

                                  publisher_product_lesson_time = PublisherProductLessonTime.new(h_new)
                                  if publisher_product_lesson_time.save
        
                                              @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
                                              respond_to do |format|
                                                format.html
                                                # format.js { redirect_to(:action => 'index', :form => :js ) }
                                                format.js
                                              end
                                              # redirect_to(:controller => 'publisher_product_descriptions', 
                                                          # :action => 'show_description', 
                                                          # :method => :post,
                                                          # :params => { :publisher_product_id => publisher_product.id })
                                                          
                                                          # :params => {:publisher_id => publisher.id, 
                                                                      # :publisher_product_id => publisher_product.id,
                                                                      # :publisher_product_description_id => publisher_product_description.id
                                                                     # })
                                                                     
                                  else
                                    render text: 'save publisher_product_lesson_time failed'
                                  end                                       
                                else
                                  render text: 'save publisher_product_price failed'
                                end                                       
                              else
                                render text: 'save publisher_product_pricing_model failed'
                              end                                       
                            else
                              render text: 'save publisher_product_enhancement failed'
                            end                                       
                          else
                            render text: 'save publisher_product_character failed'
                          end                                       
                        else
                          render text: 'save publisher_product_file_type failed'
                        end      
                      else
                        render text: 'save publisher_product_platform failed'
                      end      
                    else
                      render text: 'save publisher_product_market_target failed'
                    end
                  else
                    render text: 'save publisher_product_appropriate_grade failed'
                  end
                else
                  render text: 'save publisher_product_appropriate_age failed'
                end
              else
                render text: 'save publisher_product_category_subject failed'
              end
            else
              render text: 'save publisher_product_content_type failed'
            end
            
        else
          render text: 'save publisher_product_description failed'
        end
    else
      render text: 'save publisher_product failed'
      #render("new")
    end


    # if (publisher_product = current_user.publisher.publisher_products.create)
        # Rails.logger.info 'create publisher_product succeeded'
        # result = "result"        
        # if publisher_product.nil?
          # result = 'publisher_product nil'
        # else
          # result = 'publisher_product not nil'
        # end
        # Rails.logger.info result
        # publisher_product_description = PublisherProductDescription.new
        # publisher_product_description.publisher_product = publisher_product
        # publisher_product_description.save
        # if !publisher_product_description.nil?
          # result = 'publisher_product_description.publisher_product_id = ' + publisher_product_description.publisher_product_id.to_s
        # else
          # result = 'publisher_product_description nil'
        # end
        # Rails.logger.info result
        # # if (publisher_product_description = publisher_product.publisher_product_description.create!)
            # # # if (publisher_product_appropriate_age = publisher_product.publisher_product_appropriate_age.create!)
                # # # if (publisher_product_market_target = publisher_product.publisher_product_market_target.create!)
                    # # # @publisher_products = publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
                    # # # respond_to do |format|
                        # # # format.html
                        # # # # format.js { redirect_to(:action => 'index', :form => :js ) }
                        # # # format.js
                    # # # end
                # # # else
                  # # # render text: 'create publisher_product_market_target failed'
                # # # end
            # # # else
              # # # render text: 'create publisher_product_appropriate_age failed'
            # # # end
        # # else
          # # Rails.logger.info 'create publisher_product_description failed'
        # # end
    # else
      # Rails.logger.info 'create publisher_product failed'
    # end
      
    
  end


  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy

    publisher_product = PublisherProduct.find(params[:id])
    
    # render text: publisher_product.publisher_id.to_s
    
    publisher_product_descriptions = PublisherProductDescription.where("publisher_product_id = ?", publisher_product.id)
    
    # store = Store.find(params[:id])
    if publisher_product.delete

      if publisher_product_descriptions[0].delete
        # @@delete = true
        redirect_to '/PublisherProducts'
      else 
        render text: 'Publisher Product Description Delete failed'
      end
      
    else
      render text: 'Publisher Product Delete failed'
    end
     
  end



  def dbdelete

      PublisherProduct.dbdelete
      PublisherProduct.dbclear

      PublisherProductDescription.dbdelete
      PublisherProductDescription.dbclear

      PublisherProductImage.dbdelete
      PublisherProductImage.dbclear

      PublisherProductLogo.dbdelete
      PublisherProductLogo.dbclear

      PublisherProductContentType.dbdelete
      PublisherProductContentType.dbclear

      PublisherProductCategorySubject.dbdelete
      PublisherProductCategorySubject.dbclear

      PublisherProductAppropriateAge.dbdelete
      PublisherProductAppropriateAge.dbclear

      PublisherProductAppropriateGrade.dbdelete
      PublisherProductAppropriateGrade.dbclear

      PublisherProductMarketTarget.dbdelete
      PublisherProductMarketTarget.dbclear

      PublisherProductPlatform.dbdelete
      PublisherProductPlatform.dbclear

      PublisherProductFileType.dbdelete
      PublisherProductFileType.dbclear

      PublisherProductCharacter.dbdelete
      PublisherProductCharacter.dbclear

      PublisherProductEnhancement.dbdelete
      PublisherProductEnhancement.dbclear

      PublisherProductPricingModel.dbdelete
      PublisherProductPricingModel.dbclear

      PublisherProductPrice.dbdelete
      PublisherProductPrice.dbclear

      PublisherProductLessonTime.dbdelete
      PublisherProductLessonTime.dbclear

      PublisherProductCoreLiteracyStandard.dbdelete
      PublisherProductCoreLiteracyStandard.dbclear

      PublisherProductCoreMathStandard.dbdelete
      PublisherProductCoreMathStandard.dbclear
      
      redirect_to '/Publisher-Products'
            
      # respond_to do |format|
        # # format.html
        # # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.js { redirect_to('/Publishers') }
      # end

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

    def publisher_product_params
      params.require(:publisher_product).permit(      
                                                :publisher_id, 
                                                :name_product,
                                                :product_logo,
                                                :has_product_logo,
                                                :product_metadata,
                                                :has_product_metadata                                                
                                              )
                                        
    end

    def sort_column
      PublisherProduct.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
  
  
  
end
