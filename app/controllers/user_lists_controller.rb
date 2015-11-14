class UserListsController < ApplicationController

	def index
		
	end

	def search_people
		# Get search_query from ajax
	    search_query = params[:search_query]

	    @search_results = nil

	    # Search in database
	    if search_query.present?
	    	@search_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%")
	    end	
	    
	end

end
