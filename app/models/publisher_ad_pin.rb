# == Schema Information
#
# Table name: publisher_ad_pins
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  user_id              :integer          default(0)
#  publisher_id         :integer          default(0)
#  publisher_product_id :integer          default(0)
#  ad_amount            :decimal(8, 2)    default(0.0)
#  name_product         :string(255)
#  poster               :string(255)
#  poster_index         :integer          default(0)
#  category             :string(255)
#  category_index       :integer          default(0)
#  term_pin             :integer          default(0)
#  ad_date_exp          :datetime
#  ad_date_init         :datetime
#

class PublisherAdPin < ActiveRecord::Base
  
  attr_accessible :user_id,
                  :publisher_id,
                  :publisher_product_id,
                  :ad_amount,
                  :name_product,
                  :poster,
                  :poster_index,
                  :category,
                  :category_index,
                  :term_pin,
                  :ad_date_exp,
                  :ad_date_init

  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_ad_pins")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_ad_pins_id_seq RESTART WITH 1")
  end

  
end
