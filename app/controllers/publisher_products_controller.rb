class PublisherProductsController < ApplicationController
  
  layout 'publisher_product'

  respond_to :html, :js, :json  

  helper_method :sort_column, :sort_direction

  # before_filter :force_http

  skip_before_filter :verify_authenticity_token

    
  
  before_action :signed_in_user
  before_action :fill_left_directory

  def fill_left_directory

    slug = current_user.slug
    @url_user_story  = '/' + current_user.slug
    @url_profile_story = '/' + current_user.publisher.slug
        
  end
  
  
  # def index_demo    
  # end
  
  
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
  
      gon.publisher_product_id = 0
      
      publisher_user = current_user.publisher_user
      @publisher_id = publisher_user.publisher.id
      publisher = Publisher.find_by_id(@publisher_id)
  
      publisher = publisher_user.publisher
      
      # @publisher_products = PublisherProduct.where("publisher_id = ?", @publisher_id).order(sort_column + " " + sort_direction) # .paginate(:per_page => 200, :page => params[:page])
      
      @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction)
      
      @from_ages = return_all_dtab8lets
      @to_ages = return_all_dtab8lets
    
    
  end
  
  
  
  def search_publisher_product

      @search_results = nil


      temp_results = PublisherProduct.all

      search_query = ""
      # Get search_query from ajax
      if params[:search_query].present?
          search_query = params[:search_query] 
          temp_results = PublisherProduct.joins(:publisher_product_manifest).where("publisher_product_manifests.product_name ilike :sq", sq: "%#{search_query}%")
      end

      if params[:search_subjects].present?
          search_or_subjects_query = ""
          params[:search_subjects].each do |subject_id|
              Rails.logger.info('subject_id = ' + subject_id.to_s)
              search_or_subjects_query += " or " if search_or_subjects_query.present?
              search_or_subjects_query += "publisher_product_category_subjects.category_subject_" + subject_id + " = true"
          end
          temp_results = temp_results.joins(:publisher_product_category_subject).where(search_or_subjects_query)
          # temp_results = PublisherProduct.all.joins(:publisher_product_category_subject).where(search_or_subjects_query)
      end

      if params[:search_platforms].present?
          search_or_platforms_query = ""
          params[:search_platforms].each do |platform_id|
              Rails.logger.info('platform_id = ' + platform_id.to_s)
              search_or_platforms_query += " or " if search_or_platforms_query.present?
              search_or_platforms_query += "publisher_product_platforms.platform_" + platform_id + " = true"
          end
          temp_results = temp_results.joins(:publisher_product_platform).where(search_or_platforms_query)
          # temp_results = PublisherProduct.all.joins(:publisher_product_platform).where(search_or_platforms_query)
      end

      if params[:search_from_age].present?
          search_or_from_age_query = "" 
          # Rails.logger.info('params[:search_from_age] = ' + params[:search_from_age].to_s)
          from_age_id = params[:search_from_age]
          search_or_from_age_query += " or " if search_or_from_age_query.present?
          search_or_from_age_query += "publisher_product_from_ages.age_" + from_age_id + " = true"
          # Rails.logger.info('search_or_from_age_query = ' + search_or_from_age_query)
          temp_results = temp_results.joins(:publisher_product_from_age).where(search_or_from_age_query)
      end

      if params[:search_to_age].present?
          search_or_to_age_query = "" 
          to_age_id = params[:search_to_age]
          search_or_to_age_query += " or " if search_or_to_age_query.present?
          search_or_to_age_query += "publisher_product_to_ages.age_" + to_age_id + " = true"
          temp_results = temp_results.joins(:publisher_product_to_age).where(search_or_to_age_query)
      end

      @search_results = temp_results.paginate(page: params[:page], per_page: 5)


  end
  
  
  
  def destroy_publisher_product

      begin
                
          ar = params[:publisher_product]
          h_obj = Hash.new
          ar.each do |obj|
            h_obj = obj
          end
    
          publisher_product_id = h_obj[:publisher_product_id]
                
          # publisher_product_id = params[:publisher_product_id]
          # Rails.logger.info("publisher_product_id = " + publisher_product_id.to_s)
                              
          if !publisher_product_id.nil?
              publisher = current_user.publisher rescue nil
              if !publisher.nil?
                  publisher_products = publisher.publisher_products
                  if !publisher_products.nil?
                      publisher_product = publisher_products.where("id = ?", publisher_product_id).first rescue nil
                      if !publisher_product.nil?
                          if publisher_product.destroy
                              respond_to do |format|
                                  format.html {}
                                  format.json { render :json => { :b_error => false } }
                              end
                          else
                              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product', :action => 'destroy_publisher_product', :description => 'publisher_product destroy failed')
                              raise
                          end
                      else
                          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product', :action => 'destroy_publisher_product', :description => 'publisher_product was nil')
                          raise
                      end
                  else
                      LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product', :action => 'destroy_publisher_product', :description => 'publisher_products was nil')
                      raise
                  end
              else
                  LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product', :action => 'destroy_publisher_product', :description => 'publisher was nil')
                  raise
              end
          else
              LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product', :action => 'destroy_publisher_product', :description => 'publisher_product_id passed was nil')
              raise
          end
      
      rescue StandardError => e

          LogError.create(:user_id => current_user.id, :profile_index => 3, :profile_description => 'publisher', :controller => 'publisher_product', :action => 'destroy_publisher_product', :description => e.message.to_s)
          respond_to do |format|
              format.html {}
              format.json { render :json => { :b_error => true } }
          end

      end

      
  end
  
  
  
  def new
      # @publisher_product = PublisherProduct.new
  end


  def get_random

      r = rand(1000000000001..9999999999999) # 9,999,999,999,999  13
      
      b_r = true
      while b_r do
        b_r = IssuedPublisherProductId.exists?(:publisher_product_gen_id => r)
        if b_r
          r += 1  
        end      
      end
      
      return r
  end

  
  def create

    # publisher_product_content_type
    # publisher_product_category_subject
    # publisher_product_appropriate_age
    # publisher_product_from_age
    # publisher_product_to_age
    # publisher_product_appropriate_grade
    # publisher_product_from_grade
    # publisher_product_to_grade
    # publisher_product_market_target
    # publisher_product_platform
    # publisher_product_file_type
    # publisher_product_character
    # publisher_product_enhancement
    # publisher_product_pricing_model
    # publisher_product_price
    # publisher_product_lesson_time
    # publisher_product_by_review

    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    publisher = current_user.publisher
    h_new = Hash.new
    h_new[:publisher_id] = publisher.id
    
    publisher_product = PublisherProduct.new(h_new)
    
    if publisher_product.save
        publisher_product_gen_id = get_random
        h_issued_publisher_product_id = Hash.new
        h_issued_publisher_product_id[:publisher_product_gen_id] = publisher_product_gen_id 
        h_issued_publisher_product_id[:publisher_product_id] = publisher_product.id
        h_issued_publisher_product_id[:publisher_id] = publisher.id
        issued_publisher_product_id = IssuedPublisherProductId.new(h_issued_publisher_product_id) rescue nil
        if !issued_publisher_product_id.nil?
            if issued_publisher_product_id.save
                if publisher_product.update_attributes(:slug => issued_publisher_product_id.publisher_product_gen_id.to_s)
                    h_new[:publisher_product_id] = publisher_product.id
                    publisher_product_manifest = PublisherProductManifest.new(h_new)
                    if publisher_product_manifest.save
            
                        publisher_product_description = PublisherProductDescription.new(h_new)
                        if publisher_product_description.save
                            
                            publisher_product_topic = PublisherProductTopic.new(h_new)
                            if publisher_product_topic.save
                            
                                publisher_product_subject = PublisherProductSubject.new(h_new)
                                if publisher_product_subject.save
                            
                                    publisher_product_content_type = PublisherProductContentType.new(h_new)
                                    if publisher_product_content_type.save
                        
                                        publisher_product_category_subject = PublisherProductCategorySubject.new(h_new)
                                        if publisher_product_category_subject.save
                          
                                            publisher_product_appropriate_age = PublisherProductAppropriateAge.new(h_new)
                                            if publisher_product_appropriate_age.save
                          
                                                publisher_product_from_age = PublisherProductFromAge.new(h_new)
                                                if publisher_product_from_age.save
                    
                                                    publisher_product_to_age = PublisherProductToAge.new(h_new)
                                                    if publisher_product_to_age.save
                          
                                                        publisher_product_appropriate_grade = PublisherProductAppropriateGrade.new(h_new)
                                                        if publisher_product_appropriate_grade.save
                                    
                                                            publisher_product_from_grade = PublisherProductFromGrade.new(h_new)
                                                            if publisher_product_from_grade.save
                                    
                                                                publisher_product_to_grade = PublisherProductToGrade.new(h_new)
                                                                if publisher_product_to_grade.save
                          
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
                                            
                                                                                                    publisher_product_by_review = PublisherProductByReview.new(h_new)
                                                                                                    if publisher_product_by_review.save
                                                    
                                                                                                        @publisher_products = current_user.publisher.publisher_products.order(sort_column + " " + sort_direction).paginate(page: params[:page])
                                                                                                        respond_to do |format|
                                                                                                          format.html
                                                                                                          format.js
                                                                                                        end
                    
                                                                                                    else
                                                                                                        Rails.logger.info('save publisher_product_by_review failed')
                                                                                                    end                                                                                                            
                                                                                                else
                                                                                                    Rails.logger.info('save publisher_product_lesson_time failed')
                                                                                                end                                       
                                                                                            else
                                                                                                Rails.logger.info('save publisher_product_price failed')
                                                                                            end                                       
                                                                                        else
                                                                                            Rails.logger.info('save publisher_product_pricing_model failed')
                                                                                        end                                       
                                                                                    else
                                                                                        Rails.logger.info('save publisher_product_enhancement failed')
                                                                                    end                                       
                                                                                else
                                                                                    Rails.logger.info('save publisher_product_character failed')
                                                                                end                                       
                                                                            else
                                                                                Rails.logger.info('save publisher_product_file_type failed')
                                                                            end      
                                                                        else
                                                                            Rails.logger.info('save publisher_product_platform failed')
                                                                        end      
                                                                    else
                                                                        Rails.logger.info('save publisher_product_market_target failed')
                                                                    end
                                                                else
                                                                    Rails.logger.info('save publisher_product_from_grade failed')
                                                                end
                                                            else
                                                                Rails.logger.info('save publisher_product_from_grade failed')
                                                            end
                                                        else
                                                            Rails.logger.info('save publisher_product_appropriate_grade failed')
                                                        end
                                                    else
                                                        Rails.logger.info('save publisher_product_from_age failed')
                                                    end
                                                else
                                                    Rails.logger.info('save publisher_product_from_age failed')
                                                end
                                            else
                                                Rails.logger.info('save publisher_product_appropriate_age failed')
                                            end
                                        else
                                            Rails.logger.info('save publisher_product_category_subject failed')
                                        end
                                    else
                                        Rails.logger.info('save publisher_product_content_type failed')
                                    end
                                else
                                    Rails.logger.info('save publisher_product_subject failed')
                                end
                            else
                                Rails.logger.info('save publisher_product_topic failed')
                            end
                        else
                            Rails.logger.info('save publisher_product_description failed')
                        end
                    else
                        Rails.logger.info('save publisher_product_manifest failed')
                    end
                else
                    Rails.logger.info('publisher_product update_attributes failed')
                end        
            else
                Rails.logger.info('issued_publisher_product_id save failed')
            end        
        else
            Rails.logger.info('issued_publisher_product_id was nil')
        end        
    else
        Rails.logger.info('save publisher_product failed')
    end


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

      IssuedPublisherProductId.dbdelete
      IssuedPublisherProductId.dbclear

      PublisherProduct.dbdelete
      PublisherProduct.dbclear

      PublisherProductManifest.dbdelete
      PublisherProductManifest.dbclear

      PublisherProductDescription.dbdelete
      PublisherProductDescription.dbclear

      PublisherProductTopic.dbdelete
      PublisherProductTopic.dbclear

      PublisherProductSubject.dbdelete
      PublisherProductSubject.dbclear

      # PublisherProductCurrent.dbdelete
      # PublisherProductCurrent.dbclear

      PublisherProductPos1Image.dbdelete
      PublisherProductPos1Image.dbclear
      PublisherProductPos2Image.dbdelete
      PublisherProductPos2Image.dbclear
      PublisherProductPos3Image.dbdelete
      PublisherProductPos3Image.dbclear
      PublisherProductPos4Image.dbdelete
      PublisherProductPos4Image.dbclear

      PublisherProductImage.dbdelete
      PublisherProductImage.dbclear

      PublisherProduct1Image.dbdelete
      PublisherProduct1Image.dbclear

      PublisherProduct2Image.dbdelete
      PublisherProduct2Image.dbclear

      # PublisherProductLogo.dbdelete
      # PublisherProductLogo.dbclear

      # PublisherProductLogo1Image.dbdelete
      # PublisherProductLogo1Image.dbclear

      # PublisherProductCorporateLogo.dbdelete
      # PublisherProductCorporateLogo.dbclear

      PublisherProductPdf.dbdelete
      PublisherProductPdf.dbclear

      PublisherProductPdfImage.dbdelete
      PublisherProductPdfImage.dbclear

      PublisherProductContentType.dbdelete
      PublisherProductContentType.dbclear

      PublisherProductCategorySubject.dbdelete
      PublisherProductCategorySubject.dbclear

      # PublisherProductAppropriateAge.dbdelete
      # PublisherProductAppropriateAge.dbclear

      PublisherProductFromAge.dbdelete
      PublisherProductFromAge.dbclear

      PublisherProductToAge.dbdelete
      PublisherProductToAge.dbclear

      # PublisherProductAppropriateGrade.dbdelete
      # PublisherProductAppropriateGrade.dbclear

      PublisherProductFromGrade.dbdelete
      PublisherProductFromGrade.dbclear

      PublisherProductToGrade.dbdelete
      PublisherProductToGrade.dbclear

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

      PublisherProductByReview.dbdelete
      PublisherProductByReview.dbclear

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

      PublisherAd.dbdelete
      PublisherAd.dbclear

      PublisherAdListing.dbdelete
      PublisherAdListing.dbclear

      PublisherAdSquare.dbdelete
      PublisherAdSquare.dbclear

      PublisherAdPin.dbdelete
      PublisherAdPin.dbclear
      
      redirect_to '/Publisher-Product-Listings'
            
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
    
    # def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    # end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
    def return_all_dtab8lets      
      return Dtab8let.order(sort_column_dtab8let + " " + sort_direction)
    end
    def sort_column_dtab8let
      Dtab8let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

  
end
