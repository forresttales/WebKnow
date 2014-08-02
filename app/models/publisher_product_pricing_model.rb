# == Schema Information
#
# Table name: publisher_product_pricing_models
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  pricing_model_1                  :boolean          default(FALSE)
#  pricing_model_2                  :boolean          default(FALSE)
#  pricing_model_3                  :boolean          default(FALSE)
#  pricing_model_4                  :boolean          default(FALSE)
#  pricing_model_5                  :boolean          default(FALSE)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductPricingModel < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :pricing_model_1,
                  :pricing_model_2,
                  :pricing_model_3,
                  :pricing_model_4,
                  :pricing_model_5,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_pricing_models")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_pricing_models_id_seq RESTART WITH 1")
  end

  
end
