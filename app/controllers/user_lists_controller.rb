class UserListsController < ApplicationController

	before_action :signed_in_user

	def index
		
	end

	def search_people
		# Get search_query from ajax
	    search_query = params[:search_query]

	    @search_results = nil

	    # Search in database
	    if search_query.present?
	    	@search_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%").paginate(page: params[:page], per_page: 15)
	    end	
	    
	end

end
