class PublisherProductListsController < ApplicationController

	before_action :signed_in_user

	def index
		
	end

	def search_publisher_product

		@publisher_products = nil
		temp_results = PublisherProduct.all
		search_query = ""

		# Get search_query from ajax
		if params[:search_query].present?
			search_query = params[:search_query]
			temp_results = temp_results.joins(:publisher_product_manifest).where("publisher_product_manifests.product_name ilike :sq", sq: "%#{search_query}%")
		end

		if params[:search_subjects].present?
			search_or_subjects_query = ""
			params[:search_subjects].each do |subject_id|
				search_or_subjects_query += " or " if search_or_subjects_query.present?
				search_or_subjects_query += "publisher_product_category_subjects.category_subject_" + subject_id + " = true"
			end
			subject_or_results = temp_results.joins(:publisher_product_category_subject).where(search_or_subjects_query)
	
			# Genarating SUM string to sort result by relevance
			order_by_sum = ""
			params[:search_subjects].each do |subject_id|
				order_by_sum += " + " if order_by_sum.present?
				order_by_sum += "publisher_product_category_subjects.category_subject_" + subject_id + "::int"
			end
			temp_results = subject_or_results.group("publisher_products.id").order("sum( #{order_by_sum} ) desc")
		end

		if params[:search_platforms].present?
			search_or_platforms_query = ""
			params[:search_platforms].each do |platform_id|
				search_or_platforms_query += " or " if search_or_platforms_query.present?
				search_or_platforms_query += "publisher_product_platforms.platform_" + platform_id + " = true"
			end
			temp_results = temp_results.joins(:publisher_product_platform).where(search_or_platforms_query)
		end

		if params[:search_content_types].present?
			search_or_content_types_query = ""
			params[:search_content_types].each do |content_type_id|
				search_or_content_types_query += " or " if search_or_content_types_query.present?
				search_or_content_types_query += "publisher_product_content_types.content_type_" + content_type_id + " = true"
			end
			temp_results = temp_results.joins(:publisher_product_content_type).where(search_or_content_types_query)
		end

		if params[:search_file_types].present?
			search_or_file_types_query = ""
			params[:search_file_types].each do |file_type_id|
				search_or_file_types_query += " or " if search_or_file_types_query.present?
				search_or_file_types_query += "publisher_product_file_types.file_type_" + file_type_id + " = true"
			end
			temp_results = temp_results.joins(:publisher_product_file_type).where(search_or_file_types_query)
		end

		if params[:search_enhancements].present?
			search_or_enhancements_query = ""
			params[:search_enhancements].each do |enhancement_id|
				search_or_enhancements_query += " or " if search_or_enhancements_query.present?
				search_or_enhancements_query += "publisher_product_enhancements.enhancement_" + enhancement_id + " = true"
			end
			temp_results = temp_results.joins(:publisher_product_enhancement).where(search_or_enhancements_query)
		end

		if params[:search_core_literacy_standards].present?
			search_or_cls_query = ""
			params[:search_core_literacy_standards].each do |cls_id|
				search_or_cls_query += " or " if search_or_cls_query.present?
				search_or_cls_query += "publisher_product_core_literacy_standards.id_standard" + " = " + cls_id
			end
			temp_results = temp_results.joins(:publisher_product_core_literacy_standards).where(search_or_cls_query).group("publisher_products.id")
		end

		if params[:search_from_age].present?
			temp_results = temp_results.joins(:publisher_product_age_range).where("publisher_product_age_ranges.age_from >= :sfa", sfa: "#{params[:search_from_age].to_i}")
		end

		if params[:search_to_age].present?
			temp_results = temp_results.joins(:publisher_product_age_range).where("publisher_product_age_ranges.age_to <= :sta", sta: "#{params[:search_to_age].to_i}")
		end

		if params[:search_from_grade].present?
			temp_results = temp_results.joins(:publisher_product_grade_range).where("publisher_product_grade_ranges.grade_from >= :sfg", sfg: "#{params[:search_from_grade].to_i}")
		end

		if params[:search_to_grade].present?
			temp_results = temp_results.joins(:publisher_product_grade_range).where("publisher_product_grade_ranges.grade_to <= :stg", stg: "#{params[:search_to_grade].to_i}")
		end

    	@publisher_products = temp_results.paginate(page: params[:page], per_page: 5)

	end

end