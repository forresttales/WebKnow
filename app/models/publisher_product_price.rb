# == Schema Information
#
# Table name: publisher_product_prices
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  price_1                          :boolean          default(FALSE)
#  price_1_dec                      :decimal(8, 2)    default(0.0)
#  price_2                          :boolean          default(FALSE)
#  price_2_dec                      :decimal(8, 2)    default(0.0)
#  price_3                          :boolean          default(FALSE)
#  price_3_dec                      :decimal(8, 2)    default(0.0)
#  price_4                          :boolean          default(FALSE)
#  price_4_dec                      :decimal(8, 2)    default(0.0)
#  price_5                          :boolean          default(FALSE)
#  price_5_dec                      :decimal(8, 2)    default(0.0)
#  price_6                          :boolean          default(FALSE)
#  price_6_dec                      :decimal(8, 2)    default(0.0)
#  price_7                          :boolean          default(FALSE)
#  price_7_dec                      :decimal(8, 2)    default(0.0)
#  price_8                          :boolean          default(FALSE)
#  price_8_dec                      :decimal(8, 2)    default(0.0)
#  price_9                          :boolean          default(FALSE)
#  price_9_dec                      :decimal(8, 2)    default(0.0)
#  price_10                         :boolean          default(FALSE)
#  price_10_dec                     :decimal(8, 2)    default(0.0)
#  price_11                         :boolean          default(FALSE)
#  price_11_dec                     :decimal(8, 2)    default(0.0)
#  price_12                         :boolean          default(FALSE)
#  price_12_dec                     :decimal(8, 2)    default(0.0)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductPrice < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :price_1,
                  :price_1_dec,
                  :price_2,
                  :price_2_dec,
                  :price_3,
                  :price_3_dec,
                  :price_4,
                  :price_4_dec,
                  :price_5,
                  :price_5_dec,
                  :price_6,
                  :price_6_dec,
                  :price_7,
                  :price_7_dec,
                  :price_8,
                  :price_8_dec,
                  :price_9,
                  :price_9_dec,
                  :price_10,
                  :price_10_dec,
                  :price_11,
                  :price_11_dec,
                  :price_12,
                  :price_12_dec,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_prices")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_prices_id_seq RESTART WITH 1")
  end

  
end
