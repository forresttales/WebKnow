class UserListsController < ApplicationController


  layout 'user_list'
  
  before_action :signed_in_user


  def index
  end



  def search_people
    # Get search_query from ajax
      search_query = params[:search_query]

      @search_results = nil

      # Search in database
      if search_query.present?
        # @search_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%").paginate(page: params[:page], per_page: 15)
        temp_results = User.where("name_first ilike :sq or name_last ilike :sq or name_first || ' ' || name_last ilike :sq", sq: "%#{search_query}%")

        temp_results = temp_results.where(:gender => params[:search_gender].to_i) if params[:search_gender].present?

        temp_results = temp_results.where(:bd_year => params[:search_bd_year].to_i) if params[:search_bd_year].present?

        temp_results = temp_results.where(:bd_month => params[:search_bd_month].to_i) if params[:search_bd_month].present?

      temp_results = temp_results.where(:bd_day => params[:search_bd_day].to_i) if params[:search_bd_day].present?
      
      temp_results = temp_results.where(:profile_type => params[:search_profile_type].to_i) if params[:search_profile_type].present?

      if params[:search_age_from].present?
        today_date = Date.today
        min_bd_date = today_date.ago( params["search_age_from"].to_i.years )

        min_bd_year = min_bd_date.year
        min_bd_month = min_bd_date.month
        min_bd_day = min_bd_date.day

        temp_results = temp_results.where("bd_year <= ?", min_bd_year)
        temp_results = temp_results.where.not("bd_year = ? and bd_month > ?", min_bd_year, min_bd_month)
        temp_results = temp_results.where.not("bd_year = ? and bd_month = ? and bd_day > ?", min_bd_year, min_bd_month, min_bd_day)
      end

      if params[:search_age_to].present?
        today_date = Date.today
        max_bd_date = today_date.ago( (params["search_age_to"].to_i + 1).years )

        max_bd_year = max_bd_date.year
        max_bd_month = max_bd_date.month
        max_bd_day = max_bd_date.day

        temp_results = temp_results.where("bd_year >= ?", max_bd_year)
        temp_results = temp_results.where.not("bd_year = ? and bd_month < ?", max_bd_year, max_bd_month)
        temp_results = temp_results.where.not("bd_year = ? and bd_month = ? and bd_day < ?", max_bd_year, max_bd_month, max_bd_day)
      end

        @search_results = temp_results.paginate(page: params[:page], per_page: 15)
      end

  end

  def add_friend

    if params[:friend_id].present?
      @new_friend = User.find_by_id(params[:friend_id].to_i)
      PublisherUserFriendship.request(current_user, @new_friend)
    end

  end

  def remove_friend

    if params[:friend_id].present?
      @old_friend = User.find_by_id(params[:friend_id].to_i)
      PublisherUserFriendship.remove(current_user, @old_friend)
    end

  end

end
