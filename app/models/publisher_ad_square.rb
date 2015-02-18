# == Schema Information
#
# Table name: publisher_ad_squares
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
#  term_square          :integer          default(0)
#  keyword              :string(255)
#  cost_keyword         :decimal(8, 2)    default(0.0)
#  ad_date_exp          :datetime
#  ad_date_init         :datetime
#

class PublisherAdSquare < ActiveRecord::Base
  
  attr_accessible :user_id,
                  :publisher_id,
                  :publisher_product_id,
                  :ad_amount,
                  :name_product,
                  :poster,
                  :poster_index,
                  :term_square,
                  :keyword,
                  :cost_keyword,
                  :ad_date_exp,
                  :ad_date_init

  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_ad_squares")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_ad_squares_id_seq RESTART WITH 1")
  end

  
end
