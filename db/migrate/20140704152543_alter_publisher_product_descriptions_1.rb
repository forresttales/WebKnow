class AlterPublisherProductDescriptions1 < ActiveRecord::Migration
  def change

      remove_column("publisher_product_descriptions", "name_product")    
      add_column :publisher_product_descriptions, :name_product, :string    
    
      remove_column("publisher_product_descriptions", "description")    
      add_column :publisher_product_descriptions, :description, :text    

      remove_column("publisher_product_descriptions", "type_content")    
      add_column :publisher_product_descriptions, :type_content, :string    

      remove_column("publisher_product_descriptions", "type_content_index")    
      add_column :publisher_product_descriptions, :type_content_index, :integer, :default => 0    

      remove_column("publisher_product_descriptions", "subject_category")    
      add_column :publisher_product_descriptions, :subject_category, :string    

      remove_column("publisher_product_descriptions", "subject_category_index")    
      add_column :publisher_product_descriptions, :subject_category_index, :integer, :default => 0    

      remove_column("publisher_product_descriptions", "core_supplemental")    
      add_column :publisher_product_descriptions, :core_supplemental, :string    
      add_column :publisher_product_descriptions, :core_supplemental_index, :integer, :default => 0    

      remove_column("publisher_product_descriptions", "source_url")    
      add_column :publisher_product_descriptions, :source_url, :string    

      remove_column("publisher_product_descriptions", "topic")    
      add_column :publisher_product_descriptions, :topic, :string    

      remove_column("publisher_product_descriptions", "lesson_plan_subject")    
      add_column :publisher_product_descriptions, :lesson_plan_subject, :string    

      remove_column("publisher_product_descriptions", "age_appropriate")    
      add_column :publisher_product_descriptions, :age_appropriate, :string    

      remove_column("publisher_product_descriptions", "age_appropriate_index")    
      add_column :publisher_product_descriptions, :age_appropriate_index, :integer, :default => 0    

      remove_column("publisher_product_descriptions", "grade")    
      add_column :publisher_product_descriptions, :grade, :string    

      remove_column("publisher_product_descriptions", "grade_index")    
      add_column :publisher_product_descriptions, :grade_index, :integer, :default => 0    

      remove_column("publisher_product_descriptions", "platform")    
      add_column :publisher_product_descriptions, :platform, :string    

      remove_column("publisher_product_descriptions", "platform_index")    
      add_column :publisher_product_descriptions, :platform_index, :integer, :default => 0    

      remove_column("publisher_product_descriptions", "versions")    
      add_column :publisher_product_descriptions, :versions, :string    

      remove_column("publisher_product_descriptions", "pricing_model")    
      add_column :publisher_product_descriptions, :pricing_model, :string    

      remove_column("publisher_product_descriptions", "pricing_model_index")    
      add_column :publisher_product_descriptions, :pricing_model_index, :integer, :default => 0    
    
  end
end


#  id                     :integer          not null, primary key
#  publisher_product_id   :integer
#  publisher_id           :integer
#  name_product           :string(100)        x
#  description            :string(1000)       x
#  price                  :decimal(8, 2)
#  created_at             :datetime
#  updated_at             :datetime
#  type_content           :string(50)         x
#  type_content_index     :integer            x
#  subject_category       :string(50)         x
#  subject_category_index :integer            x
#  core_supplemental      :string(50)         x
#  source_url             :string(300)        x
#  topic                  :string(200)        x
#  lesson_plan_subject    :string(300)        x
#  word_description       :text
#  age_appropriate        :string(50)         x
#  age_appropriate_index  :integer            x
#  grade                  :string(50)         x
#  grade_index            :integer            x
#  metadata               :text
#  platform               :string(50)         x
#  platform_index         :integer            x
#  versions               :string(300)        x
#  pricing_model          :string(50)         x
#  pricing_model_index    :integer            x
