class UserListsController < ApplicationController

	before_action :signed_in_user

	def index
		@bd_years = BdYear.all
	end

	def search_people
		# Get search_query from ajax
	    search_query = params[:search_query]

	    @search_results = nil

	    # Search in database
	    if search_query.present?
	    	# @search_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%").paginate(page: params[:page], per_page: 15)
	    	temp_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%")

	    	if params[:search_gender].present?
	    		temp_results = temp_results.where(:gender => params[:search_gender].to_i)
	    	end

	    	if params[:search_bd_year].present?
	    		temp_results = temp_results.where(:bd_year => params[:search_bd_year].to_i)
	    	end

	    	if params[:search_bd_month].present?
	    		temp_results = temp_results.where(:bd_month => params[:search_bd_month].to_i)
	    	end

	    	if params[:search_bd_day].present?
	    		temp_results = temp_results.where(:bd_day => params[:search_bd_day].to_i)
	    	end

	    	@search_results = temp_results.paginate(page: params[:page], per_page: 15)
	    end

	end

end
