class AlterPublisherProductDescriptions5 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_descriptions, :product_tagline, :string    
      add_column :publisher_product_descriptions, :type_content_other, :string    
      add_column :publisher_product_descriptions, :subject_category_other, :string
      remove_column("publisher_product_descriptions", "topic")
      add_column :publisher_product_descriptions, :topic, :text    
      remove_column("publisher_product_descriptions", "lesson_plan_subject")
      add_column :publisher_product_descriptions, :lesson_plan_subject, :text
      remove_column("publisher_product_descriptions", "grade_index")
      remove_column("publisher_product_descriptions", "grade")
      add_column :publisher_product_descriptions, :grade_appropriate_index, :integer    
      add_column :publisher_product_descriptions, :grade_appropriate, :string    
      add_column :publisher_product_descriptions, :market_target_index, :integer    
      add_column :publisher_product_descriptions, :market_target, :string    
      add_column :publisher_product_descriptions, :platform_other, :string
      add_column :publisher_product_descriptions, :file_type_index, :integer    
      add_column :publisher_product_descriptions, :file_type, :string    
      add_column :publisher_product_descriptions, :file_type_other, :string
      add_column :publisher_product_descriptions, :updating_refresh_rate_index, :integer    
      add_column :publisher_product_descriptions, :updating_refresh_rate, :string    
      add_column :publisher_product_descriptions, :updating_type_index, :integer    
      add_column :publisher_product_descriptions, :updating_type, :string    
      add_column :publisher_product_descriptions, :character_index, :integer    
      add_column :publisher_product_descriptions, :character, :string    
      add_column :publisher_product_descriptions, :enhancements_index, :integer    
      add_column :publisher_product_descriptions, :enhancements, :string    
      add_column :publisher_product_descriptions, :price_model_1, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_1_text, :string    
      add_column :publisher_product_descriptions, :price_model_2, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_2_text, :string    
      add_column :publisher_product_descriptions, :price_model_3, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_3_text, :string    
      add_column :publisher_product_descriptions, :price_model_4, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_4_text, :string    
      add_column :publisher_product_descriptions, :price_model_5, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_5_text, :string    
      add_column :publisher_product_descriptions, :price_model_6, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_6_text, :string    
      add_column :publisher_product_descriptions, :price_model_7, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_7_text, :string    
      add_column :publisher_product_descriptions, :price_model_8, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_8_text, :string    
      add_column :publisher_product_descriptions, :price_model_9, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_9_text, :string    
      add_column :publisher_product_descriptions, :price_model_10, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_10_text, :string    
      add_column :publisher_product_descriptions, :price_model_11, :boolean, :default => false    
      add_column :publisher_product_descriptions, :price_model_11_text, :string    
      add_column :publisher_product_descriptions, :reselling, :boolean, :default => false    
      add_column :publisher_product_descriptions, :currently_not_available, :boolean, :default => false    
      add_column :publisher_product_descriptions, :evaluation_index, :integer    
      add_column :publisher_product_descriptions, :evaluation, :string    
      add_column :publisher_product_descriptions, :research_index, :integer    
      add_column :publisher_product_descriptions, :research, :string    
      add_column :publisher_product_descriptions, :public_relations_index, :integer    
      add_column :publisher_product_descriptions, :public_relations, :string    
      add_column :publisher_product_descriptions, :metrics_index, :integer    
      add_column :publisher_product_descriptions, :metrics, :string    
    
  end
end


#                  #:prod_tag_line,              # 10 words text    
#                  #:type_content_other,         # add string
#                  #:subject_category_other,     # add string
#                  #:topic,                      # remove string
#                  #:topic,                      # add text 25 words
#                  #:lesson_plan_subject,        # remove
#                  #:lesson_plan_subject,        # add text 25 words
#                  #:grade_index,                # remove
#                  #:grade,                      # remove
#                  #:grade_appropriate_index,    # add integer
#                  #:grade_appropriate,          # add string
#                  #:market_target_intex,        # add integer
#                  #:market_target,              # add string
#                  #:platform_other,             # add string
#                  #:file_type_index,            # add integer
#                  #:file_type,                  # add string
#                  #:file_type_other,            # add string
#                  #:updating_refresh_rate_index,# add integer
#                  #:updating_refresh_rate,      # add string
#                  #:updating_type_index,        # add integer
#                  #:updating_type,              # add string
#                  #:character_index,            # add integer
#                  #:character,                  # add string
#                  #:enhancements_index,         # add integer
#                  #:enhancements,               # add string
#                  #:price_model_1,              # add boolean default false
#                  #:price_model_1_text,         # add string
#                  #:price_model_2,              # add boolean default false
#                  #:price_model_2_text,         # add string
#                  #:price_model_3,              # add boolean default false
#                  #:price_model_3_text,         # add string
#                  #:price_model_4,              # add boolean default false
#                  #:price_model_4_text,         # add string
#                  #:price_model_5,              # add boolean default false
#                  #:price_model_5_text,         # add string
#                  #:price_model_6,              # add boolean default false
#                  #:price_model_6_text,         # add string
#                  #:price_model_7,              # add boolean default false
#                  #:price_model_7_text,         # add string
#                  #:price_model_8,              # add boolean default false
#                  #:price_model_8_text,         # add string
#                  #:price_model_9,              # add boolean default false
#                  #:price_model_9_text,         # add string
#                  #:price_model_10,             # add boolean default false
#                  #:price_model_10_tex,t        # add string
#                  #:price_model_11,             # add boolean default false
#                  #:price_model_11_text,        # add string
#                  #:reselling,                  # add boolean
#                  #:currently_not_available,    # add boolean
#                  #:evaluation_index,           # add integer
#                  #:evaluation,                 # add string
#                  #:research_index,             # add integer
#                  #:research,                   # add string
#                  #:public_relations_index,     # add integer
#                  #:public_relations,           # add string
#                  #:metrics_index,              # add integer
#                  #:metrics,                    # add string                  
