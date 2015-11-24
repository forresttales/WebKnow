class PublisherProductListsController < ApplicationController

	before_action :signed_in_user

	def index
		
	end

	def search_publisher_product

		@search_results = nil
		search_query = ""

		# Get search_query from ajax
		if params[:search_query].present?
			search_query = params[:search_query]
		end

    	# @search_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%").paginate(page: params[:page], per_page: 15)
    	temp_results = PublisherProduct.joins(:publisher_product_manifest).where("publisher_product_manifests.product_name ilike :sq", sq: "%#{search_query}%")

    	if params[:search_subjects].present?
    		Rails.logger.info params[:search_subjects].to_yaml
    		search_subjects_query = ""
    		params[:search_subjects].each do |subject_id|
    			if search_subjects_query.present?
    				search_subjects_query += " and "
    			end
    			search_subjects_query += "publisher_product_category_subjects.category_subject_" + subject_id + " = true"
    		end

    		subject_and_results = temp_results.joins(:publisher_product_category_subject).where(search_subjects_query)

    		search_or_subjects_query = ""
    		params[:search_subjects].each do |subject_id|
    			if search_or_subjects_query.present?
    				search_or_subjects_query += " or "
    			end
    			search_or_subjects_query += "publisher_product_category_subjects.category_subject_" + subject_id + " = true"
    		end

    		subject_or_results = temp_results.joins(:publisher_product_category_subject).where(search_or_subjects_query).where.not(search_subjects_query)

    		temp_results = subject_and_results.merge(subject_or_results)
    	end

    	@search_results = temp_results.paginate(page: params[:page], per_page: 5)

	end

end
