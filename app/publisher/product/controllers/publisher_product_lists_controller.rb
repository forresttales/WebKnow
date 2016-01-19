class PublisherProductListsController < ApplicationController

  prepend_view_path 'app/views/publisher/product'

  before_action :signed_in_user


  def index
    
      @from_ages = return_all_dtab8lets
      @to_ages = return_all_dtab8lets
      
  end



  def search_publisher_product

      @publisher_products = nil


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

      # if params[:search_age_to].present?
        # # today_date = Date.today
        # # max_bd_date = today_date.ago( (params["search_age_to"].to_i + 1).years )
        # # max_bd_year = max_bd_date.year
        # # max_bd_month = max_bd_date.month
        # # max_bd_day = max_bd_date.day
        # # temp_results = temp_results.where("bd_year >= ?", max_bd_year)
        # # temp_results = temp_results.where.not("bd_year = ? and bd_month < ?", max_bd_year, max_bd_month)
        # # temp_results = temp_results.where.not("bd_year = ? and bd_month = ? and bd_day < ?", max_bd_year, max_bd_month, max_bd_day)
      # end

      # search_or_platforms_query = ""
      # # subject_or_results = temp_results.joins(:publisher_product_category_subject).where(search_or_subjects_query)
      # # SELECT  "publisher_products".* FROM "publisher_products"  WHERE (publisher_product_category_subjects.category_subject_2 = true)
      # # search_or_subjects_query = "publisher_product_category_subjects.category_subject_1 = true"
      # # SELECT "publisher_products".* FROM "publisher_products" INNER JOIN "publisher_product_category_subjects" ON "publisher_product_category_subjects"."publisher_product_id" = "publisher_products"."id" WHERE (publisher_product_category_subjects.category_subject_1 = true)
      # # subject_or_results = PublisherProduct.joins(:publisher_product_category_subject).where(search_or_subjects_query)
      # subject_or_results = PublisherProduct.joins(:publisher_product_category_subject).where(search_or_subjects_query).joins(:publisher_product_platform).where(search_or_platforms_query)
      # # # Genarating SUM string to sort result by relevance
      # # order_by_sum = ""
      # # params[:search_subjects].each do |subject_id|
          # # order_by_sum += " + " if order_by_sum.present?
          # # order_by_sum += "publisher_product_category_subjects.category_subject_" + subject_id + "::int"
      # # end
      # # temp_results = subject_or_results.group("publisher_products.id").order("sum( #{order_by_sum} ) desc")
      # temp_results = subject_or_results


      @publisher_products = temp_results.paginate(page: params[:page], per_page: 5)

  end


  private

  
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

