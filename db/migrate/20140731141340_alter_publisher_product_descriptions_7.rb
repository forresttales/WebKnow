class AlterPublisherProductDescriptions7 < ActiveRecord::Migration
  def change
    
      remove_column("publisher_product_descriptions", "type_content_index")
      remove_column("publisher_product_descriptions", "type_content")
      remove_column("publisher_product_descriptions", "type_content_other")
      remove_column("publisher_product_descriptions", "subject_category_index")
      remove_column("publisher_product_descriptions", "subject_category")
      remove_column("publisher_product_descriptions", "subject_category_other")
      remove_column("publisher_product_descriptions", "age_appropriate_index")
      remove_column("publisher_product_descriptions", "age_appropriate")
      remove_column("publisher_product_descriptions", "grade_appropriate_index")
      remove_column("publisher_product_descriptions", "grade_appropriate")
      remove_column("publisher_product_descriptions", "market_target_index")
      remove_column("publisher_product_descriptions", "market_target")
      remove_column("publisher_product_descriptions", "platform_index")
      remove_column("publisher_product_descriptions", "platform")
      remove_column("publisher_product_descriptions", "platform_other")
      remove_column("publisher_product_descriptions", "file_type_index")
      remove_column("publisher_product_descriptions", "file_type")
      remove_column("publisher_product_descriptions", "file_type_other")
      remove_column("publisher_product_descriptions", "character")
      remove_column("publisher_product_descriptions", "enhancement")
      remove_column("publisher_product_descriptions", "pricing_model_index")
      remove_column("publisher_product_descriptions", "pricing_model")
      remove_column("publisher_product_descriptions", "price_model_1")
      remove_column("publisher_product_descriptions", "price_model_1_text")
      remove_column("publisher_product_descriptions", "price_model_2")
      remove_column("publisher_product_descriptions", "price_model_2_text")
      remove_column("publisher_product_descriptions", "price_model_3")
      remove_column("publisher_product_descriptions", "price_model_3_text")
      remove_column("publisher_product_descriptions", "price_model_4")
      remove_column("publisher_product_descriptions", "price_model_4_text")
      remove_column("publisher_product_descriptions", "price_model_5")
      remove_column("publisher_product_descriptions", "price_model_5_text")
      remove_column("publisher_product_descriptions", "price_model_6")
      remove_column("publisher_product_descriptions", "price_model_6_text")
      remove_column("publisher_product_descriptions", "price_model_7")
      remove_column("publisher_product_descriptions", "price_model_7_text")
      remove_column("publisher_product_descriptions", "price_model_8")
      remove_column("publisher_product_descriptions", "price_model_8_text")
      remove_column("publisher_product_descriptions", "price_model_9")
      remove_column("publisher_product_descriptions", "price_model_9_text")
      remove_column("publisher_product_descriptions", "price_model_10")
      remove_column("publisher_product_descriptions", "price_model_10_text")
      remove_column("publisher_product_descriptions", "price_model_11")
      remove_column("publisher_product_descriptions", "price_model_11_text")
      remove_column("publisher_product_descriptions", "currently_not_available")
      remove_column("publisher_product_descriptions", "evaluation_index")
      remove_column("publisher_product_descriptions", "price")
      remove_column("publisher_product_descriptions", "research_index")
      remove_column("publisher_product_descriptions", "research")
      remove_column("publisher_product_descriptions", "public_relations_index")
      remove_column("publisher_product_descriptions", "public_relations")
      remove_column("publisher_product_descriptions", "metrics_index")
      remove_column("publisher_product_descriptions", "metrics")
      remove_column("publisher_product_descriptions", "core_supplemental_index")
      remove_column("publisher_product_descriptions", "core_supplemental")
      remove_column("publisher_product_descriptions", "metadata")
      remove_column("publisher_product_descriptions", "core_literacy_standard")
      remove_column("publisher_product_descriptions", "core_math_standard")

      add_column :publisher_product_descriptions, :allow_teacher_rating, :boolean, :default => false
      add_column :publisher_product_descriptions, :user_rating_1, :boolean, :default => false
      add_column :publisher_product_descriptions, :user_rating_2, :boolean, :default => false
      add_column :publisher_product_descriptions, :user_rating_3, :boolean, :default => false
      add_column :publisher_product_descriptions, :allow_student_likes, :boolean, :default => false
      add_column :publisher_product_descriptions, :allow_comments, :boolean, :default => false
      add_column :publisher_product_descriptions, :research_1, :boolean, :default => false
      add_column :publisher_product_descriptions, :research_2, :boolean, :default => false
      add_column :publisher_product_descriptions, :pr_updates_1, :boolean, :default => false
      add_column :publisher_product_descriptions, :pr_updates_2, :boolean, :default => false
      add_column :publisher_product_descriptions, :pr_updates_3, :boolean, :default => false
      add_column :publisher_product_descriptions, :pr_updates_4, :boolean, :default => false
      add_column :publisher_product_descriptions, :metrics_1, :boolean, :default => false
      add_column :publisher_product_descriptions, :metrics_2, :boolean, :default => false
      add_column :publisher_product_descriptions, :metrics_3, :boolean, :default => false
      add_column :publisher_product_descriptions, :metrics_4, :boolean, :default => false
      add_column :publisher_product_descriptions, :metrics_5, :boolean, :default => false
    
  end
end




