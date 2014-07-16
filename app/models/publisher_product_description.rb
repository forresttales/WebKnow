# == Schema Information
#
# Table name: publisher_product_descriptions
#
#  id                      :integer          not null, primary key
#  publisher_product_id    :integer
#  publisher_id            :integer
#  price                   :decimal(8, 2)
#  created_at              :datetime
#  updated_at              :datetime
#  word_description        :text
#  metadata                :text
#  name_product            :string(255)
#  description             :text
#  type_content            :string(255)
#  type_content_index      :integer          default(0)
#  subject_category        :string(255)
#  subject_category_index  :integer          default(0)
#  core_supplemental       :string(255)
#  core_supplemental_index :integer          default(0)
#  source_url              :string(255)
#  topic                   :string(255)
#  lesson_plan_subject     :string(255)
#  age_appropriate         :string(255)
#  age_appropriate_index   :integer          default(0)
#  grade                   :string(255)
#  grade_index             :integer          default(0)
#  platform                :string(255)
#  platform_index          :integer          default(0)
#  versions                :string(255)
#  pricing_model           :string(255)
#  pricing_model_index     :integer          default(0)
#  core_literacy_standard  :string(255)
#  core_math_standard      :string(255)
#  slugged                 :string(255)      default("")
#

class PublisherProductDescription < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_product_id,
                  :publisher_id,
                  :description,
                  :name_product,
                  :type_content_index,
                  :type_content,
                  :subject_category_index,                  
                  :subject_category,
                  :core_supplemental_index, 
                  :core_supplemental, 
                  :age_appropriate_index, 
                  :age_appropriate, 
                  :grade_index, 
                  :grade, 
                  :platform_index,
                  :platform, 
                  :pricing_model_index,
                  :pricing_model, 
                  :metadata,  
                  :price,
                  :lesson_plan_subject, 
                  :word_description, 
                  :versions, 
                  :source_url, 
                  :topic,
                  :core_literacy_standard,
                  :core_math_standard,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher_product


  # extend FriendlyId
  # friendly_id :id, use: :slugged

  # def id
    # [
      # :id
    # ]
  # end  

  # def to_param
    # "#{id}"
  # end

  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_descriptions")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_descriptions_id_seq RESTART WITH 1")
  end

  
end
