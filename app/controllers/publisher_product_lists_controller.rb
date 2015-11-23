class PublisherProductListsController < ApplicationController

	before_action :signed_in_user

	def index
		
	end

	def search_publisher_product

		# Get search_query from ajax
	    search_query = params[:search_query]

	    Rails.logger.info search_query

	    @search_results = nil

	    # Search in database
	    if search_query.present?
	    	Rails.logger.info "search_query.present"
	    	# @search_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%").paginate(page: params[:page], per_page: 15)
	    	temp_results = PublisherProduct.joins(:publisher_product_manifest).where("publisher_product_manifests.product_name ilike :sq", sq: "%#{search_query}%")

	    	Rails.logger.info temp_results

	    	@search_results = temp_results.paginate(page: params[:page], per_page: 15)

	    	Rails.logger.info @search_results.present?
	    end
		
	end

end
