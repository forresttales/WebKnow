# == Schema Information
#
# Table name: publisher_product_descriptions
#
#  id                     :integer          not null, primary key
#  publisher_product_id   :integer
#  publisher_id           :integer
#  description            :string(1000)
#  price                  :decimal(8, 2)
#  created_at             :datetime
#  updated_at             :datetime
#  type_content           :string(50)
#  subject_category       :string(50)
#  type_content_index     :integer
#  subject_category_index :integer
#  name_product           :string(100)
#  core_supplemental      :string(50)
#  source_url             :string(300)
#  topic                  :string(200)
#  lesson_plan_subject    :string(300)
#  word_description       :text
#  age_appropriate        :string(50)
#  age_appropriate_index  :integer
#  grade                  :string(50)
#  grade_index            :integer
#  metadata               :text
#  platform               :string(50)
#  platform_index         :integer
#  versions               :string(300)
#  pricing_model          :string(50)
#  pricing_model_index    :integer
#

class PublisherProductDescription < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_product_id,
                  :publisher_id,
                  :description,
                  :price,
                  :type_content_index,
                  :subject_category_index,                  
                  :type_content,
                  :subject_category,
                  :word_description,
                  :name_product,
                  :core_supplemental, 
                  :source_url, 
                  :topic,
                  :lesson_plan_subject, 
                  :word_description, 
                  :age_appropriate, 
                  :age_appropriate_index, 
                  :grade, 
                  :grade_index, 
                  :metadata,  
                  :platform, 
                  :platform_index,
                  :versions, 
                  :pricing_model, 
                  :pricing_model_index, 
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher_product

  
end
